import warnings
warnings.filterwarnings("ignore", message="numpy.dtype size changed")
warnings.filterwarnings("ignore", message="numpy.ufunc size changed")
import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
from time_converter_function import time_to_decimals

# R1 = pd.read_csv('data/SER_C016_Reactor1_0,5g-LGlucose.csv')
# R2 = pd.read_csv('data/SER_C016_Reactor2_1,0g-LGlucose.csv')
# R3 = pd.read_csv('data/SER_C016_Reactor3_2,0g-LGlucose.csv')
# R4 = pd.read_csv('data/SER_C016_Reactor4_3,0g-LGlucose.csv')
# R5 = pd.read_csv('data/SER_C016_Reactor5_5,0g-LGlucose.csv')
# R6 = pd.read_csv('data/SER_C016_Reactor6_7,5g-LGlucose.csv')
# R7 = pd.read_csv('data/SER_C016_Reactor7_10,0g-LGlucose.csv')
# R8 = pd.read_csv('data/SER_C016_Reactor8_20,0g-LGlucose.csv')
# R9 = pd.read_csv('data/SER_C016_Reactor9_40,0g-LGlucose.csv')
# R10 = pd.read_csv('data/SER_C016_Reactor10_60,0g-LGlucose.csv')
# R11 = pd.read_csv('data/SER_C016_Reactor11_120,0g-LGlucose.csv')
# R12 = pd.read_csv('data/SER_C016_Reactor12_150,0g-LGlucose.csv')

R13 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor13_6g-LGlycine_0,03FeedRate.csv')
R14 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor14_6g-LGlycine_0,03FeedRate.csv')
R15 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor15_6g-LGlycine_0,05FeedRate.csv')
R16 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor16_6g-LGlycine_0,05FeedRate.csv')
R17 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor17_6g-LGlycine_0,02FeedRate.csv')
R18 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor18_6g-LGlycine_0,02FeedRate.csv')
R19 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor19_4g-LGlycine_0,03FeedRate.csv')
R20 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor20_4g-LGlycine_0,03FeedRate.csv')
R21 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor21_4g-LGlycine_0,05FeedRate.csv')
R22 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor22_4g-LGlycine_0,05FeedRate.csv')
R23 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor23_4g-LGlycine_0,02FeedRate.csv')
R24 = pd.read_csv('/Users/s144510/Documents/fermentationtool/data/SER_C016_Reactor24_4g-LGlycine_0,02FeedRate.csv')

list_data = [R13, R14, R15, R16, R17, R18, R19, R20, R21, R22, R23, R24]
data_frames = list(map(time_to_decimals, list_data))


# Write dataframe to disk
for i in (range(len(list_data) + 13)):
    data_frames[i].to_csv('data/fedbatch/R' + str(i+13) + '.csv')
