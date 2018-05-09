import pandas as pd
import matplotlib.pyplot as plt
import tellurium as te
from scipy.optimize import differential_evolution as diff_evol
# from functions_model import convert_data_to_moles
from functions_model import parameter_estimation
from functions_model import convert_SER522_to_moles


# te.setDefaultPlottingEngine("matplotlib")

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



    alpha = 0.0211; # Check units
    beta = 0.0195 #67.30468128; # Check units
    mu_max = 0.329; # [1/h]
    Kc = 0.549; # [mol/kg] # Kc? 
    a = -0.235;
    b = -0.0237;
    ms = -0.0075; 
    Fin = 0 #00000121;
    k = 0.0005;
    c_glufeed = 1110;


    ######## Initial conditions
    Glucose = 0.0031083180000000001 # [mol] 
    Serine = 1e-08 #c_serine0*comp1 # [mol]
    Biomass = 0.00043477899999999999 # [mol]
    #V0 = 0.00010428; #[m^3]
    V = 0.00010303;
    F0 = 0.0001; # [m^3/h] # The value of the volume at the end of the batch phase



    ######## If fed batch
    at (time > 25): Fin = F0*exp(beta*time)  # Should beta be k here? 

    ######## Function for volume in batch
    #V := V0-(0.00000121*time) #[m^3]


    ######## Function for volume in fed-batch
    EqVolume: -> V; Fin

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
    EqGlucose: -> Glucose; r_s + Fin*c_glufeed # [mol/h]



    end
'''
r = te.loada(Modelfermentation)

# We can set the lists so it has the same order as the data
r.timeCourseSelections = ['time', 'Glucose', 'Serine', 'Biomass', 'V']

# Time interval must mach the exact value from the experiment, for the parameter estimation.
results = r.simulate(2, 100, 100)
print(results)

# Function for converting the data to mol and drop the NaN rows
# The data are in mmol
Data_sent = pd.read_csv("SER522_COO2_R2_moles.csv")
Compounds_in_mol = convert_SER522_to_moles(Data_sent)

# Parameter estimation not yet working for the fed-batch because we do not yet have data
# Parameters = parameter_estimation(Modelfermentation)

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