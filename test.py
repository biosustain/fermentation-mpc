import datetime

import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly
from dash.dependencies import Input, Output

# pip install pyorbital
from pyorbital.orbital import Orbital

satellite = Orbital('TERRA')

app = dash.Dash(__name__)
app.layout = html.Div(
    html.Div([
        html.H4('TERRA Satellite Live Feed'),
        html.Div(id='live-update-text'),
        dcc.Graph(id='live-update-graph'),
        dcc.Interval(
            id='interval-component',
            interval=1 * 1000,  # in milliseconds
            n_intervals=0
        )
    ])
)


@app.callback(Output('live-update-text', 'children'),
              [Input('interval-component', 'n_intervals')])
def update_metrics(n):
    lon, lat, alt = satellite.get_lonlatalt(datetime.datetime.now())
    style = {'padding': '5px', 'fontSize': '16px'}
    return [
        html.Span('Longitude: {0:.2f}'.format(lon), style=style),
        html.Span('Latitude: {0:.2f}'.format(lat), style=style),
        html.Span('Altitude: {0:0.2f}'.format(alt), style=style)
    ]


# Multiple components can update everytime interval gets fired.
@app.callback(Output('live-update-graph', 'figure'),
              [Input('interval-component', 'n_intervals')])
def update_graph_live(n):
    satellite = Orbital('TERRA')
    data = {
        'time': [],
        'Latitude': [],
        'Longitude': [],
        'Altitude': []
    }

    # Collect some data
    for i in range(180):
        time = datetime.datetime.now() - datetime.timedelta(seconds=i * 20)
        lon, lat, alt = satellite.get_lonlatalt(
            time
        )
        data['Longitude'].append(lon)
        data['Latitude'].append(lat)
        data['Altitude'].append(alt)
        data['time'].append(time)

    # Create the graph with subplots
    fig = plotly.tools.make_subplots(rows=2, cols=1, vertical_spacing=0.2)
    fig['layout']['margin'] = {
        'l': 30, 'r': 10, 'b': 30, 't': 10
    }
    fig['layout']['legend'] = {'x': 0, 'y': 1, 'xanchor': 'left'}

    fig.append_trace({
        'x': data['time'],
        'y': data['Altitude'],
        'name': 'Altitude',
        'mode': 'lines+markers',
        'type': 'scatter'
    }, 1, 1)
    fig.append_trace({
        'x': data['Longitude'],
        'y': data['Latitude'],
        'text': data['time'],
        'name': 'Longitude vs Latitude',
        'mode': 'lines+markers',
        'type': 'scatter'
    }, 2, 1)

    return fig


if __name__ == '__main__':
    app.run_server(debug=True)


# Import the packages

# The following should be installed
# pip install dash-core-components==0.13.0-rc5
# pip install loremipsum
#
# import dash
# import dash_core_components as dcc
# import dash_html_components as html
# import plotly.graph_objs as go
# import pandas as pd
# import json
#
# from functions import data_to_mass
# from functions import stack_data
#
# from dash.dependencies import Input, Output
# from loremipsum import get_sentences
#
# file = 'c002_r3_overview.xlsm'
#
# xl = pd.ExcelFile(file)
#
#
# # Loads the sheet we want to work with
# df1 = xl.parse('Off line measurements')
#
#
# # This is used for the experiment section
# df, available_indicators = stack_data(df1)
#
#
# # This is used for the mass section
# # Call the function
# mass_sheet, available_indicatorsMASS = data_to_mass(df1)
#
#
#
#
# # The actual application starts here
#
# app = dash.Dash()
#
# app.scripts.config.serve_locally = True  # tabs
#
#
# app.layout = html.Div([
#     html.Div(
#         dcc.Tabs(
#             tabs=[
#                 {'label': 'Experiments', 'value': 1},
#                 {'label': 'Balancing Region', 'value': 2},
#                 {'label': 'Mass Plot', 'value': 3}
#             ],
#             value=1,  # Sets the default value (maybe not neccesary)
#             id='tabs'
#         ),
#         style={'width': '20%', 'float': 'left'}
#     ),
#     html.Div(
#         html.Div(id='tab-output'),
#         style={'width': '80%', 'float': 'right'}
#     ),
#     html.Div(id='x', style={'display': 'none'}),
#     html.Div(id='y', style={'display': 'none'}),
#     html.Div(id='v', style={'display': 'none'})
# ], style={
#     'fontFamily': 'Sans-Serif',
#     'margin-left': 'auto',
#     'margin-right': 'auto'
# })
#
#
# @app.callback(Output('tab-output', 'children'), [Input('tabs', 'value')])
# def display_content(val):
#
#     if 1 == val:
#         return html.Div([
#             html.Div([
#                 html.H2("Generate the plot"),
#                 html.Div([
#                     dcc.Dropdown(
#                         id='crossfilter-xaxis-column',
#                         options=[{'label': i, 'value': i} for i in available_indicators],
#                         # label Makes the different options from the dataframe appear, and value can change to another
#                         placeholder="Select the x-axis",
#                         value='Time (hours)'),
#                 ],
#                     style={'width': '25%', 'display': 'inline-block'}),
#
#                 html.Div([
#                     dcc.Dropdown(
#                         id='crossfilter-yaxis-column',
#                         options=[{'label': i, 'value': i} for i in available_indicators],
#                         # value can later be defined in function - if false then just a string - if true then the value correspons to this in the option
#                         placeholder="Select the y-axis",
#                         value='Glucose ( g/L)'),
#                 ],
#                     style={'width': '25%', 'display': 'inline-block'})],
#
#                 style={
#                     'borderBottom': 'thin lightgrey solid',
#                     'backgroundColor': 'rgb(250, 250, 250)',
#                     'padding': '10px 5px'}),
#             # This section makes makes the design and placement of the dropdown menues and the title Serine project.
#
#             html.Div([
#                 dcc.Graph(
#                     id='crossfilter-indicator-scatter')
#             ],
#                 style={'width': '60%', 'display': 'inline-block', 'padding': '0 20'})])
#
#     if 2 == val:
#         return html.Div([
#             html.H2("Generate the plot"),
#             html.Div([
#                 dcc.Dropdown(
#                     id='x-axis-column',
#                     options=[{'label': i, 'value': i} for i in available_indicators],
#                     # label Makes the different options from the dataframe appear, and value is used in the callbacks and their corresponding functions
#                     placeholder="Select the x axis"),
#
#             ],
#                 style={'width': '25%', 'display': 'inline-block'}),
#
#             html.Div([
#                 dcc.Dropdown(
#                     id='y-axis-column',
#                     options=[{'label': i, 'value': i} for i in available_indicators],
#                     multi=False,
#                     placeholder="Select the y-axis"),
#
#             ],
#                 style={'width': '25%', 'display': 'inline-block'}),
#
#             html.Div([
#                 dcc.Dropdown(
#                     id='volume',
#                     options=[{'label': i, 'value': i} for i in available_indicators],
#                     # value can later be defined in function - if false then just a string - if true then the value correspons to this in the option
#                     placeholder="Select the volume"),
#             ],
#                 style={'width': '25%', 'display': 'inline-block'})],
#
#             style={
#                 'borderBottom': 'thin lightgrey solid',
#                 'backgroundColor': 'rgb(250, 250, 250)',
#                 'padding': '10px 5px'})  # This section makes makes the design and placement of the dropdown menues
#
#
#     if 3 == val:
#         return html.Div([
#                 dcc.Graph(
#                     id='crossfilter-indicator-scatterMASS')
#             ],
#                 style={'width': '60%', 'display': 'inline-block', 'padding': '0 20'})
#
#
#
# # the carbon balance:
#
# app.config['suppress_callback_exceptions'] = True  # Because we are assigning callbacks to components that are generated by other callbakcs we have to supress the exception
#
#
# @app.callback(
#     dash.dependencies.Output('x', 'children'),
#     [Input('x-axis-column', 'value')])
# def xvalue(xaxis_column_name):
#     xx = df[df['Variables'] == xaxis_column_name]['Value']
#
#     return xx#.to_json(date_format='iso', orient='split')
#
# @app.callback(
#     dash.dependencies.Output('y', 'children'),
#     [Input('y-axis-column', 'value')])
# def yvalue(yaxis_column_name):
#     yy = df[df['Variables'] == yaxis_column_name]['Value']
#
#     return yy#.to_json(date_format='iso', orient='split')
#
# @app.callback(
#     dash.dependencies.Output('v', 'children'),
#     [Input('volume', 'value')])
# def vvalue(volume):
#     v = df[df['Variables'] == volume]['Value']
#
#     return v#.to_json(date_format='iso', orient='split')
#
#
# @app.callback(Output('crossfilter-indicator-scatterMASS', 'figure'),
#               [Input('x', 'children'),
#                Input('y', 'children'),
#                Input('v', 'children')])
# def update_graph(xxjsonified_cleaned_data, yyjsonified_cleaned_data, vjsonified_cleaned_data):
#
#     xx = pd.read_json(xxjsonified_cleaned_data, orient='split')
#     yy = pd.read_json(yyjsonified_cleaned_data, orient='split')
#     V = pd.read_json(vjsonified_cleaned_data, orient='split')
#
#     xx = xx.reset_index()  # resetting the index so it corresponds to size of the new column, instead of it having indexes from the dataframe.
#     xx = xx.drop(['index'], axis=1)
#     yy = yy.reset_index()
#     yy = yy.drop(['index'], axis=1)
#     V = V.reset_index()
#     V = V.drop(['index'], axis=1)
#     yy = V * yy
#
#     xx = xx.T.squeeze()  # The T.squeeze converts the dataframe into a serie. Because Dash callback return values need to be serialised into JSON.
#     yy = yy.T.squeeze()
#
#     return {
#         'data': [go.Scatter(
#             x=xx,
#             y=yy,
#             mode='markers',
#             marker={
#                 'size': 15,
#                 'opacity': 0.5,
#                 'line': {'width': 0.5, 'color': 'white'}
#             }
#         )],
#         'layout': go.Layout(
#             xaxis={
#                 'title': xaxis_column_name,
#             },
#             yaxis={
#                 'title': yaxis_column_name,
#             },
#             margin={'l': 40, 'b': 30, 't': 10, 'r': 0},
#             height=450,
#             hovermode='closest'
#         )
#     }
#
#
#
# # the experiment
#
#
# @app.callback(
#     dash.dependencies.Output('crossfilter-indicator-scatter', 'figure'),
#     [dash.dependencies.Input('crossfilter-xaxis-column', 'value'),
#      dash.dependencies.Input('crossfilter-yaxis-column', 'value')])
# def update_graph(xaxis_column_name, yaxis_column_name):
#     return {
#         'data': [go.Scatter(
#             x=df[df['Variables'] == xaxis_column_name]['Value'],
#             y=df[df['Variables'] == yaxis_column_name]['Value'],
#             mode='markers',
#             marker={
#                 'size': 15,
#                 'opacity': 0.5,
#                 'line': {'width': 0.5, 'color': 'white'}
#             }
#         )],
#         'layout': go.Layout(
#             xaxis={
#                 'title': xaxis_column_name,
#             },
#             yaxis={
#                 'title': yaxis_column_name,
#             },
#             margin={'l': 40, 'b': 30, 't': 10, 'r': 0},
#             height=450,
#             hovermode='closest'
#         )
#     }
#
#
# # The mass plot
#
# app.config['suppress_callback_exceptions'] = True
#
#
#
# if __name__ == '__main__':
#     app.run_server(debug=True)
#
#
# # When the debug is true we can make changes in the script and safe the file,
# # then it will automaticallly change the application - one only hafe to refresh the browser
# # If it is false one would have to restart the terminal everytime there is a change
#
#
# # ctrl C to stop it from running