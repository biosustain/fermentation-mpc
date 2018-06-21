import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
import tellurium as te
from functions_model import convert_data_to_moles
from functions_model import parameter_estimation
#te.setDefaultPlottingEngine("matplotlib")

# The following relevant for the estimation parameters with tellurium
class SpecialDict(dict):

    def values(self):
        return list(super().values())


# The model starts here:
# It contains the substrates glucose and the products serine and biomass as solids
# It consists of the mass balancing equations
# Units are given in comments in square brackets []
# The initial conditions are found from the experiment


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
r.timeCourseSelections = ['time', 'glucose','serine','biomass','mu']

# Time interval must mach the exact value from the experiment
results = r.simulate(2, 23.5, 100)




#
# #print(results)
#
#
#r.exportToSBML("batch_model.xml")

#
# #function for data and we need to convert the data to mol, because the units of the compounds is now in g/L.
# #file = 'C002_R2_overview.xlsm'
# #experimental_data = pd.ExcelFile(file)
# #compounds_in_mol,vol = convert_data_to_moles(experimental_data)
# #print(compounds_in_mol)
#
#
#
# #Experimental dataset 1
# #file = 'R2_data_in_moles.csv'
# #experimental_data = pd.ExcelFile(file)
# #experimental_data = experimental_data.parse('Sheet1')
#
# experimental_data = pd.read_csv('R2_data_in_moles.csv')
# experimental_data.dropna(inplace=True)
# experimental_data.reset_index(inplace=True, drop=True)
# # experimental_data.to_csv("Data_to_estimate_from.csv", index=False)
# experimental_data = experimental_data.reindex(
#     columns=['Time (hours)', 'mol-Glucose', 'mol-Serine', 'C-mol-Biomass'])
# experimental_data.to_csv("R2_Data_to_estimate_from.csv", index=False)
#
# print(experimental_data)
#
# #Experimental dataset 2
# # file2 = 'R1_data_in_moles.csv'
# # experimental_data2 = pd.ExcelFile(file2)
# # experimental_data2 = experimental_data2.parse('R1_data_in_moles')
#
# experimental_data2 = pd.read_csv('R1_data_in_moles.csv')
# experimental_data2.dropna(inplace=True)
# experimental_data2.reset_index(inplace=True, drop=True)
# #experimental_data2.to_csv("Data_to_estimate_from.csv", index=False)
# experimental_data2 = experimental_data2.reindex(
#     columns=['Time (hours)', 'mol-Glucose', 'mol-Serine', 'C-mol-Biomass'])
#
# print(experimental_data)
#
#
# # Parameter estimation:
# #parameters = parameter_estimation(modelfermentation)
# #print(parameters)
#
# #Data_from_program = pd.read_csv("Data_to_estimate_from.csv")
# #print(Data_from_program)
#
# plt.plot(results[:, 0], (results[:, 4]))
# plt.show()
#
#
# # Plot of the results from the model and the experimental data
# # When plotting it could be multiplied by 1000 to get mmol
# plt.figure(num=None, figsize=(10, 7), dpi=80, facecolor='w', edgecolor='k')
#
# plt.subplot(3, 2, 1)
# plt.plot(results[:, 0], (results[:, 3]))
# plt.scatter(experimental_data['Time (hours)'], experimental_data['C-mol-Biomass'])
# plt.scatter(experimental_data2['Time (hours)'], experimental_data2['C-mol-Biomass'])
# plt.legend(['Biomass from model', 'Biomass from data'], loc='upper left')
#
# plt.subplot(2, 2, 2)
# plt.plot(results[:, 0], results[:, 2])
# plt.scatter(experimental_data['Time (hours)'], experimental_data['mol-Serine'])
# plt.scatter(experimental_data2['Time (hours)'], experimental_data2['mol-Serine'])
# plt.legend(['Serine from model', 'Serine from data'], loc='upper left')
#
# plt.subplot(2, 2, 3)
# plt.plot(results[:, 0], results[:, 1])
# plt.scatter(experimental_data['Time (hours)'], experimental_data['mol-Glucose'])
# plt.scatter(experimental_data2['Time (hours)'], experimental_data2['mol-Glucose'])
# plt.legend(['Glucose from model', 'Glucose from data'], loc='upper left')
#
#
# plt.show()
















