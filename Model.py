import pandas as pd
import matplotlib.pyplot as plt
import tellurium as te
from scipy.optimize import differential_evolution as diff_evol
#from functions_model import convert_data_to_moles
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
Modelfermentation = '''
model *IDModel()

    ######## Set the compartment to 1, otherwise it will be multiplied by the compounds. 
    compartment comp1;
    comp1 =1;
    
    
    ######## Specify the species in the compartment
    Glucose in comp1; Serine in comp1; Biomass in comp1;
    
    
    ######## Constants
    alpha = 24.68070389; # Check units
    beta = 67.30468128; # Check units
    mu_max = 0.26017167; # [1/h]
    Kc = 1.0522095; # [mol/kg] # Kc? 
    a = -0.2572;
    b = -0.7651;
    ms = -0.0046; 
    
    
    ######## Initial conditions
    Glucose = 8.254856e-06 # [mol] 
    Serine = 0 #c_serine0*comp1 # [mol]
    Biomass = 5.538306e-07 # [mol]
    V0 = 0.00010428; #[m^3]
    
    
    ######## Function for volume
    V := 0.00010302999999999999-(0.00000121*time) #[m^3]
    
    ######## Concentrations that is used in the equations
    c_glucose := Glucose/V  # [mol/m^3]
    c_biomass := Biomass/V # [mol/m^3] 
    
    ######## Functions
    mu := mu_max*(c_glucose/((Kc*c_biomass)+c_glucose)) # [1/h]
    qp_s := alpha*mu/(beta+mu) # [mol_serine/(mol_biomass*h)]
    qs_g := a*mu + b*qp_s + ms 
    rp_s := qp_s*Biomass # [mol/h] 
    r_s := qs_g*Biomass # [mol/h]

    
    ######## Mass Balances    
    EqBiomass: -> Biomass; mu*Biomass # [c-mol/h]
    EqSerine: -> Serine; rp_s
    EqGlucose: -> Glucose; r_s # [mol/h]



    end
'''
r = te.loada(Modelfermentation)

# We can set the lists so it has the same order as the data
# r.timeCourseSelections = ['time', 'comp1', 'Glucose','Acetate','Biomass']

# Time interval must mach the exact value from the experiment
results = r.simulate(2, 23.5, 100)
print(results)


#function for data and we need to convert the data to mol, because the units of the compounds is now in g/L.
#file = 'C002_R2_overview.xlsm'
#Experimental_data = pd.ExcelFile(file)
#Compounds_in_mol = convert_data_to_moles(Experimental_data)
#print(Compounds_in_mol)

# The data are in mmol
Data_sent = pd.read_csv("SER522_COO2_R2_moles.csv")
print(Data_sent)
# # Drop the columns with NaN
Data_sent.dropna(inplace=True)
Data_sent.reset_index(inplace=True, drop=True)
Data_sent = Data_sent.reindex(columns=['time', 'VC_GLU', 'VC_SER', 'VC_X'])

Time = (Data_sent['time'])
Glucose_mol = (Data_sent['VC_GLU'] / 1000)
Serine_mol = (Data_sent['VC_SER'] / 1000)
Biomass_cmol = (Data_sent['VC_X'] /1000)


Compounds_in_mol = pd.DataFrame(
    {'Time [hours]': Time,
     'Biomass [c-mol]': Biomass_cmol,
     'Serine [mol]': Serine_mol,
     'Glucose [mol]': Glucose_mol
     })
Compounds_in_mol = Compounds_in_mol.reindex(
    columns=['Time [hours]', 'Glucose [mol]', 'Serine [mol]', 'Biomass [c-mol]'])


print(Compounds_in_mol)
Compounds_in_mol.to_csv("Data_to_estimate_from.csv", index=False)



# Parameter estimation:
Parameters = parameter_estimation(Modelfermentation)
print(Parameters)

#Data_from_program = pd.read_csv("Data_to_estimate_from.csv")
#print(Data_from_program)



# Plot of the results from the model and the experimental data
# When plotting it could be multiplied by 1000 to get mmol
plt.figure(num=None, figsize=(10, 7), dpi=80, facecolor='w', edgecolor='k')

plt.subplot(3, 2, 1)
plt.plot(results[:, 0], (results[:, 3]))
plt.scatter(Compounds_in_mol['Time [hours]'], Compounds_in_mol['Biomass [c-mol]'])
plt.legend(['Biomass from model', 'Biomass from data'], loc='upper left')

plt.subplot(2, 2, 2)
plt.plot(results[:, 0], results[:, 2])
plt.scatter(Compounds_in_mol['Time [hours]'], Compounds_in_mol['Serine [mol]'])
plt.legend(['Serine from model', 'Serine from data'], loc='upper left')

plt.subplot(2, 2, 3)
plt.plot(results[:, 0], results[:, 1])
plt.scatter(Compounds_in_mol['Time [hours]'], Compounds_in_mol['Glucose [mol]'])
plt.legend(['Glucose from model', 'Glucose from data'], loc='upper left')


plt.show()















