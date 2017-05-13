#!/home/balint/virtualenvs/py34/bin/python
import numpy as np
import pandas as pd
import collections
#from tqdm import tqdm
from datetime import date, datetime, time
import os


def trade_generator(max_lots=100, close_by=30601):
    
    trade = 0
    pos = 0
    nr = 0
    while True:
        nr += 1
        next_price = yield trade

        if nr == close_by:
            trade = -pos
        else:
            desired_trade = np.round(np.random.normal(loc=0, scale=5))
            if pos + desired_trade > max_lots:
                trade = max_lots - pos
            elif pos + desired_trade < -1 * max_lots:
                trade = -1 * pos - max_lots
            else:
                trade = desired_trade
        pos += trade


day_prices = [f for f in os.listdir('.') if '_prices.csv' in f]

day_prices.sort()
for price_filename in day_prices:
# tqdm gives a nice progress bar of how much time is left
# for price_filename in tqdm(day_prices):
    dataframe = pd.read_csv(price_filename, index_col='times', parse_dates=True)
    c = dataframe['price'].values

    l = len(c)
    g = trade_generator(max_lots=100, close_by=l)
    g.send(None)
    pos = np.zeros(l)

    for i in range(l):
        pos[i] = g.send(c[i])

    pd.DataFrame(index=dataframe.index, columns=['trades'], data=pos).to_csv(price_filename.replace('prices', 'trades'))
