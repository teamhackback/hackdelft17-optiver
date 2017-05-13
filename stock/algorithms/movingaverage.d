module stock.algorithms.movingaverage;

import stock.framework;

import std.algorithm;
import std.datetime;
import std.math;
import std.path;
import std.random;
import std.stdio;
import std.format;
import std.file;

class MovingAverageTrader : Trader
{
    int n, m;
    double avgN = 0, avgM = 0;
    int countN, countM;

    this(int _n, int _m)
    {
        n = _n;
        m = _m;
    }

    override void onNewPrice(Price price)
    {
        if (!tradingIsOpen || finalPriceIsNext) return;

        if (countN < n)
        {
            countN++;
            avgN = avgN + (price.price - avgN) / countN;
        }
        else
        {
            avgN = avgN + (price.price - avgN) / n;
        }

        if (countM < m)
        {
            countM++;
            avgM = avgM + (price.price - avgM) / countM;
        }
        else
        {
            avgM = avgM + (price.price - avgM) / m;
        }

        // start trading after averages are available
        if (countN >= n && countM >= m)
        {
            //writefln("avgN: %f", avgN);
            //writefln("avgM: %f", avgM);
            //writefln("countN: %d", countN);
            //writefln("countM: %d", countM);
            double b_t = avgM - avgN;

            if (b_t >= 0)
            {
                //writefln("buying signal");
                if (currentStock.abs < 100)
                    makeOrder(price.date + 1.seconds, 10);
            }
            else
            {
                //writefln("selling signal");
                if (currentStock.abs < 100)
                    makeOrder(price.date + 1.seconds, -10);
            }
        }
    }

    override string name()
    {
        return "n:%d-m:%d".format(n, m);
    }
}

version(MovingAverageTrader)
void main(string[] args)
{
    import std.typecons;
    import std.array;
    import std.parallelism;
    import std.range;
    auto ns = iota(3000, 50000, 1000);
    auto ms = iota(100, 2000, 100);

    Appender!(Trader[]) app;

    foreach(n; ns)
    foreach(m; ms)
        app ~= new MovingAverageTrader(n, m);

    app.data.analyzeTraders(buildPath("out", "movingaverage", "all.csv"));
}
