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
        biomass in comp1; V in comp1; glucose in comp1; serine in comp1; 


        ######## Constants
        alpha = 0.05846170603
        beta = 1.114915272e-10
        mu_max = 0.2114514111
        kc = 0.5787273839
        a = -0.4015362233;
        b = -0.4237085289;
        ms = -1.871821912e-10; 


        ######## Initial conditions
        glucose = 8.254856e-03 #*1000 # [mol] 
        serine = 0 #c_serine0*comp1 # [mol]
        biomass = 5.538306e-04 #*1000 # [mol]
        V = 0.00010428; #[m^3]
        F = 0; #1.386900023e-6;


        ######## Function for volume
        #v := 0.00010302999999999999-(0.00000121*time) #[m^3]

        ######## Concentrations that is used in the equations
        c_glucose := glucose/V  # [mol/m^3]
        c_biomass := biomass/V # [mol/m^3] 
        
        qp_max = 0.09
        qs_max = -0.138786

        ######## Functions
        mu := mu_max*(c_glucose/((kc*c_biomass)+c_glucose)) # [1/h]
        qp_s := alpha*mu/(beta+mu) # [mol_serine/(c-mol_biomass*h)]
        qs_g := a*mu + b*qp_s + ms #[mol_glucose/(c-mol_biomass*h)]
        rp_s := qp_s*biomass # [mol/h] 
        r_s := qs_g*biomass # [mol/h]


        ######## Mass Balances    
        eq_biomass: -> biomass; mu*biomass - F*biomass/V # [c-mol/h]
        eq_serine: -> serine; rp_s - F*serine/V
        eq_glucose: -> glucose; r_s - F*glucose/V - 0.0001# [mol/h]
        eq_V: -> V; F 



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
    mu_model = '''
    model *IDModel()

        ######## Set the compartment to 1, otherwise it will be multiplied by the compounds. 
        compartment comp1;
        comp1 =1;


        ######## Specify the species in the compartment
        glucose in comp1; biomass in comp1; serine in comp1; #acetate in comp1


        ######## Constants
        mu_max = 0.2477 # [1/h]
        Ks = 1.4344 # [g/L]
        Ks_qs = 2.6784 # [g/L]
        Ki = 688309 # [g/L]
        qs_max = 1.4075 # (g/(g*h))
        F0 = 0.3 # [mL/h]
        mu_set = 0.02 # [1/h]
        alpha = 1.5007
        beta = 2.7714

        ######## Initial conditions
        V = 0.1021
        glucose = 0 # 0.149770*V # [g]
        biomass = 0.209504 #5.092*V # [g]
        serine = 0 # [g]

        ######## Feed function
        Fin := F0*exp(mu_set*time)/1000 # [L/h]


        ######## Function for volume in fed-batch
        EqVolume: -> V; Fin # [L/h]

        ######## Initial concentrations
        c_glucose := glucose/V # [g/L]
        c_glufeed = 415 # [g/L]
        c_biomass := biomass/V  # [g/L]


        ######## Functions
        mu := mu_max*c_glucose/(c_glucose+Ks+(c_glucose^2/Ki)) # [1/h]
        qs := qs_max*c_glucose/(Ks_qs+c_glucose) # [g_substrate/g_biomass h]
        qp := alpha*mu/(mu+beta)


        ######## Mass Balances 
        eq_biomass: -> biomass; mu*biomass # [g/h]
        eq_glucose: -> glucose; -qs*biomass + Fin*c_glufeed # [g/h]  
        eq_serine: -> serine; qp*biomass # [g/h]
        
        qpbio := qp*biomass
        sertiter := serine/V
        


        end
    '''

    r = te.loada(mu_model)
    return r


def fed_batch_model_mu():
    mu_model = '''
    model *IDModel()

        ######## Set the compartment to 1, otherwise it will be multiplied by the compounds. 
        compartment comp1;
        comp1 =1;


        ######## Specify the species in the compartment
        glucose in comp1; biomass in comp1; serine in comp1; #acetate in comp1


        ######## Constants
        mu_max = 0.2477 # [1/h]
        Ks = 1.4344 # [g/L]
        Ks_qs = 2.6784 # [g/L]
        Ki = 688309 # [g/L]
        qs_max = 1.4075 # (g/(g*h))
        F0 = 0.3
        mu_set = 0.02
        alpha = 1.5007
        beta = 2.7714

        ######## Initial conditions
        V = 0.1021
        glucose = 0 # 0.149770*V # [g]
        biomass = 0.209504 #5.092*V # [g]
        serine = 0 # [g]

        ######## Feed function
        Fin := F0*exp(mu_set*time)/1000 # [L/h]


        ######## Function for volume in fed-batch
        EqVolume: -> V; Fin # [L/h]

        ######## Initial concentrations
        c_glucose := glucose/V # [g/L]
        c_glufeed = 415 # [g/L]
        c_biomass := biomass/V


        ######## Functions
        mu = 0
        qs := qs_max*c_glucose/(Ks_qs+c_glucose) # [g_substrate/g_biomass h]
        qp := alpha*mu/(mu+beta)


        ######## Mass Balances 
        eq_biomass: -> biomass; mu*biomass # [g/h]
        eq_glucose: -> glucose; -qs*biomass + Fin*c_glufeed # [g/h]  
        eq_serine: -> serine; qp*biomass # [g/h]


        end
    '''

    r = te.loada(mu_model)
    return r
