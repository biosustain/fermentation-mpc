import warnings
warnings.filterwarnings("ignore", message="numpy.dtype size changed")
warnings.filterwarnings("ignore", message="numpy.ufunc size changed")

import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.graph_objs as go
import pandas as pd

from functions_fermentation_tool import data_to_mass
from functions_fermentation_tool import stack_data

from dash.dependencies import Input, Output
#from loremipsum import get_sentences


#import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
#import matplotlib.pyplot as plt
#from models import batch_model
#from models import fed_batch_model
#from experiments import data
#from parest_copasi import parameter_estimation
#from parest_copasi import parameter_estimation_online
import os
#import sys
#import time
#import datetime
import numpy as np
#from plotly import tools
#import plotly
#import plotly.graph_objs as go
#import tellurium as te
#from models import batch_model_mu
#from openpyxl.workbook import Workbook
#import xlwings as xw
#from openpyxl import load_workbook
#from openpyxl.utils.dataframe import dataframe_to_rows
from monitoring import monitoring
import threading

from threading import Lock
lock = Lock()



file = '/Users/s144510/Documents/fermentationtool/data/C002_R3_overview.xlsm'  #'data/C002_R3_overview.xlsm'

xl = pd.ExcelFile(file)


# Loads the sheet we want to work with
df1 = xl.parse('Off line measurements')


# This is used for the experiment section
df, available_indicators = stack_data(df1)


# This is used for the mass section
mass_sheet, available_indicatorsMASS = data_to_mass(df1)


# Create output dataframe
output = pd.DataFrame(columns =  ['time', 'glucose', 'serine', 'biomass', 'mu'])
writer = pd.ExcelWriter('/Users/s144510/Documents/fermentationtool/output.xlsx')
output.to_excel(writer, 'Sheet1', index=False)
writer.save()


# The actual application starts here

app = dash.Dash()

# evt slet det neden under??
# For the online data integration
# file = '/Users/s144510/Documents/fermentationtool/output.xlsx'
# output = pd.ExcelFile(file)
#
# # Loads the sheet we want to work with
# dataframe_output = output.parse('Sheet1')
# online_data_sheet, available_indicators_online = stack_data(dataframe_output)




# try: '/Users/s144510/Documents/fermentationtool/mu.xlsx'
# except NameError: '/Users/s144510/Documents/fermentationtool/mu.xlsx' = None



# if os.path.isfile('./Users/s144510/Documents/fermentationtool/mu.xlsx') is False:
#     timeinterval = 30*1000
#
# else:
#     output_values = '/Users/s144510/Documents/fermentationtool/mu.xlsx'
#     output_values = pd.ExcelFile(output_values)
#     # Loads the sheet we want to work with
#     mu_values = output_values.parse('Sheet1')
#
#
#     data_frame_values = '/Users/s144510/Documents/fermentationtool/data_online_integration.xlsx'
#     data_frame_values = pd.ExcelFile(data_frame_values)
#
#     # Loads the sheet we want to work with
#     data_frame = data_frame_values.parse('Sheet1')
#     data_frame = pd.DataFrame(data_frame)
#
#     timeinterval = 2*((30 * ((len(mu_values) - len(data_frame['mu']))+1))*1000)




app.scripts.config.serve_locally = True  # tabs

app.layout = html.Div([
    html.H1('Fermentation modelling and optimization', style={
        'textAlign': 'center', 'margin': '40px 0', 'fontFamily': 'system-ui'}),
    html.Div(
        dcc.Tabs(
            children=[
                dcc.Tab(label='Experiments', children=[
                    html.Div([
                        html.Div([
                            html.H2("Generate the plot"),
                            html.Div([
                                dcc.Dropdown(
                                    id='crossfilter-xaxis-column',
                                    options=[{'label': i, 'value': i} for i in available_indicators],
                                    placeholder="Select the x-axis",
                                    value='Time (hours)'),
                            ],
                                style={'width': '25%', 'display': 'inline-block'}),

                            html.Div([
                                dcc.Dropdown(
                                    id='crossfilter-yaxis-column',
                                    options=[{'label': i, 'value': i} for i in available_indicators],
                                    placeholder="Select the y-axis",
                                    value='Glucose ( g/L)'),
                            ],
                                style={'width': '25%', 'display': 'inline-block'})],

                            style={
                                'borderBottom': 'thin lightgrey solid',
                                'backgroundColor': 'rgb(250, 250, 250)',
                                'padding': '10px 5px'}),
                        # This section makes makes the design and placement of the dropdown menues and the title Serine project.

                        html.Div([
                            dcc.Graph(
                                id='crossfilter-indicator-scatter')
                        ],
                            style={'width': '200%', 'display': 'inline-block', 'padding': '0 20'})])
                ]),
                dcc.Tab(label='Balancing Region', children=[
                    html.Div([
                        html.H2("Balancing Region"),

                        html.Div([
                            dcc.Dropdown(
                                id='choose-products',
                                options=[{'label': i, 'value': i} for i in available_indicators],
                                placeholder="Select the products",
                                multi=True),
                            html.Div(id='output-products'),
                        ],
                            style={'width': '25%', 'display': 'inline-block'}),

                        html.Div([
                            dcc.Dropdown(
                                id='choose-substrates',
                                options=[{'label': i, 'value': i} for i in available_indicators],
                                placeholder="Select the substrates",
                                multi=True),
                            html.Div(id='output-substrates'),
                        ],

                            style={'width': '25%', 'display': 'inline-block'})
                    ],

                        # generate space under dropdown where text should be outputted

                        style={
                            'borderBottom': 'thin lightgrey solid',
                            'backgroundColor': 'rgb(250, 250, 250)',
                            'padding': '10px 5px'})
                ]),
                dcc.Tab(label='Mass Plot', children=[
                    html.Div([
                        html.Div([
                            html.H2("Generate the plot"),
                            html.Div([
                                dcc.Dropdown(
                                    id='crossfilter-xaxis-columnMASS',
                                    options=[{'label': i, 'value': i} for i in available_indicatorsMASS],
                                    placeholder="Select the x-axis",
                                    value='Time (hours)'),
                            ],
                                style={'width': '25%', 'display': 'inline-block'}),

                            html.Div([
                                dcc.Dropdown(
                                    id='crossfilter-yaxis-columnMASS',
                                    options=[{'label': i, 'value': i} for i in available_indicatorsMASS],
                                    placeholder="Select the y-axis",
                                    value='Glucose (g)')
                            ],
                                style={'width': '25%', 'display': 'inline-block'})],

                            style={
                                'borderBottom': 'thin lightgrey solid',
                                'backgroundColor': 'rgb(250, 250, 250)',
                                'padding': '10px 5px'}),
                        # This section makes the design and placement of the dropdown menues and the title Serine project.

                        html.Div([
                            dcc.Graph(
                                id='crossfilter-indicator-scatterMASS')
                        ],
                            style={'width': '100%', 'display': 'inline-block', 'padding': '0 20'})]
                    )
                ]),
                dcc.Tab(label='Online data integration (1 reactor)', children=[
                    html.Div([
                        html.H2('Model prediction'),
                        dcc.Graph(id='live-update-graph'),
                        dcc.Interval(
                            id='interval-component',
                            interval=2*60*1000, #timeinterval,  # in milliseconds
                            n_intervals=0
                        )
                    ],
                        style={
                            'borderBottom': 'thin lightgrey solid',
                            'backgroundColor': 'rgb(250, 250, 250)',
                            'padding': '10px 5px',
                            'width': '180%'})
                ])
            ],
            value=1,  # Sets the default value
            id='tabs',
            vertical = True,
        ),
        style={'width': '100%', 'float': 'center'}
    )])


# the balancing region

app.config[
    'suppress_callback_exceptions'] = True  # Because we are assigning callbacks to components that are generated by other callbakcs we have to supress the exception


@app.callback(
    dash.dependencies.Output('output-products', 'children'),
    [dash.dependencies.Input('choose-products', 'value')])
def update_output(value):
    return 'You have selected "{}" as products'.format(value)


@app.callback(
    dash.dependencies.Output('output-substrates', 'children'),
    [dash.dependencies.Input('choose-substrates', 'value')])
def update_output(value):
    return 'You have selected "{}" as substrates'.format(value)


# the experiment

app.config['suppress_callback_exceptions'] = True


@app.callback(
    dash.dependencies.Output('crossfilter-indicator-scatter', 'figure'),
    [dash.dependencies.Input('crossfilter-xaxis-column', 'value'),
     dash.dependencies.Input('crossfilter-yaxis-column', 'value')])
def update_graph(xaxis_column_name, yaxis_column_name):
    return {
        'data': [go.Scatter(
            x=df[df['Variables'] == xaxis_column_name]['Value'],
            y=df[df['Variables'] == yaxis_column_name]['Value'],
            mode='markers',
            marker={
                'size': 15,
                'opacity': 0.5,
                'line': {'width': 0.5, 'color': 'white'}
            }
        )],
        'layout': go.Layout(
            xaxis={
                'title': xaxis_column_name,
            },
            yaxis={
                'title': yaxis_column_name,
            },
            margin={'l': 40, 'b': 30, 't': 10, 'r': 0},
            height=450,
            hovermode='closest'
        )
    }


# The mass plot

app.config['suppress_callback_exceptions'] = True


@app.callback(
    dash.dependencies.Output('crossfilter-indicator-scatterMASS', 'figure'),
    [dash.dependencies.Input('crossfilter-xaxis-columnMASS', 'value'),
     dash.dependencies.Input('crossfilter-yaxis-columnMASS', 'value')])
def update_graph(xaxis_column_name, yaxis_column_name):
    return {
        'data': [go.Scatter(
            x=mass_sheet[mass_sheet['Variables'] == xaxis_column_name]['Value'],
            y=mass_sheet[mass_sheet['Variables'] == yaxis_column_name]['Value'],
            mode='markers',
            marker={
                'size': 15,
                'opacity': 0.5,
                'line': {'width': 0.5, 'color': 'white'}
            }
        )],
        'layout': go.Layout(
            xaxis={
                'title': xaxis_column_name,
            },
            yaxis={
                'title': yaxis_column_name,
            },
            margin={'l': 40, 'b': 30, 't': 10, 'r': 0},
            height=450,
            hovermode='closest'
        )
    }

# The online data integration


@app.callback(Output('live-update-graph', 'figure'),
              [Input('interval-component', 'n_intervals')])
def update_graph_live(n):
    def foo():
        with lock:
            filename_experimental_data1 = "data/R1_data_in_moles.csv"
            filename_experimental_data2 = "data/R2_data_in_moles.csv"
            alpha_lower_bound = "0"
            alpha_upper_bound = "100"
            beta_lower_bound = "0"
            beta_upper_bound = "100"

            watch_file = '/Users/s144510/Documents/fermentationtool/data/MUX_09-03-2018_18-38-27.XLS'
            online_data = pd.ExcelFile(watch_file)
            online_data = online_data.parse('Sheet1')
            fig = monitoring(online_data,filename_experimental_data1,filename_experimental_data2,alpha_lower_bound,
                             alpha_upper_bound, beta_lower_bound,beta_upper_bound)

        return fig
    fig = foo()
    return fig



if __name__ == '__main__':
    app.run_server(debug=True)
# press ctrl c to stop it from running

try:
    os.remove('/Users/s144510/Documents/fermentationtool/output.xlsx')
    os.remove('/Users/s144510/Documents/fermentationtool/mu.xlsx')
except OSError:
    pass
