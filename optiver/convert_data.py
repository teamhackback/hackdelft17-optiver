#!/home/balint/virtualenvs/py34/bin/python
import numpy as np
import pandas as pd
from datetime import date, datetime, time
#import matplotlib.pyplot as plt
#import seaborn


def bday_gen(current_date=datetime(2017, 1, 1, 9)):

    while True:
        current_date = np.busday_offset(current_date, offsets=1, roll='forward')
        yield pd.Timestamp(current_date).to_pydatetime().date()


def write_to_file(grp):
    if not grp.empty:
        date = grp.index[0].to_pydatetime().date()
        fname = str(date) + '_prices.csv'
        print('Writing ', fname)
        grp.drop('date', axis=1, inplace=True)
        grp.to_csv(fname)


full_df = pd.read_csv('data_final_002.csv', index_col=0)

indices = []
b = bday_gen()
for i in range(int(len(full_df) / 30600)):
    current_day = next(b)
    starttime = datetime.combine(current_day, time(9, 0))
    endtime = datetime.combine(current_day, time(17, 29, 59))
    #print(starttime, endtime)
    current_ind = pd.DatetimeIndex(start=starttime, end=endtime, freq='s')
    indices.append(current_ind)

    index = indices[0]
for i in range(1, len(indices)):
    index = index.append(indices[i])

full_df['times'] = index
full_df.set_index('times', inplace=True)
full_df['price'] = full_df['0'] * 3000
full_df['date'] = full_df.index.date

# uncomment this for writing the whole dataset into prices.csv
# full_df['2017-01-04':][['price']].round(2).to_csv('prices.csv')

groups = full_df['2017-01-04':][['price', 'date']].round(2).groupby('date', group_keys=True)
# Uncomment this for writing the files daily into files like 2017-01-03_prices.csv
#groups.apply(write_to_file)

# uncomment below to plot the prices

# perrow = 10
# nr_row = int(np.ceil(groups.ngroups / perrow))
# fig, axs = plt.subplots(figsize=(30, 25), nrows=nr_row, ncols=perrow, gridspec_kw=dict(hspace=0.4))
# glist = list(groups.groups.keys())
# glist.sort()
# targ = zip(glist, axs.flatten())
# for i, (key, ax) in enumerate(targ):
#     ax.plot(groups.get_group(key)[['price']].resample('5T').mean().dropna())
#     ax.set_xticklabels([])
#     ax.set_yticklabels([])
#     ax.set_title(key)
# ax.legend()
# plt.show()
