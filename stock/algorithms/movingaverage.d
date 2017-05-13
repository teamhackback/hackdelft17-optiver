module stock.algorithms.naive;

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

    this(int np, int mp)
    {
        n = np;
        m = mp;
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
    auto ns = iota(3000, 50000, 1000);
    auto ms = iota(100, 2000, 100);

    foreach(n; ns)
    foreach(m; ms)
        app ~= NMTuple(n, m);

    alias NMResultTuple = Tuple!(int, "n", int, "m", DayBalances, "balances");
    NMResultTuple[] results;
    foreach(nm; app.data.parallel(3))
    {
        //writefln("starting n: %d, m: %d ", nm.n, nm.m);
        Trader trader = new MovingAverageTrader(nm.n, nm.m);
        auto result = runSimulationWithDays(trader, days);
        results ~= NMResultTuple(nm.n, nm.m, result);
    }
    results
        .sort!`a.balances.total > b.balances.total`[0..min(results.length, 50)]
        .each!(e => "%-10.2f(n:%-6d, m:%d)".writefln(e.balances.total, e.n, e.m));

    auto outFolder = buildPath("out", "movingaverage");
    outFolder.mkdirRecurse;
    auto outFile = File(buildPath(outFolder, "all.csv"), "w");
    outFile.writeln("n,m,date,balance");
    foreach (result; results)
    {
        foreach (balance; result.balances.values)
        {
            outFile.writefln("%d,%d,%s,%.2f", result.n, result.m, balance.date.toISOExtString, balance.balance);
        }
    }
}
