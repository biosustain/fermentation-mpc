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

# From cps to xml
os.rename('model_copasi.cps', 'model_copasi.xml')

soup = BeautifulSoup(open('model_copasi.xml', 'r'), 'xml')
infile = open('model_copasi.xml', "w")

# Choose filename for experimental dataset nr 1
Experiment_0 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "Experiment"][0]
file_name = [s for s in Experiment_0.find_all("Parameter") if s["name"] == "File Name"][0]
file_name["value"] = "data/R1_data_in_moles.csv"

# Choose filename for experimental dataset nr 2
Experiment_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "Experiment_1"][0]
file_name = [s for s in Experiment_1.find_all("Parameter") if s["name"] == "File Name"][0]
file_name["value"] = "data/R2_data_in_moles.csv"

# Parameters:

parameter_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][0]
lower_bound_1 = [s for s in parameter_1.find_all('Parameter') if s['name'] == "LowerBound"][0]
lower_bound_1['value'] = "0"
upper_bound_1 = [s for s in parameter_1.find_all('Parameter') if s['name'] == "UpperBound"][0]
upper_bound_1['value'] = "100"

parameter_2 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][1]
lower_bound_2 = [s for s in parameter_2.find_all('Parameter') if s['name'] == "LowerBound"][0]
lower_bound_2['value'] = "0"
upper_bound_2 = [s for s in parameter_2.find_all('Parameter') if s['name'] == "UpperBound"][0]
upper_bound_2['value'] = "100"

parameter_3 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][2]
lower_bound_3 = [s for s in parameter_3.find_all('Parameter') if s['name'] == "LowerBound"][0]
lower_bound_3['value'] = "0"
upper_bound_3 = [s for s in parameter_3.find_all('Parameter') if s['name'] == "UpperBound"][0]
upper_bound_3['value'] = "100"

parameter_4 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][3]
lower_bound_4 = [s for s in parameter_4.find_all('Parameter') if s['name'] == "LowerBound"][0]
lower_bound_4['value'] = "0"
upper_bound_4 = [s for s in parameter_4.find_all('Parameter') if s['name'] == "UpperBound"][0]
upper_bound_4['value'] = "100"

infile.write(soup.prettify().encode(soup.original_encoding))
infile.close()

# From xml to cps
os.rename('model_copasi.xml', 'model_copasi.cps')

# Run the parameterestimation in Copasi for the model from the terminal
# Find the path to CopasiSE, it could be the path given below in the comment
# os.system("/Applications/COPASI/CopasiSE model_copasi.cps --save model_copasi.cps")
os.system("/Users/s144510/Documents/fermentationtool/CopasiSE model_copasi.cps --save model_copasi.cps")

# Get the results
os.rename('model_copasi.cps', 'model_copasi.xml')
soup = BeautifulSoup(open('model_copasi.xml', 'r'), 'xml')

result_parameter_1 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][0]
result_parameter_1 = [s for s in result_parameter_1.find_all('Parameter') if s['name'] == "StartValue"][0]
alpha = result_parameter_1['value']

result_parameter_2 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][1]
result_parameter_2 = [s for s in result_parameter_2.find_all('Parameter') if s['name'] == "StartValue"][0]
beta = result_parameter_2['value']

result_parameter_3 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][2]
result_parameter_3 = [s for s in result_parameter_3.find_all('Parameter') if s['name'] == "StartValue"][0]
kc = result_parameter_3['value']

result_parameter_4 = [s for s in soup.find_all('ParameterGroup') if s["name"] == "FitItem"][3]
result_parameter_4 = [s for s in result_parameter_4.find_all('Parameter') if s['name'] == "StartValue"][0]
mu_max = result_parameter_4['value']

print(alpha,beta,kc,mu_max)

infile.close()
os.rename('model_copasi.xml', 'model_copasi.cps')




















