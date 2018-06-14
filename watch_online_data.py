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

# 1) Problem with the plots.

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

    # Figure out the timedifference, so we can select all the data that corresponds to 1 reactor
    time = pd.to_timedelta(online_data['Time      '])
    shifted_time = time.shift(periods=-1)
    delta = shifted_time - time
    online_data['delta'] = delta

    # Select the rows and create new dataframe that we will be working with
    selected_data = online_data[(online_data['delta'] >= '00:46:00') & (online_data['delta'] <= '00:47:00')]

    # Calculation of the CO2 evolution rate
    CER = selected_data['CO2 (Vol.%)'] * 1 - 0.04 * 1  # unit [(mol_co2/mol_totalgas)/h]

    # Reset the selected time, convert it and then use it to calculate tCER
    selected_time = pd.to_timedelta(selected_data['Time      '])
    selected_time.reset_index(inplace=True, drop=True)
    reset_selected_time = selected_time - selected_time[0]
    selected_datetimes = pd.to_datetime(reset_selected_time)
    selected_time = selected_datetimes.dt.time
    print(selected_time)

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

    mu = ((CER + shifted_CER) / 2) * (shifted_selected_time_decimals - selected_time_decimals)
    mu = mu / 60
    print(mu)

    # Hard to see the CO2
    #plt.plot(selected_time_decimals, mu)
    #plt.plot(selected_time_decimals, selected_data['CO2 (Vol.%)'])
    #plt.legend(['mul', 'CO2'], loc='upper left')
    #plt.show()

    # Here we can observe that CO2 has exactly the same structure as the growth rate
    #plt.plot(selected_time_decimals, selected_data['CO2 (Vol.%)'])
    #plt.show()

watch_file = 'MUX_09-03-2018_18-38-27.XLS'


# Online dataset
file = 'MUX_09-03-2018_18-38-27.xls'
online_data = pd.ExcelFile(file)
online_data = online_data.parse('Channel 4')


# watcher = Watcher(watch_file)  # simple
watcher = Watcher(watch_file, custom_action, text=online_data)  # also call custom action function
watcher.watch()  # start the watch going

# Press ctrl c, to exit the running program.