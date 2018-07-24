import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.graph_objs as go
import pandas as pd

from functions_fermentation_tool import data_to_mass
from functions_fermentation_tool import stack_data

from dash.dependencies import Input, Output
from loremipsum import get_sentences


import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from models import batch_model
from models import fed_batch_model
from experiments import data
from parest_copasi import parameter_estimation
from parest_copasi import parameter_estimation_online
import os
import sys
import time
import datetime
import numpy as np
from plotly import tools
import plotly
import plotly.graph_objs as go
import tellurium as te
from models import batch_model_mu
#from openpyxl.workbook import Workbook
import xlwings as xw
from openpyxl import load_workbook
from openpyxl.utils.dataframe import dataframe_to_rows



file = 'data/C002_R3_overview.xlsm'

xl = pd.ExcelFile(file)


# Loads the sheet we want to work with
df1 = xl.parse('Off line measurements')


# This is used for the experiment section
df, available_indicators = stack_data(df1)


# This is used for the mass section
mass_sheet, available_indicatorsMASS = data_to_mass(df1)




filename_experimental_data1 = "data/R1_data_in_moles.csv"
filename_experimental_data2 = "data/R2_data_in_moles.csv"
alpha_lower_bound = "0"
alpha_upper_bound = "100"
beta_lower_bound = "0"
beta_upper_bound = "100"


# The actual application starts here

app = dash.Dash()


# For the online data integration
file = 'output.xlsx'
output = pd.ExcelFile(file)

# Loads the sheet we want to work with
dataframe_output = output.parse('Sheet1')
online_data_sheet, available_indicators_online = stack_data(dataframe_output)



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
                            interval=2 * 60 * 1000,  # in milliseconds
                            n_intervals=0
                        )
                    ],
                        style={
                            'borderBottom': 'thin lightgrey solid',
                            'backgroundColor': 'rgb(250, 250, 250)',
                            'padding': '10px 5px'})
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

    watch_file = 'data/MUX_09-03-2018_18-38-27.XLS'
    online_data = pd.ExcelFile(watch_file)
    online_data = online_data.parse('Sheet1')

    # Calculate the difference in time, so we can select all the data that corresponds to 1 reactor
    time = pd.to_timedelta(online_data['Time      '])
    shifted_time = time.shift(periods=-1)
    delta = shifted_time - time
    online_data['delta'] = delta

    # Select the rows with difference in time between 46 and 47 minutes
    # and create new dataframe that we will be working with
    selected_data = online_data[(online_data['delta'] >= '00:46:00') & (online_data['delta'] <= '00:47:00')]

    # Calculation of the CO2 evolution rate
    CER = selected_data['CO2 (Vol.%)'] * 10 - 0.04 * 10  # unit [(mol_co2/mol_totalgas)/min] / [%CO2/min]

    # Reset the selected time so it starts from time = 0, convert it and then use it to calculate tCER
    selected_time = pd.to_timedelta(selected_data['Time      '])
    selected_time.reset_index(inplace=True, drop=True)
    reset_selected_time = selected_time - selected_time[0]
    selected_datetimes = pd.to_datetime(reset_selected_time)
    selected_time = selected_datetimes.dt.time

    # convert time to decimals and in minutes
    selected_time_decimals = pd.DataFrame(columns=['Time'])
    for i in range(0, len(selected_time)):
        h = selected_time[i].strftime('%H')
        m = selected_time[i].strftime('%M')
        s = selected_time[i].strftime('%S')
        result = int(h) * 60 + int(m) + int(s) / 60.0 # [min]
        selected_time_decimals.loc[
            i, ['Time']] = result  # This puts the results in the iterated indexes in the Time column

    # Calculate tCER

    # Shift the values so it corresponds to next value of selected_time_decimals
    shifted_selected_time_decimals = selected_time_decimals.shift(periods=-1)

    # Same with CO2 so it corresponds to next value of CER
    CER.reset_index(inplace=True, drop=True)
    shifted_CER = CER.shift(periods=-1)

    # Convert to series
    shifted_selected_time_decimals = shifted_selected_time_decimals.T.squeeze()
    selected_time_decimals = selected_time_decimals.T.squeeze()

    tCER = ((CER + shifted_CER) / 2) * (shifted_selected_time_decimals - selected_time_decimals)  # [% CO2]
    mu = CER / tCER
    mu = (mu / 60)  # [1/h]

    if np.isnan(mu[0]) == True:
        print('Needs more time points to simulate data')

    else:

        selected_time_decimals_hours = selected_time_decimals/60

        r = batch_model_mu()
        r.mu = mu[0]
        r.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']

        start_time = selected_time_decimals_hours[0]
        end_time = selected_time_decimals_hours.iloc[1]
        results = r.simulate(start_time, end_time, 2)


        # we probably didnt have to simulate since we just want the first row.
        # But it makes it easier to make the dataframe
        initial_values = results[0:1]
        data_frame = pd.DataFrame(initial_values)
        data_frame.columns = ['time', 'glucose', 'serine', 'biomass', 'mu']

        r.reset()
        r.mu = mu.iloc[-2]
        glucose = data_frame['glucose'].iloc[-1]
        serine = data_frame['serine'].iloc[-1]
        biomass = data_frame['biomass'].iloc[-1]
        print(glucose, serine, biomass)

        alpha_online, beta_online = parameter_estimation_online(filename_experimental_data1,
                                                                filename_experimental_data2,
                                                                alpha_lower_bound, alpha_upper_bound,
                                                                beta_lower_bound, beta_upper_bound,
                                                                str(mu.iloc[-2]), str(glucose), str(serine),
                                                                str(biomass))
        # print(alpha_online,beta_online)
        r.alpha = float(alpha_online)
        r.beta = float(beta_online)
        start_time = selected_time_decimals_hours.iloc[-2]
        end_time = selected_time_decimals_hours.iloc[-1]
        results = r.simulate(start_time, end_time, 2)
        # print(results)
        simulated_row = results[-1:]
        # print(simulated_row)
        new_dataframe = pd.DataFrame(simulated_row)
        new_dataframe.columns = ['time', 'glucose', 'serine', 'biomass', 'mu']
        data_frame = data_frame.append(new_dataframe, ignore_index=True)
        data_frame['CO2 (%)'] = selected_data['CO2 (Vol.%)'].iloc[-1]



        wb = load_workbook("output.xlsx")
        ws = wb['Sheet1']
        row = list(data_frame.iloc[-1])
        ws.append(row)
        wb.save("output.xlsx")

        output_values = 'output.xlsx'

        output_values = pd.ExcelFile(output_values)

        # Loads the sheet we want to work with
        data_frame = output_values.parse('Sheet1')


        # for i in range(0, (len(mu) - 2)):
        #     #print(data_frame, "on the top")
        #     #print(results,"on the top")
        #     #print(data_frame['glucose'].iloc[-1])
        #     r.reset()
        #     r.mu = mu[i+1]
        #     glucose = data_frame['glucose'].iloc[-1]
        #     serine = data_frame['serine'].iloc[-1]
        #     biomass = data_frame['biomass'].iloc[-1]
        #     print(glucose,serine,biomass)
        #
        #     alpha_online, beta_online = parameter_estimation_online(filename_experimental_data1,
        #                                                             filename_experimental_data2,
        #                                                             alpha_lower_bound, alpha_upper_bound,
        #                                                             beta_lower_bound, beta_upper_bound,
        #                                                             str(mu[i+1]), str(glucose), str(serine),
        #                                                             str(biomass))
        #     print((mu[i+1]))
        #     #print(alpha_online,beta_online)
        #     r.alpha = float(alpha_online)
        #     r.beta = float(beta_online)
        #     start_time = selected_time_decimals_hours[i]
        #     end_time = selected_time_decimals_hours[i + 1]
        #     results = r.simulate(start_time, end_time, 2)
        #     #print(results)
        #     simulated_row = results[-1:]
        #     #print(simulated_row)
        #     new_dataframe = pd.DataFrame(simulated_row)
        #     new_dataframe.columns = ['time', 'glucose', 'serine', 'biomass', 'mu']
        #     data_frame = data_frame.append(new_dataframe, ignore_index=True)
        #     #print(data_frame)
        #     print("ROUND",i)

        trace1 = go.Scatter(
            x=selected_time_decimals_hours,
            y=selected_data['CO2 (Vol.%)'],
            name='CO2'
        )

        trace2 = go.Scatter(
            x=selected_time_decimals_hours,
            y=mu,
            name='mu'
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

        #plotly.offline.plot(fig)

        return fig


if __name__ == '__main__':
    app.run_server(debug=True)


# When the debug is true we can make changes in the script and safe the file,
# then it will automatically change the application
# If it is false one would have to restart the terminal every time there is a change


# press ctrl c to stop it from running
