import os
import sys
import time
import pandas as pd
import datetime
#from datetime import datetime, date
import numpy as np
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from plotly import tools
import plotly
import plotly.graph_objs as go
import tellurium as te



modelfermentation = '''
model *IDModel()

    ######## Set the compartment to 1, otherwise it will be multiplied by the compounds. 
    compartment comp1;
    comp1 =1;


    ######## Specify the species in the compartment
    glucose in comp1; serine in comp1; biomass in comp1;


    ######## Constants
    alpha = 29.1 #21.542 #24.6807; # Check units
    beta = 68.8 #90.2844 #67.3047; # Check units
    mu_max = 0.98 #0.327912 #0.260172; # [1/h]
    kc = 7.48 #1.24659 #1.05221; # [mol/kg] # Kc? 
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
    qp_s := alpha*mu/(beta+mu) # [mol_serine/(c-mol_biomass*h)]
    qs_g := a*mu + b*qp_s + ms #[mol_glucose/(c-mol_biomass*h)]
    rp_s := qp_s*biomass # [mol/h] 
    r_s := qs_g*biomass # [mol/h]


    ######## Mass Balances    
    eq_biomass: -> biomass; mu*biomass # [c-mol/h]
    eq_serine: -> serine; rp_s
    eq_glucose: -> glucose; r_s # [mol/h]



    end
'''
r = te.loada(modelfermentation)

# We can set the lists so it has the same order as the data
r.timeCourseSelections = ['time', 'glucose', 'serine', 'biomass', 'mu']

# Time interval must mach the exact value from the experiment
results = r.simulate(2, 23.5, 100)



# To run this we have to save the experimental data everytime there is a change.
# We can change this in excel by right clicking on the sheet name -> view code
# Then open "Sheet number (sheet name)" and insert the code below in the Code window.
# Maybe we also has to put the code into ThisWorkbook

# Private Sub Worksheet_Change(ByVal Target As Range)
#     If Not Intersect(Target, Me.Range("A1:AA1000")) Is Nothing Then
#         ThisWorkbook.Save
#     End If
# End Sub

# Then save it and it saves now automatically in excel every time there is a change

# 1) Fix Problem with the plots.
# 2) make function




class Watcher(object):
    running = True
    refresh_delay_secs = 1

    # Constructor
    def __init__(self, watch_file, call_func_on_change=None, *args, **kwargs):
        self._cached_stamp = 0
        self.filename = watch_file
        self.call_func_on_change = call_func_on_change
        self.args = args
        self.kwargs = kwargs

    # Look for changes
    def look(self):
        stamp = os.stat(self.filename).st_mtime
        if stamp != self._cached_stamp:
            self._cached_stamp = stamp
            # File has changed, so do something...
            print('File changed')
            if self.call_func_on_change is not None:
                self.call_func_on_change(*self.args, **self.kwargs)

    # Keep watching in a loop
    def watch(self):
        while self.running:
            try:
                # Look for changes
                time.sleep(self.refresh_delay_secs)
                self.look()
            except KeyboardInterrupt:
                print('\nDone')
                break
            except FileNotFoundError:
                # Action on file not found
                pass
            except:
                print('Unhandled error: %s' % sys.exc_info()[0])

# Call this function each time a change happens
def custom_action(text):

    #
    online_data = pd.ExcelFile(watch_file)
    online_data = online_data.parse('Channel 2')

    # Figure out the timedifference, so we can select all the data that corresponds to 1 reactor
    time = pd.to_timedelta(online_data['Time      '])
    shifted_time = time.shift(periods=-1)
    delta = shifted_time - time
    online_data['delta'] = delta

    # Select the rows and create new dataframe that we will be working with
    selected_data = online_data[(online_data['delta'] >= '00:46:00') & (online_data['delta'] <= '00:47:00')]

    # Calculation of the CO2 evolution rate
    CER = selected_data['CO2 (Vol.%)'] * 10 - 0.04 * 10  # unit [(mol_co2/mol_totalgas)/h]

    # Reset the selected time, convert it and then use it to calculate tCER
    selected_time = pd.to_timedelta(selected_data['Time      '])
    selected_time.reset_index(inplace=True, drop=True)
    reset_selected_time = selected_time - selected_time[0]
    selected_datetimes = pd.to_datetime(reset_selected_time)
    selected_time = selected_datetimes.dt.time

    # convert time to decimals
    selected_time_decimals = pd.DataFrame(columns=['Time'])
    for i in range(0, len(selected_time)):
        h = selected_time[i].strftime('%H')
        m = selected_time[i].strftime('%M')
        s = selected_time[i].strftime('%S')
        result = int(h) * 60 + int(m) + int(s) / 60.0
        selected_time_decimals.loc[
            i, ['Time']] = result  # This puts the results in the iterated indexes in the Time column

    # Calculate tCER

    # Shift the values so it corresponds to "next value" of selected_time_decimals
    shifted_selected_time_decimals = selected_time_decimals.shift(periods=-1)

    # Same with CO2 so it corresponds to "next value" of CER
    CER.reset_index(inplace=True, drop=True)
    shifted_CER = CER.shift(periods=-1)

    # Convert to series
    shifted_selected_time_decimals = shifted_selected_time_decimals.T.squeeze()
    selected_time_decimals = selected_time_decimals.T.squeeze()

    tCER = ((CER + shifted_CER) / 2) * (shifted_selected_time_decimals - selected_time_decimals)
    mu = CER / tCER
    mu = (mu / 60)
    print(mu)

    # Hard to see the CO2

    print(type(mu.values))


    trace1 = go.Scatter(
        x=selected_time_decimals/60,
        y=selected_data['CO2 (Vol.%)']
    )

    trace2 = go.Scatter(
        x=selected_time_decimals/60,
        y=mu
    )

    trace3 = go.Scatter(
        x=results[:, 0],
        y=results[:, 4]
    )

    trace4 = go.Scatter(
        x=results[:, 0],
        y=results[:, 3]
    )

    trace5 = go.Scatter(
        x=results[:, 0],
        y=results[:, 2]
    )

    trace6 = go.Scatter(
        x=results[:, 0],
        y=results[:, 1]
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

    fig['layout'].update(height=800, width=1400, title='Model prediction')

    plotly.offline.plot(fig)



watch_file = 'MUX_09-03-2018_18-38-27.XLS'



# watcher = Watcher(watch_file)  # simple
watcher = Watcher(watch_file, custom_action, text=watch_file)  # also call custom action function
watcher.watch()  # start the watch going


# Press ctrl c, to exit the running program.