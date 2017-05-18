# Gekko

This was our implementation for the algorithmic trading challenge by Optiver at
HackDelft 2017.

## Data Exploration

The entire 100 days of trading prices are plotted here.

![entire dataset (100 days)](/plots/100days.png?raw=true "entire_dataset")

The lagplot below shows the correlation between the price at second t and t-1.
The data was resampled to 30 mins interval.

![laplot](/plot/lagplot_30mins.png?raw=true "lagplot_30mins")

The autocorrelation plot below again for the series resampled at 30 mins interval
shows how the series correlates to a delayed copy of itself as function of delay.

![autocorrelation](/plot/autocorrelation_30mins.png?raw=true "autocorrelation_30mins")

The plot below shows the trend based on the season decomposition provided by
the `tsa` module in the [statsmodel](http://www.statsmodels.org) package.

![trends](/plot/season_decompose.png?raw=true "trends")

## Trading Strategies

+ Greedy
+ Breakout
+ Moving Average
+ Heuristics
+ Desperate
