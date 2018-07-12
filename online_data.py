import os
import pandas as pd
import datetime
#from datetime import datetime, date
import numpy as np
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt

# make function for the different channels, where the output is the mu values and a mu plot.


#os.stat('MUX_09-03-2018_18-38-27.XLS').st_mtime


#Check for change in file
#The method polling is used, which check the status of the file?


# Online dataset
def mu_from_co2():
    # file = 'MUX_09-03-2018_18-38-27.xls'
    # online_data = pd.ExcelFile(file)
    # online_data = online_data.parse('Channel 4')


    time = pd.to_timedelta(online_data['Time      '])
    shifted_time = time.shift(periods=-1)
    delta = shifted_time - time
    online_data['delta'] = delta



    # Select the rows and create new dataframe that we will be working with
    selected_data = online_data[(online_data['delta'] >= '00:46:00') & (online_data['delta'] <= '00:47:00')]


    #plt.scatter(selected_data['Time      '], selected_data['CO2 (Vol.%)'])
    #plt.show()


    # Calculation of the CO2 evolution rate
    CER = selected_data['CO2 (Vol.%)']*(100) - 0.04*(100)  # unit [(mol_co2/mol_totalgas)/h]
    print(CER)


    # Reset the selected time, convert it and then use it to calculate tCER
    selected_time = pd.to_timedelta(selected_data['Time      '])
    selected_time.reset_index(inplace=True, drop=True)
    reset_selected_time = selected_time - selected_time[0]
    selected_datetimes = pd.to_datetime(reset_selected_time)
    selected_time = selected_datetimes.dt.time


    # convert time to decimals
    selected_time_decimals = pd.DataFrame(columns=['Time'])
    for i in range(0,len(selected_time)):
        h = selected_time[i].strftime('%H')
        m = selected_time[i].strftime('%M')
        s = selected_time[i].strftime('%S')
        result = int(h)*60 + int(m) + int(s)/60.0
        selected_time_decimals.loc[i, ['Time']] = result  # This puts the results in the iterated indexes in the Time column


    # Calculate tCER

    # Shift the values so it corresponds to "next value" of selected_time_decimals
    shifted_selected_time_decimals = selected_time_decimals.shift(periods=-1)

    # Same with CO2 so it corresponds to "next value" of CER
    CER.reset_index(inplace=True, drop=True)
    print(CER)
    shifted_CER = CER.shift(periods=-1)
    print(shifted_CER)


    # Convert to series
    shifted_selected_time_decimals = shifted_selected_time_decimals.T.squeeze()
    selected_time_decimals = selected_time_decimals.T.squeeze()

    tCER = ((CER + shifted_CER)/2)*(shifted_selected_time_decimals - selected_time_decimals)
    print(tCER)
    mu = CER/tCER
    mu = (mu/60)


    selected_time_decimals_hours = selected_time_decimals/60


    # # Hard to see the CO2
    # plt.plot(selected_time_decimals,mu)
    # plt.plot(selected_time_decimals,selected_data['CO2 (Vol.%)'])
    # plt.legend(['mu', 'CO2'], loc='upper left')
    # plt.show()
    #
    # # Here we can observe that CO2 has exactly the same structure as the growth rate
    # plt.plot(selected_time_decimals,selected_data['CO2 (Vol.%)'])
    # plt.show()

    return mu





