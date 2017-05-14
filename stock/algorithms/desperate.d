module stock.algorithms.naive;

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
import dstats.regress;
import std.container.dlist;
import std.range;

class DesperateTrader : Trader
{
    int n, m;

    double slope, oldSlope, oldPrice;

    this(int _n, int _m)
    {
        n = _n;
        m = _m;
    }

    override void onNewPrice(Price price, Price[] history)
    {
        if (!tradingIsOpen || finalPriceIsNext) return;
        {
            slope = 1/(tan(price.price-oldPrice));
            if (currentStock.abs < 90 && (slope / oldSlope)*100 > n)
            {
                makeOrder(price.date + 1.seconds, +10);
            }
            if (currentStock.abs < 90 && (slope / oldSlope)*100 < m)
            {
                makeOrder(price.date + 1.seconds, -10);
            }
            oldSlope = slope;
            oldPrice = price.price;
        }
    }
    override string name()
    {
        return "n:%d-m:%d".format(n, m);
    }
}

version(DesperateTrader)
void main(string[] args)
{
    import std.typecons;
    import std.array;
    import std.parallelism;
    import std.range;
    auto ns = iota(100, 150, 5);
    auto ms = iota(50, 100, 5);

    Appender!(Trader[]) app;

    foreach(n; ns)
    foreach(m; ms)
      app ~= new DesperateTrader(140, 90);

    app.data.analyzeTraders(buildPath("out", "breakout", "all.csv"));

    /*runSimulation(new DesperateTrader(), File(buildPath("out", "orders_desperate.csv"), "w").lockingTextWriter).writeln;*/
}
