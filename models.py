import matplotlib
matplotlib.use('TkAgg')
import tellurium as te


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
