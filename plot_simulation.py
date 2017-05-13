#!/usr/bin/env python
# -*- coding: utf-8 -*-

from os import listdir
from os.path import isfile, join
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys
import time

if len(sys.argv) < 2:
    print("No order file found")
    exit(-1)

order_file = sys.argv[1]
binning_factor = 60
items_per_day = 30600 / binning_factor
days_per_tick = 5

data_path = './optiver/data'
print("starting parsing.")
files = list(sorted([f for f in listdir(data_path)]))
print("parsing done.")

df_daily = []
df_50_days = pd.DataFrame()

for idx, file in enumerate(files):
    df = pd.read_csv(join(data_path, file), parse_dates=['times'], index_col=['times'])
    # take an average over X seconds
    df = df.resample('1T').mean()
    df_daily.append(df)
    df_50_days = df_50_days.append(df)

print("df generated.")

fig, ax_arr = plt.subplots(nrows=10, ncols=5, figsize=(30, 30))
plt.subplots_adjust(hspace=0.5)
for idx, file in enumerate(files):
    df_daily[idx].price.plot(ax=ax_arr[idx // 5, idx % 5], sharex=True)
    ax_arr[idx // 5, idx % 5].set_title(file.split('_')[0])

plt.savefig(order_file.replace(".csv", "_subs.svg"), bbox_inches='tight')
plt.cla();
plt.clf();

print("ax plot started.")
fig, axes = plt.subplots(figsize=(25, 5))
xticks = []
xticks_labels = []
for i in range(len(files)):
    plt.axvline(x=i * items_per_day, color='k', lw=0.5)
    if i % days_per_tick == 0:
        xtick = i * items_per_day
        xticks.append(xtick)
        label = df_50_days.index[int(xtick)]
        xticks_labels.append(label.strftime("%Y-%m-%d"))
df_50_days.price.plot(ax=axes, use_index=False)

plt.savefig(order_file.replace(".csv", "_whole.svg"), bbox_inches='tight')

print("plot done.")
