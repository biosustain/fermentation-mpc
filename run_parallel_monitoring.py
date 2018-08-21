from monitoring import watcher
from multiprocessing import Process

# Set the inputs
filename_experimental_data1 = "R1_data_in_moles.csv"
filename_experimental_data2 = "R2_data_in_moles.csv"


alpha_lower_bound = "-1000"
alpha_upper_bound = "1000"
beta_lower_bound = "-1000"
beta_upper_bound = "1000"

model_for_parest_1 = "parameter_estimation/model_mu_1"
model_for_parest_2 = "parameter_estimation/model_mu_2"
model_for_parest_3 = "parameter_estimation/model_mu_3"
model_for_parest_4 = "parameter_estimation/model_mu_4"

output_1 = "output_1.csv"
output_2 = "output_2.csv"
output_3 = "output_3.csv"
output_4 = "output_4.csv"

Sheet = 'Sheet1'
Sheet_2 = 'Channel 5'
Sheet_3 = 'Channel 6'
Sheet_4 = 'Channel 7'

# Multiprocessing of the watcher and parameter estimation file

p1 = Process(target=watcher,
             args=(output_1, filename_experimental_data1, filename_experimental_data2, alpha_lower_bound,
                   alpha_upper_bound, beta_lower_bound, beta_upper_bound, model_for_parest_1, Sheet))

# p2 = Process(target=watcher,
#              args=(output_2, filename_experimental_data1, filename_experimental_data2, alpha_lower_bound,
#                    alpha_upper_bound, beta_lower_bound, beta_upper_bound, model_for_parest_2, Sheet_2))
#
# p3 = Process(target=watcher,
#              args=(output_3, filename_experimental_data1, filename_experimental_data2, alpha_lower_bound,
#                    alpha_upper_bound, beta_lower_bound, beta_upper_bound, model_for_parest_3, Sheet_3))
#
# p4 = Process(target=watcher,
#              args=(output_4, filename_experimental_data1, filename_experimental_data2, alpha_lower_bound,
#                    alpha_upper_bound, beta_lower_bound, beta_upper_bound, model_for_parest_4, Sheet_4))
p1.start()
# p2.start()
# p3.start()
# p4.start()

try:
    p1.join()
    # p2.join()
    # p3.join()
    # p4.join()

except KeyboardInterrupt:
    print('program exit')
