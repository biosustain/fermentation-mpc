

from monitoring import watcher
import pandas as pd


filename_experimental_data1 = "data/R1_data_in_moles.csv"
filename_experimental_data2 = "data/R2_data_in_moles.csv"
alpha_lower_bound = "-1000"
alpha_upper_bound = "1000"
beta_lower_bound = "-1000"
beta_upper_bound = "1000"
model_for_parest = "model_mu_1"

watch_file = '/Users/s144510/Documents/fermentationtool/data/MUX_09-03-2018_18-38-27.XLS'
online_data = pd.ExcelFile(watch_file)
online_data = online_data.parse('Sheet1')


watcher(online_data, filename_experimental_data1,filename_experimental_data2,alpha_lower_bound,
                       alpha_upper_bound, beta_lower_bound,beta_upper_bound, model_for_parest)