module stock.algorithms.naive;

import stock.framework;

import std.algorithm;
import std.datetime;
import std.math;
import std.path;
import std.random;
import std.stdio;

class MovingAverageTrader : Trader
{
    int n, m;
    double avg_n = 0, avg_m = 0;
    int count_n, count_m;

    this(int n_p, int m_p)
    {
        n = n_p;
        m = m_p;
    }

    override void onNewPrice(Price price)
    {
        if (!tradingIsOpen) return;
        if (finalPriceIsNext)
        {
            makeOrder(price.date + 1.seconds, -currentStock);
            return;
        }

        if (count_n < n)
        {
            count_n++;
            avg_n = avg_n + (price.price - avg_n) / count_n;
        }
        else
            avg_n = avg_n + (price.price - avg_n) / n;

        if (count_m < m)
        {
            count_m++;
            avg_m = avg_m + (price.price - avg_m) / count_m;
        }
        else
            avg_m = avg_m + (price.price - avg_m) / m;

        // start trading after averages are available
        if (count_n >= n && count_m >= m)
        {
            //writefln("avg_n: %f", avg_n);
            //writefln("avg_m: %f", avg_m);
            //writefln("count_n: %d", count_n);
            //writefln("count_m: %d", count_m);
            double b_t = avg_m - avg_n;

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
}

version(MovingAverageTrader)
void main(string[] args)
{
    string stockFolder = buildPath("optiver", "data");
    auto days = stockFolder.readDays;

    import std.typecons;
    import std.array;
    import std.parallelism;
    import std.range;
    alias NMTuple = Tuple!(int, "n", int, "m");
    Appender!(NMTuple[]) app;

    foreach(n; iota(3000, 30000, 500))
    foreach(m; iota(100, 2000, 100))
        app ~= NMTuple(n, m);

    foreach(nm; app.data.parallel(1))
    {
        //writefln("starting n: %d, m: %d ", nm.n, nm.m);
        Trader trader = new MovingAverageTrader(nm.n, nm.m);
        auto balance = runSimulation(trader, days);
        if (balance > 0 )
            writefln("n: %d, m: %d, balance: %.2f", nm.n, nm.m, balance);
    }
}
