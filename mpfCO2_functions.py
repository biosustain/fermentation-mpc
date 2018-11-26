import pandas as pd
from time_converter_function import time_to_decimals
import numpy as np
from models import fed_batch_model_mu
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from parest_copasi import parameter_estimation
from parest_copasi import parameter_estimation_online
import os
import sys
import time
from plotly import tools
import plotly
import plotly.graph_objs as go
from models import fed_batch_model
from parest_copasi import parameter_estimation_online_fedbatch

def model_feed_settings(fp, data_frame, alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max):
    print(fp.serine)
    fp.resetToOrigin()
    fp.alpha = float(alpha)
    fp.beta = float(beta)
    fp.Ks_qs = float(Ks_qs)
    fp.qs_max = float(qs_max)
    fp.Ki = float(Ki)
    fp.Ks = float(Ks)
    fp.mu_max = float(mu_max)
    fp.biomass = data_frame['Biomass (g)'].iloc[-1]
    fp.serine = data_frame['Serine (g)'].iloc[-1]
    fp.glucose = data_frame['Glucose (g)'].iloc[-1]
    fp.V = data_frame['V'].iloc[-1]
    #fp.reset()
    print(fp.serine)

def model_feed_settings_loop(fp, data_frame, alpha, beta, Ks_qs, qs_max, Ki, Ks, mu_max, j):
    fp.reset()
    fp.mu_set = j
    fp.alpha = float(alpha)
    fp.beta = float(beta)
    fp.Ks_qs = float(Ks_qs)
    fp.qs_max = float(qs_max)
    fp.Ki = float(Ki)
    fp.Ks = float(Ks)
    fp.mu_max = float(mu_max)
    fp.biomass = data_frame['Biomass (g)'].iloc[-1]
    fp.serine = data_frame['Serine (g)'].iloc[-1]
    fp.glucose = data_frame['Glucose (g)'].iloc[-1]
    fp.V = data_frame['V'].iloc[-1]