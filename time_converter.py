import warnings
warnings.filterwarnings("ignore", message="numpy.dtype size changed")
warnings.filterwarnings("ignore", message="numpy.ufunc size changed")
import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
from time_converter_function import time_to_decimals

# Converts all time points to decimals from date time format
R1 = pd.read_csv('data/SER_C016_Reactor1_0,5g-LGlucose.csv')
R2 = pd.read_csv('data/SER_C016_Reactor2_1,0g-LGlucose.csv')
R3 = pd.read_csv('data/SER_C016_Reactor3_2,0g-LGlucose.csv')
R4 = pd.read_csv('data/SER_C016_Reactor4_3,0g-LGlucose.csv')
R5 = pd.read_csv('data/SER_C016_Reactor5_5,0g-LGlucose.csv')
R6 = pd.read_csv('data/SER_C016_Reactor6_7,5g-LGlucose.csv')
R7 = pd.read_csv('data/SER_C016_Reactor7_10,0g-LGlucose.csv')
R8 = pd.read_csv('data/SER_C016_Reactor8_20,0g-LGlucose.csv')
R9 = pd.read_csv('data/SER_C016_Reactor9_40,0g-LGlucose.csv')
R10 = pd.read_csv('data/SER_C016_Reactor10_60,0g-LGlucose.csv')
R11 = pd.read_csv('data/SER_C016_Reactor11_120,0g-LGlucose.csv')
R12 = pd.read_csv('data/SER_C016_Reactor12_150,0g-LGlucose.csv')
R23 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor23_4g-LGlycine_0,02FeedRate.csv')
R24 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor24_4g-LGlycine_0,02FeedRate.csv')

# List the data of the data you would like to use the time converter on
list_data = [R1, R2, R2]
data_frames = list(map(time_to_decimals, list_data))

# Write data frame to disk
for i in (range(len(list_data) + 13)):
    data_frames[i].to_csv('data/batch/R' + str(i+13) + '.csv')
