#!/usr/bin/python3

############################################################################
# Plots mean (mu), standard deviation (sigma), and significant digits (s)  #
# from a set of stochastic outputs from tchebychev.                        #
############################################################################

import sys
import re
import numpy as np

import matplotlib
# Use Agg backend for headless runs
matplotlib.use('Agg')

import matplotlib.pyplot as plt
import math


# Read command line arguments
if len(sys.argv) != 3 or not sys.argv[1].endswith('.tab'):
    print("usage: ./plot_all.py DATA.tab preset")
    sys.exit(1)

fname = sys.argv[1]
preset = sys.argv[2]
version = fname[:-4]

# Parse table file
# three columns:
#   - i: sample number
#   - x: input value
#   - T: polynomial evaluation on x, T(x)
D = np.loadtxt(fname, skiprows=1,
        dtype = dict(names=('i', 'x', 'T'),
                     formats=('i4', 'f8', 'f8')))

# Compute all statistics (mu, sigma, s)
x_values = np.unique(D['x'])
T_values = []

for x in x_values:
    T_samples = D[D['x'] == x]['T']
    T_values.append(T_samples[0])

# Set title
title=version + " vprec " + preset
plt.figure(title, figsize=(10,8))
plt.suptitle(title)

# Plot significant digits
plt.subplot(111)
plt.ylabel("$T$")
plt.ylim(-2,2)
plt.plot(x_values, T_values, '.')

# Set layout
plt.tight_layout()
plt.subplots_adjust(top=0.9)

# Save plot as pdf
plotname=version+"-vprec.pdf"
plt.savefig(plotname, format='pdf')
