# import datetime
#
# import dash
# import dash_core_components as dcc
# import dash_html_components as html
# import plotly
# from dash.dependencies import Input, Output
#
# # pip install pyorbital
# from pyorbital.orbital import Orbital
#
# satellite = Orbital('TERRA')
#
# app = dash.Dash(__name__)
# app.layout = html.Div(
#     html.Div([
#         html.H4('Model prediction'),
#         html.Div(id='live-update-text'),
#         dcc.Graph(id='live-update-graph'),
#         dcc.Interval(
#             id='interval-component',
#             interval=1 * 1000,  # in milliseconds
#             n_intervals=0
#         )
#     ])
# )
#
#
# @app.callback(Output('live-update-text', 'children'),
#               [Input('interval-component', 'n_intervals')])
# def update_metrics(n):
#     lon, lat, alt = satellite.get_lonlatalt(datetime.datetime.now())
#     style = {'padding': '5px', 'fontSize': '16px'}
#     return [
#         html.Span('Longitude: {0:.2f}'.format(lon), style=style),
#         html.Span('Latitude: {0:.2f}'.format(lat), style=style),
#         html.Span('Altitude: {0:0.2f}'.format(alt), style=style)
#     ]
#
#
# mu = 1
#
#
# # Multiple components can update everytime interval gets fired.
# @app.callback(Output('live-update-graph', 'figure'),
#               [Input('interval-component', 'n_intervals')])
# def update_graph_live(n):
#     satellite = Orbital('TERRA')
#     data = {
#         'time': [],
#         'Latitude': [],
#         'Longitude': [],
#         'Altitude': []
#     }
#
#     # Collect some data
#     for i in range(180):
#         time = datetime.datetime.now() - datetime.timedelta(seconds=i * 20)
#         lon, lat, alt = satellite.get_lonlatalt(
#             time
#         )
#         data['Longitude'].append(lon)
#         data['Latitude'].append(lat)
#         data['Altitude'].append(alt)
#         data['time'].append(time)
#
#     # Create the graph with subplots
#     fig = plotly.tools.make_subplots(rows=2, cols=1, vertical_spacing=0.2)
#     fig['layout']['margin'] = {
#         'l': 30, 'r': 10, 'b': 30, 't': 10
#     }
#     fig['layout']['legend'] = {'x': 0, 'y': 1, 'xanchor': 'left'}
#
#     fig.append_trace({
#         'x': data['time'],
#         'y': data['Altitude'],
#         'name': 'Altitude',
#         'mode': 'lines+markers',
#         'type': 'scatter'
#     }, 1, 1)
#     fig.append_trace({
#         'x': data['Longitude'],
#         'y': data['Latitude'],
#         'text': data['time'],
#         'name': 'Longitude vs Latitude',
#         'mode': 'lines+markers',
#         'type': 'scatter'
#     }, 2, 1)
#
#     return fig
#
#
# if __name__ == '__main__':
#     app.run_server(debug=True)



import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from models import batch_model
from models import fed_batch_model
from experiments import data
from parest_copasi import parameter_estimation
import sys
import time
import datetime
#from datetime import datetime, date
import numpy as np
from plotly import tools
import plotly
import plotly.graph_objs as go
import tellurium as te
from models import batch_model_mu
import os
from bs4 import BeautifulSoup
from ast import literal_eval

fermentation_model = '''
    model *IDModel()

        ######## Set the compartment to 1, otherwise it will be multiplied by the compounds. 
        compartment comp1;
        comp1 =1;


        ######## Specify the species in the compartment
        glucose in comp1; serine in comp1; biomass in comp1;


        ######## Constants
        alpha = 21.5 #29.1 #21.542 #24.6807; # Check units
        beta = 90.3 #68.8 #90.2844 #67.3047; # Check units
        mu_max = 0.3 #0.98 #0.327912 #0.260172; # [1/h]
        kc = 1.2 #7.48 #1.24659 #1.05221; # [mol/kg] # Kc? 
        a = -0.2572;
        b = -0.7651;
        ms = -0.0046; 


        ######## Initial conditions
        glucose = 8.254856e-06*1000 # [mol] 
        serine = 0 #c_serine0*comp1 # [mol]
        biomass = 5.538306e-07*1000 # [mol]
        v0 = 0.00010428; #[m^3]


        ######## Function for volume
        v := 0.00010302999999999999-(0.00000121*time) #[m^3]

        ######## Concentrations that is used in the equations
        c_glucose := glucose/v  # [mol/m^3]
        c_biomass := biomass/v # [mol/m^3] 

        ######## Functions
        mu := mu_max*(c_glucose/((kc*c_biomass)+c_glucose)) # [1/h]
        #qp_s := alpha*mu/(beta+mu) # [mol_serine/(c-mol_biomass*h)]
        #qs_g := a*mu + b*qp_s + ms #[mol_glucose/(c-mol_biomass*h)]
        rp_s = 0.5 #qp_s*biomass # [mol/h] 
        r_s = 0.5 #qs_g*biomass # [mol/h]


        ######## Mass Balances    
        eq_biomass: -> biomass; mu*biomass # [c-mol/h]
        eq_serine: -> serine; rp_s
        eq_glucose: -> glucose; r_s # [mol/h]



        end
    
'''

r = te.loada(fermentation_model)
#r.exportToSBML('TEST-delete.xml')

# We can set the lists so it has the same order as the data
#r.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']

#results = r.simulate(2, 23.5, 100)

r.alpha = 0
r.beta = 3.56
r.kc = 0
r.mu_max = 0.2

# We can set the lists so it has the same order as the data
r.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']

results = r.simulate(2, 23.5, 100)

#  Load the experimental data set


# Set filename of the two experimental datasets
filename_experimental_data1 = "data/R1_data_in_moles.csv"
filename_experimental_data2 = "data/R2_data_in_moles.csv"

# Experimental data set 1
experimental_data = pd.read_csv(filename_experimental_data1)
experimental_data = data(experimental_data)

# Experimental data set 2
experimental_data2 = pd.read_csv(filename_experimental_data2)
experimental_data2 = data(experimental_data2)
#
# print(experimental_data)
# print(experimental_data2)
#
#
#  Plot of the results from the model and the experimental data
plt.figure(num=None, figsize=(11, 7), dpi=90, facecolor='w', edgecolor='k')
plt.suptitle('Plot of compounds', fontsize=16)

plt.subplot(2, 2, 1)
plt.plot(results[:, 0], (results[:, 3]))
plt.scatter(experimental_data['Time (hours)'], experimental_data['C-mol-Biomass'])
plt.scatter(experimental_data2['Time (hours)'], experimental_data2['C-mol-Biomass'])
plt.legend(['Biomass from model', 'Biomass from data'], loc='upper left')
plt.xlabel('Time (hours)')
plt.ylabel('Biomass (c-mole)')

plt.subplot(2, 2, 2)
plt.plot(results[:, 0], results[:, 2])
plt.scatter(experimental_data['Time (hours)'], experimental_data['mol-Serine'])
plt.scatter(experimental_data2['Time (hours)'], experimental_data2['mol-Serine'])
plt.legend(['Serine from model', 'Serine from data'], loc='upper left')
plt.xlabel('Time (hours)')
plt.ylabel('Serine (mole)')

plt.subplot(2, 2, 3)
plt.plot(results[:, 0], results[:, 1])
plt.scatter(experimental_data['Time (hours)'], experimental_data['mol-Glucose'])
plt.scatter(experimental_data2['Time (hours)'], experimental_data2['mol-Glucose'])
plt.legend(['Glucose from model', 'Glucose from data'], loc='upper left')
plt.xlabel('Time (hours)')
plt.ylabel('Glucose (mole)')

plt.show()
