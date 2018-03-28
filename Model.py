import tellurium as te

te.setDefaultPlottingEngine("matplotlib")
#% matplotlib inline

import numpy
import matplotlib.pyplot as plt

from scipy.optimize import differential_evolution as diff_evol


# The following only relevant if one need to estimate parameters with tellurium
class SpecialDict(dict):

    def values(self):
        return list(super().values())

