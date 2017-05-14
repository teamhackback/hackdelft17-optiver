module stock.algorithms.movingaverage;

import stock.framework;

import std.array;
import std.algorithm;
import std.datetime;
import std.math;
import std.path;
import std.random;
import std.stdio;
import std.format;
import std.file;
import dstats;
import std.container.dlist;

struct CircularAverage
{
    DList!double dlist;
    size_t length;
    size_t maxElements;

    double mean()
    {
        return dlist[].mean;
    }

    void put(double v)
    {
        dlist.insertFront(v);
        if (length >= maxElements)
            dlist.removeBack;
        else
            length++;
    }
}

class MovingAverageTrader : Trader
{
    CircularAverage longWindow;
    CircularAverage shortWindow;

    this(int _n, int _m)
    {
        longWindow.maxElements = _n;
        shortWindow.maxElements = _m;
    }

    override void onNewPrice(Price price)
    {
        if (!tradingIsOpen || finalPriceIsNext) return;

        longWindow.put(price.price);
        shortWindow.put(price.price);

        double bt = shortWindow.mean() - longWindow.mean();

        if (bt >= 0)
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

    override string name()
    {
        return "n:%d-m:%d".format(longWindow.maxElements, shortWindow.maxElements);
    }
}

version(MovingAverageTrader)
void main(string[] args)
{
    import std.typecons;
    import std.array;
    import std.parallelism;
    import std.range;
    auto ns = iota(100, 2000, 100);
    auto ms = iota(1, 100, 10);

    Appender!(Trader[]) app;

    //foreach(n; ns)
    //foreach(m; ms)
    app ~= new MovingAverageTrader(1000, 10);

    app.data.analyzeTraders(buildPath("out", "movingaverage", "all.csv"));
}
