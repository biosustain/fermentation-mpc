

from monitoring import watcher
from multiprocessing import Process, Queue



filename_experimental_data1 = "data/R1_data_in_moles.csv"
filename_experimental_data2 = "data/R2_data_in_moles.csv"

alpha_lower_bound = "-1000"
alpha_upper_bound = "1000"
beta_lower_bound = "-1000"
beta_upper_bound = "1000"

model_for_parest = "model_mu_1"
model_for_parest_2 = "model_mu_2"
model_for_parest_3 = "model_mu_3"
model_for_parest_4 = "model_mu_4"

output = "output.csv"
output_2 = "output_2.csv"
output_3 = "output_3.csv"
output_4 = "output_4.csv"

Sheet = 'Sheet1'
Sheet_2 = 'Channel 5'
Sheet_3 = 'Channel 6'
Sheet_4 = 'Channel 7'

# l1 = Queue()
# l2 = Queue()
# l3 = Queue()
# l4 = Queue()


p1 = Process(target=watcher,
             args=(output, filename_experimental_data1, filename_experimental_data2, alpha_lower_bound,
                                   alpha_upper_bound, beta_lower_bound, beta_upper_bound, model_for_parest, Sheet))

p2 = Process(target=watcher,
             args=(output_2, filename_experimental_data1, filename_experimental_data2, alpha_lower_bound,
                   alpha_upper_bound, beta_lower_bound, beta_upper_bound, model_for_parest_2, Sheet_2))

p3 = Process(target=watcher,
             args=(output_3, filename_experimental_data1, filename_experimental_data2, alpha_lower_bound,
                   alpha_upper_bound, beta_lower_bound, beta_upper_bound, model_for_parest_3, Sheet_3))

p4 = Process(target=watcher,
             args=(output_4, filename_experimental_data1, filename_experimental_data2, alpha_lower_bound,
                   alpha_upper_bound, beta_lower_bound, beta_upper_bound, model_for_parest_4, Sheet_4))

p1.start()
p2.start()
p3.start()
p4.start()

# join means that each of the processes will happen in order.
# The main purpose of join() is to ensure that a child process
# has completed before the main process does anything that depends on the work of the child process.
