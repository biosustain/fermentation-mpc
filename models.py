import pandas as pd
import matplotlib
matplotlib.use('TkAgg')
import tellurium as te


def batch_model():
    fermentation_model = '''
    model *IDModel()

        ######## Set the compartment to 1, otherwise it will be multiplied by the compounds. 
        compartment comp1;
        comp1 =1;


        ######## Specify the species in the compartment
        glucose in comp1; serine in comp1; biomass in comp1;


        ######## Constants
        alpha = 21.5 #29.1 #21.542 #24.6807; # Check units
        beta = 90.3 #68.8 #90.2844 #67.3047; # Check units
        mu_max = 0.3 #0.98 #0.327912 #0.260172; # [1/h]
        kc = 1.2 #7.48 #1.24659 #1.05221; # [mol/kg] # Kc? 
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

    r = te.loada(fermentation_model)
    return r


def batch_model_mu():
    fermentation_model = '''
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
        
        mu = 0.12345 # This mu value is not used, it has this value so it can be easily found in the xml written model
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

    r = te.loada(fermentation_model)
    return r


def fed_batch_model():
    fermentation_model = '''
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
        at (time > 25): Fin = F0*exp(beta*time)  

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
    r = te.loada(fermentation_model)
    return r
