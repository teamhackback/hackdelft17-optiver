#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

if len(sys.argv) < 2:
    print("No log file found")
    exit(-1)

nr_graphs = 5
algo_file = sys.argv[1]

algos = pd.read_csv(algo_file)
print("starting to plot")
algos['date'] = pd.to_datetime(algos['date'])
algos = algos.sort_values(['total'], ascending=False)
i = 0
for name, group in algos.groupby(['algorithm'], sort=False):
    group = group.sort_values(['date'])
    plt.plot(group.date.values, group.balance.values, label=name)
    if i >= nr_graphs:
        break
    i += 1

plt.legend(loc='upper right')
plt.savefig(algo_file.replace(".csv", ".svg"), bbox_inches='tight')
plt.cla()
plt.clf()

i = 0
for name, group in algos.groupby(['algorithm'], sort=False):
    group = group.sort_values(['date'])
    plt.plot(group.date.values, np.cumsum(group.balance.values), label=name)
    if i >= nr_graphs:
        break
    i += 1

plt.legend(loc='upper right')
plt.savefig(algo_file.replace(".csv", "_cum.svg"), bbox_inches='tight')
