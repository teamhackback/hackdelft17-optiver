naive:
	rdmd -g -version=NaiveTrader ./stock/algorithms/naive.d

movingaverage:
	rdmd -g -version=MovingAverageTrader ./stock/algorithms/movingaverage.d

movingaverage_opt:
	rdmd --compiler=ldmd -O3 -mcpu=native -version=MovingAverageTrader ./stock/algorithms/movingaverage.d