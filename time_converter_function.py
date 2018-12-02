import warnings
warnings.filterwarnings("ignore", message="numpy.dtype size changed")
warnings.filterwarnings("ignore", message="numpy.ufunc size changed")
import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
from datetime import datetime
import datetime


def time_to_decimals(R):

    '''
    Converts time in online data from date time format to decimals

    :param R: file with online data
    :return: file with online data where the time is now in decimals
    '''

    # Split Date time column into a time column and date column
    date_time = pd.DataFrame(R['Date Time'].str.split(' ',1).tolist(),
                                       columns=['Date','Time'])


    R = pd.concat([date_time,R],axis=1,sort=False)
    del R['Date Time']

    # The following calculates the time difference between two points and puts the values in the time column
    R['Time'] = pd.to_timedelta(R['Time'])
    R['Time'].reset_index(inplace=True, drop=True)
    R['Time'] = R['Time'] - R['Time'][0]
    shifted_time = R['Time'].shift(periods=-1)
    R['Time'] = shifted_time - R['Time']
    R['Time'] = pd.to_datetime(R['Time'])
    R['Time'] = R['Time'].dt.time
    R['Time'] = R['Time'].shift(periods=1)

    # Set first time to be 0
    R['Time'][0] = datetime.time(0, 0, 0)

    # This calculates time in decimals in minutes
    selected_time_decimals = pd.DataFrame(columns=['Time (min)'])
    for i in range(0, len(R['Time'] )):
        h = R['Time'] [i].strftime('%H')
        m = R['Time'] [i].strftime('%M')
        s = R['Time'] [i].strftime('%S')
        result = int(h) * 60 + int(m) + int(s) / 60.0  # [min]
        selected_time_decimals.loc[
            i, ['Time (min)']] = result  # This puts the results in the iterated indexes in the Time column
    print(selected_time_decimals, 'llop')

    # Adds to the online data frame
    R = pd.concat([selected_time_decimals,R],axis=1,sort=False)
    del R['Time']

    # Caclulate the time difference from the beginning, with adding the differences
    for i in range(len(R)-1):
        R['Time (min)'][i+1] = R['Time (min)'][i] + R['Time (min)'][i+1]

    return R
