#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

if len(sys.argv) < 2:
    print("No log file found")
    exit(-1)

algo_file = sys.argv[1]

fig, ax1 = plt.subplots(figsize=(20, 6))

algos = pd.read_csv(algo_file)
print("starting to plot")
algos['date'] = pd.to_datetime(algos['date'])
ax1.plot(algos.date.values, algos.price.values)

ax2 = ax1.twinx()
algos = algos.dropna()[1000:]
ax2.plot(algos.date.values, algos.betaMax.values, label="betaMax", color='r')
# ax1.plot(algos.date.values, algos.betaSmall.values, label="betaSmall")

plt.legend(loc='upper right')
plt.savefig(algo_file.replace(".csv", ".svg"), bbox_inches='tight')
plt.cla()
plt.clf()
