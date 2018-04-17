import dash
import dash_core_components as dcc
import dash_html_components as html
import plotly.graph_objs as go
import pandas as pd

from functions import data_to_mass
from functions import stack_data

from dash.dependencies import Input, Output
from loremipsum import get_sentences

file = 'c002_r3_overview.xlsm'

xl = pd.ExcelFile(file)


# Loads the sheet we want to work with
df1 = xl.parse('Off line measurements')


# This is used for the experiment section
df, available_indicators = stack_data(df1)


# This is used for the mass section
mass_sheet, available_indicatorsMASS = data_to_mass(df1)




# The actual application starts here

app = dash.Dash()

app.scripts.config.serve_locally = True  # tabs

vertical = True  # vertical tabs

app.layout = html.Div([
        html.Div(
            dcc.Tabs(
                tabs=[
                    {'label': 'Experiments', 'value': 1},
                    {'label': 'Balancing Region', 'value': 2},
                    {'label': 'Mass Plot', 'value': 3}
                ],
                value=1,  # Sets the default value (maybe not neccesary)
                id='tabs',
                vertical=vertical,
                style={
                    'height': '100vh',
                    'borderRight': 'thick darkgrey solid',
                    'textAlign': 'left'
                }
            ),
            style={'width': '20%', 'float': 'left'},
    ),
    html.Div(
        html.Div(id='tab-output'),
        style={'width': '79.5%', 'float': 'right'}
    )
], style={
    'fontFamily': 'Sans-Serif',
    'margin-left': 'auto',
    'margin-right': 'auto'
})


@app.callback(Output('tab-output', 'children'), [Input('tabs', 'value')])
def display_content(val):
    if 3 == val:
        return html.Div([
            html.Div([
                html.H2("Generate the plot"),
                html.Div([
                    dcc.Dropdown(
                        id='crossfilter-xaxis-columnMASS',
                        options=[{'label': i, 'value': i} for i in available_indicatorsMASS],
                        # label Makes the different options from the dataframe appear, and value can change to another
                        placeholder="Select the x-axis",
                        value = 'Time (hours)'),
                ],
                    style={'width': '25%', 'display': 'inline-block'}),

                html.Div([
                    dcc.Dropdown(
                        id='crossfilter-yaxis-columnMASS',
                        options=[{'label': i, 'value': i} for i in available_indicatorsMASS],
                        # value can later be defined in function - if false then just a string - if true then the value correspons to this in the option
                        placeholder="Select the y-axis",
                        value = 'Glucose (g)')
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
                style={'width': '60%', 'display': 'inline-block', 'padding': '0 20'})]
        )

    if 2 == val:
        return html.Div([
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
                    # value can later be defined in function - if false then just a string - if true then the value correspons to this in the option
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

    if 1 == val:
        return html.Div([
            html.Div([
                html.H2("Generate the plot"),
                html.Div([
                    dcc.Dropdown(
                        id='crossfilter-xaxis-column',
                        options=[{'label': i, 'value': i} for i in available_indicators],
                        # label Makes the different options from the dataframe appear, and value can change to another
                        placeholder="Select the x-axis",
                        value='Time (hours)'),
                ],
                    style={'width': '25%', 'display': 'inline-block'}),

                html.Div([
                    dcc.Dropdown(
                        id='crossfilter-yaxis-column',
                        options=[{'label': i, 'value': i} for i in available_indicators],
                        # value can later be defined in function - if false then just a string - if true then the value correspons to this in the option
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
                style={'width': '60%', 'display': 'inline-block', 'padding': '0 20'})])

        # generate space under dropdown where text should be outputted




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



if __name__ == '__main__':
    app.run_server(debug=True)


# When the debug is true we can make changes in the script and safe the file,
# then it will automatically change the application
# If it is false one would have to restart the terminal every time there is a change


# press ctrl c to stop it from running