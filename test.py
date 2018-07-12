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


# import numpy as np
# import pandas as pd
# import matplotlib
# matplotlib.use('TkAgg')
# import matplotlib.pyplot as plt
# import tellurium as te
#
# r = te.loada ('''
# #$Xo -> S1; #1 + Xo*(32+(S1/0.75)^3.2)/(1 +(S1/4.3)^3.2);
# S1 -> $X1; k1*S1;
#
# X1 = 0.0;
# S1 = 0.5; k1 = 0;
# ''')
# #print(r.selections)
#
# initValue = 2.0
# m = r.simulate(0, 2, 3, selections=["time", "S1"])
# #print(m)
#
#
# for i in range(0,2):
#     #r.reset()
#     r['k1'] = initValue
#     res = r.simulate(0, 2, 3, selections=["S1"])
#     m = np.concatenate([m, res], axis=1)
#     #initValue += 1
#     print(m)
#     print(r['k1'])
#     print(initValue)
#
#
# #te.plotArray(m, color="black", alpha=0.7, loc=None,
# #             xlabel="time", ylabel="[S1]", title="Bistable system");
#
#
#
# # # Load SBML file
# # r = te.loada("""
# # model test
# #     J0: X0 -> X1; k1*X0;
# #     X0 = 10; X1=0;
# #     k1 = 0.2
# # end
# # """)
# #
# # import matplotlib.pyplot as plt
# #
# # # Turn of notices so they don't clutter the output
# #
# # for i in range(0, 3):
# #     result = r.simulate (0, 3,3)
# #     #r.reset()
# #     r.k1 = r.k1 + 0.2
# #     print(result)
# #     print(r.k1)
# # # Turn the notices back on

import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from functions_onlinedata import online
from models import batch_model
from models import fed_batch_model
from experiments import data
from parest_copasi import parameter_estimation
import os
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


r = batch_model_mu()

d = {'0' : 0., '1' : 1., '2' : 2., '3' : np.NaN}
mu = pd.Series(d)
r.mu = mu[0]
r.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']

data2 = {'0' : 0., '1' : 1., '2' : 2. ,'3' : 3}
selected_time_decimals_hours = pd.Series(data2)

starttime = selected_time_decimals_hours[0]
endtime = selected_time_decimals_hours.iloc[1]
results = r.simulate(starttime, endtime, 2)

initialvalues = results[0:1]
dataframe = pd.DataFrame(initialvalues)
dataframe.columns = ['time','glucose', 'serine','biomass','mu']
#print(dataframe)



for i in range(0, (len(mu)-2)):

    r.mu = mu[i+1]
    starttime = selected_time_decimals_hours[i]
    endtime = selected_time_decimals_hours[i+1]
    results = r.simulate(starttime, endtime, 2)
    simulated_row = results[-1:]
    new_dataframe = pd.DataFrame(simulated_row)
    new_dataframe.columns = ['time','glucose', 'serine','biomass','mu']
    dataframe = dataframe.append(new_dataframe,ignore_index = True)
    #print(starttime)
    #print(endtime)
    #print(results)
    #print(results)
    #print(simulated_row)
    #print(new_dataframe)
    #print(dataframe)
    print(i)


print(dataframe)





















