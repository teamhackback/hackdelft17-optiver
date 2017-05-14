DC_OPT=rdmd --compiler=ldmd -O3 -mcpu=native

naive:
	rdmd -g -version=NaiveTrader ./stock/algorithms/naive.d

simpleaverage:
	rdmd -g -version=SimpleAverageTrader ./stock/algorithms/simpleaverage.d
simpleaverage_opt:
	$(DC_OPT) -version=SimpleAverageTrader ./stock/algorithms/simpleaverage.d

greedy:
	rdmd -g -version=GreedyTrader ./stock/algorithms/greedy.d

movingaverage:
	rdmd -g -version=MovingAverageTrader ./stock/algorithms/movingaverage.d
movingaverage_opt:
	$(DC_OPT) -version=MovingAverageTrader ./stock/algorithms/movingaverage.d

breakout:
	rdmd -g -version=BreakoutTrader ./stock/algorithms/breakout.d
breakout_opt:
	$(DC_OPT) -version=BreakoutTrader ./stock/algorithms/breakout.d
