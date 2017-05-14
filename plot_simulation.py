#!/usr/bin/env python
# -*- coding: utf-8 -*-

from os import listdir, makedirs
from os.path import isfile, join
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sys
import time
from datetime import datetime

if len(sys.argv) < 2:
    print("No order file found")
    exit(-1)

order_file = sys.argv[1]

orders = pd.read_csv(order_file, parse_dates=['times'], index_col=['times'])
# orders = orders.resample('1T').mean()

data_path = './optiver/data'
print("starting parsing.")
files = list(sorted([f for f in listdir(data_path)]))
print("parsing done.")

df_daily = []
df_50_days = pd.DataFrame()

for idx, file in enumerate(files):
    df = pd.read_csv(join(data_path, file), parse_dates=['times'], index_col=['times'])
    # take an average over X seconds
    # df = df.resample('1T').mean()
    df_daily.append(df)
    df_50_days = df_50_days.append(df)

print("df generated.")
day_image_folder = order_file.replace(".csv", "")
makedirs(day_image_folder, exist_ok=True)
print("starting generating days.")

for idx, file in enumerate(files):
    fig, ax1 = plt.subplots(figsize=(20, 6))
    day = df_daily[idx]
    day_index = day.index.values
    day_date = str(day_index[0].astype('M8[D]').astype('O'))
    plt.xlim(day_index[0], day_index[-1])
    ax1.plot(day.index.values, day.price.values)

    date = day.index[0].date()
    orders_all = orders.loc[str(date)].dropna()
    orders_buy = orders_all.loc[orders_all.trades > 0].resample('1T').sum()
    orders_sale = orders_all.loc[orders_all.trades < 0].resample('1T').sum()

    width = 0.001
    ax2 = ax1.twinx()
    ax2.set_xlim(day_index[0], day_index[-1])
    # ax2.set_ylim(-105, 105)
    ax2.bar(orders_buy.index.values, orders_buy.trades.values, width=width, color='g')
    ax2.bar(orders_sale.index.values, orders_sale.trades.values, width=width, color='r')
    plt.savefig(day_image_folder + "/" + day_date + ".svg", bbox_inches='tight')
    plt.cla()
    plt.clf()
print("day image generated.")
