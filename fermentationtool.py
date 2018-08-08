import warnings
warnings.filterwarnings("ignore", message="numpy.dtype size changed")
warnings.filterwarnings("ignore", message="numpy.ufunc size changed")
import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.graph_objs as go
import pandas as pd
import matplotlib
import os
from dash.dependencies import Input, Output
from threading import Lock
from functions_fermentation_tool import data_to_mass
from functions_fermentation_tool import stack_data
matplotlib.use('TkAgg')
from plotly import tools


file_name = '/Users/s144510/Documents/fermentationtool/data/C002_R3_overview.xlsm'
xl = pd.ExcelFile(file_name)

# Loads the sheet we want to work with
df1 = xl.parse('Off line measurements')

# This is used for the experiment section
df, available_indicators = stack_data(df1)

# This is used for the mass section
mass_sheet, available_indicatorsMASS = data_to_mass(df1)

# The actual application starts here

app = dash.Dash()

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
                        html.Div([
                            dcc.Graph(
                                id='crossfilter-indicator-scatterMASS')
                        ],
                            style={'width': '100%', 'display': 'inline-block', 'padding': '0 20'})])
                ]),

                dcc.Tab(label='Online data integration (Reactor 1)', children=[
                    html.Div([
                        html.H2('Model prediction for reactor 1'),
                        dcc.Graph(id='live-update-graph-1'),
                        dcc.Interval(
                            id='interval-component-1',
                            interval=5 * 1000,  # timeinterval,  # in milliseconds
                            n_intervals=0
                        )
                    ],
                        style={
                            'borderBottom': 'thin lightgrey solid',
                            'backgroundColor': 'rgb(250, 250, 250)',
                            'padding': '10px 5px',
                            'width': '180%'})
                ]),

                dcc.Tab(label='Online data integration (Reactor 2)', children=[
                    html.Div([
                        html.H2('Model prediction for reactor 2'),
                        dcc.Graph(id='live-update-graph-2'),
                        dcc.Interval(
                            id='interval-component-2',
                            interval=3 * 1000,  # timeinterval,  # in milliseconds
                            n_intervals=1
                        )
                    ],
                        style={
                            'borderBottom': 'thin lightgrey solid',
                            'backgroundColor': 'rgb(250, 250, 250)',
                            'padding': '10px 5px',
                            'width': '180%'})
                ]),

                dcc.Tab(label='Online data integration (Reactor 3)', children=[
                    html.Div([
                        html.H2('Model prediction for reactor 3'),
                        dcc.Graph(id='live-update-graph-3'),
                        dcc.Interval(
                            id='interval-component-3',
                            interval=3 * 1000,  # timeinterval,  # in milliseconds
                            n_intervals=2
                        )
                    ],
                        style={
                            'borderBottom': 'thin lightgrey solid',
                            'backgroundColor': 'rgb(250, 250, 250)',
                            'padding': '10px 5px',
                            'width': '180%'})
                ]),

                dcc.Tab(label='Online data integration (Reactor 4)', children=[
                    html.Div([
                        html.H2('Model prediction for reactor 4'),
                        dcc.Graph(id='live-update-graph-4'),
                        dcc.Interval(
                            id='interval-component-4',
                            interval=5 * 1000,  # timeinterval,  # in milliseconds
                            n_intervals=3
                        )
                    ],
                        style={
                            'borderBottom': 'thin lightgrey solid',
                            'backgroundColor': 'rgb(250, 250, 250)',
                            'padding': '10px 5px',
                            'width': '180%'})
                ]),

            ],
            id='tabs',
            vertical=True,
        ),
        style={'width': '100%', 'float': 'center'}
    )])


# the balancing region

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

@app.callback(Output('live-update-graph-1', 'figure'),
              [Input('interval-component-1', 'n_intervals')])
def update_graph_live_1(n):

    data_frame = pd.read_csv('output.csv')
    print(data_frame)

    trace1 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['CO2'],
        name='CO2',
        mode='markers'
    )

    trace2 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['CO2'],
        name='mu',
        mode='markers'
    )

    trace3 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['mu'],
        name='mu'
    )

    trace4 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['biomass'],
        name='Biomass'
    )

    trace5 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['serine'],
        name='Serine'
    )

    trace6 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['glucose'],
        name='Glucose'
    )

    fig = tools.make_subplots(rows=2, cols=3, subplot_titles=('CO2 online data', 'mu from CO2',
                                                              'mu from model', 'Biomass from model',
                                                              'Serine from model', 'Glucose from model'))

    fig.append_trace(trace1, 1, 1)
    fig.append_trace(trace2, 1, 2)
    fig.append_trace(trace3, 1, 3)
    fig.append_trace(trace4, 2, 1)
    fig.append_trace(trace5, 2, 2)
    fig.append_trace(trace6, 2, 3)

    fig['layout'].update(height=640, width=1260,
                         margin=dict(
                             l=120,
                             r=100,
                             b=100,
                             t=70,
                             pad=2
                         ))

    fig['layout']['yaxis1'].update(showgrid=True, title='CO2 (%)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis2'].update(showgrid=True, title='Mu (1/h)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis3'].update(showgrid=True, title='Mu (1/h)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis4'].update(showgrid=True, title='Biomass (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])
    fig['layout']['yaxis5'].update(showgrid=True, title='Serine (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])
    fig['layout']['yaxis6'].update(showgrid=True, title='Glucose (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])

    fig['layout']['xaxis1'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0, 0.27])
    fig['layout']['xaxis2'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.36, 0.63])
    fig['layout']['xaxis3'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.72, 0.99])
    fig['layout']['xaxis4'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0, 0.27])
    fig['layout']['xaxis5'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.36, 0.63])
    fig['layout']['xaxis6'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.72, 0.99])

    return fig


@app.callback(Output('live-update-graph-2', 'figure'),
              [Input('interval-component-2', 'n_intervals')])
def update_graph_live_2(n):

    # load the data from watcher

    data_frame = pd.read_csv('output_2.csv')

    trace1 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['CO2'],
        name='CO2',
        mode='markers'
    )

    trace2 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['CO2'],
        name='mu',
        mode='markers'
    )

    trace3 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['mu'],
        name='mu'
    )

    trace4 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['biomass'],
        name='Biomass'
    )

    trace5 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['serine'],
        name='Serine'
    )

    trace6 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['glucose'],
        name='Glucose'
    )

    fig = tools.make_subplots(rows=2, cols=3, subplot_titles=('CO2 online data', 'mu from CO2',
                                                              'mu from model', 'Biomass from model',
                                                              'Serine from model', 'Glucose from model'))

    fig.append_trace(trace1, 1, 1)
    fig.append_trace(trace2, 1, 2)
    fig.append_trace(trace3, 1, 3)
    fig.append_trace(trace4, 2, 1)
    fig.append_trace(trace5, 2, 2)
    fig.append_trace(trace6, 2, 3)

    fig['layout'].update(height=640, width=1260,
                         margin=dict(
                             l=120,
                             r=100,
                             b=100,
                             t=70,
                             pad=2
                         ))

    fig['layout']['yaxis1'].update(showgrid=True, title='CO2 (%)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis2'].update(showgrid=True, title='Mu (1/h)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis3'].update(showgrid=True, title='Mu (1/h)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis4'].update(showgrid=True, title='Biomass (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])
    fig['layout']['yaxis5'].update(showgrid=True, title='Serine (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])
    fig['layout']['yaxis6'].update(showgrid=True, title='Glucose (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])

    fig['layout']['xaxis1'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0, 0.27])
    fig['layout']['xaxis2'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.36, 0.63])
    fig['layout']['xaxis3'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.72, 0.99])
    fig['layout']['xaxis4'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0, 0.27])
    fig['layout']['xaxis5'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.36, 0.63])
    fig['layout']['xaxis6'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.72, 0.99])

    return fig

@app.callback(Output('live-update-graph-3', 'figure'),
              [Input('interval-component-3', 'n_intervals')])
def update_graph_live_3(n):

    # load the data from watcher

    data_frame = pd.read_csv('output_3.csv')

    trace1 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['CO2'],
        name='CO2',
        mode='markers'
    )

    trace2 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['CO2'],
        name='mu',
        mode='markers'
    )

    trace3 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['mu'],
        name='mu'
    )

    trace4 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['biomass'],
        name='Biomass'
    )

    trace5 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['serine'],
        name='Serine'
    )

    trace6 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['glucose'],
        name='Glucose'
    )

    fig = tools.make_subplots(rows=2, cols=3, subplot_titles=('CO2 online data', 'mu from CO2',
                                                              'mu from model', 'Biomass from model',
                                                              'Serine from model', 'Glucose from model'))

    fig.append_trace(trace1, 1, 1)
    fig.append_trace(trace2, 1, 2)
    fig.append_trace(trace3, 1, 3)
    fig.append_trace(trace4, 2, 1)
    fig.append_trace(trace5, 2, 2)
    fig.append_trace(trace6, 2, 3)

    fig['layout'].update(height=640, width=1260,
                         margin=dict(
                             l=120,
                             r=100,
                             b=100,
                             t=70,
                             pad=2
                         ))

    fig['layout']['yaxis1'].update(showgrid=True, title='CO2 (%)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis2'].update(showgrid=True, title='Mu (1/h)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis3'].update(showgrid=True, title='Mu (1/h)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis4'].update(showgrid=True, title='Biomass (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])
    fig['layout']['yaxis5'].update(showgrid=True, title='Serine (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])
    fig['layout']['yaxis6'].update(showgrid=True, title='Glucose (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])

    fig['layout']['xaxis1'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0, 0.27])
    fig['layout']['xaxis2'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.36, 0.63])
    fig['layout']['xaxis3'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.72, 0.99])
    fig['layout']['xaxis4'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0, 0.27])
    fig['layout']['xaxis5'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.36, 0.63])
    fig['layout']['xaxis6'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.72, 0.99])

    return fig

@app.callback(Output('live-update-graph-4', 'figure'),
              [Input('interval-component-4', 'n_intervals')])
def update_graph_live_4(n):

    # load the data from watcher

    data_frame = pd.read_csv('output_4.csv')

    trace1 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['CO2'],
        name='CO2',
        mode='markers'
    )

    trace2 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['CO2'],
        name='mu',
        mode='markers'
    )

    trace3 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['mu'],
        name='mu'
    )

    trace4 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['biomass'],
        name='Biomass'
    )

    trace5 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['serine'],
        name='Serine'
    )

    trace6 = go.Scatter(
        x=data_frame['time'],
        y=data_frame['glucose'],
        name='Glucose'
    )

    fig = tools.make_subplots(rows=2, cols=3, subplot_titles=('CO2 online data', 'mu from CO2',
                                                              'mu from model', 'Biomass from model',
                                                              'Serine from model', 'Glucose from model'))

    fig.append_trace(trace1, 1, 1)
    fig.append_trace(trace2, 1, 2)
    fig.append_trace(trace3, 1, 3)
    fig.append_trace(trace4, 2, 1)
    fig.append_trace(trace5, 2, 2)
    fig.append_trace(trace6, 2, 3)

    fig['layout'].update(height=640, width=1260,
                         margin=dict(
                             l=120,
                             r=100,
                             b=100,
                             t=70,
                             pad=2
                         ))

    fig['layout']['yaxis1'].update(showgrid=True, title='CO2 (%)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis2'].update(showgrid=True, title='Mu (1/h)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis3'].update(showgrid=True, title='Mu (1/h)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0.65, 1])
    fig['layout']['yaxis4'].update(showgrid=True, title='Biomass (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])
    fig['layout']['yaxis5'].update(showgrid=True, title='Serine (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])
    fig['layout']['yaxis6'].update(showgrid=True, title='Glucose (moles)', exponentformat='power', nticks=10,
                                   tickfont=dict(size=10), domain=[0, 0.35])

    fig['layout']['xaxis1'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0, 0.27])
    fig['layout']['xaxis2'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.36, 0.63])
    fig['layout']['xaxis3'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.72, 0.99])
    fig['layout']['xaxis4'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0, 0.27])
    fig['layout']['xaxis5'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.36, 0.63])
    fig['layout']['xaxis6'].update(showgrid=True, title='Time (hours)', nticks=10, tickfont=dict(size=10),
                                   domain=[0.72, 0.99])

    return fig


if __name__ == '__main__':
    app.run_server(debug=True)
# press ctrl c to stop it from running


