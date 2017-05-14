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

class BreakoutTrader : Trader
{
    int n, m;

    double b_t;

    double previousPrice;

    double maxPrice = 0;
    double minPrice = 0;
    double pivotPoint = 0;
    double resistance = 0;
    double support = 0;

    this(int _n, int _m)
    {
        n = _n;
        m = _m;
    }

    override void onNewPrice(Price price, Price[] history)
    {
        if (!tradingIsOpen || finalPriceIsNext) return;

        if (price.price > maxPrice)
          {
            maxPrice = price.price;
          }

        if (price.price < minPrice)
          {
            minPrice = price.price;
          }

        pivotPoint = (price.price + minPrice + maxPrice) / 3;

        resistance = (pivotPoint + (pivotPoint - minPrice));
        support = (pivotPoint + (maxPrice - pivotPoint));

        /*auto avgN = history[history.length < 1 ? 0 : $ -1 .. $];
        auto arrN = history.map!"a.price";
        double sumN = arrN.sum / arrN.length;

        auto avgM = history[history.length < 10? 0 : $ -10 .. $];
        auto arrM = history.map!"a.price";
        double sumM = arrM.sum / arrM.length;

        b_t = sumM*100 - sumN*100;*/

        // ignore the last two data points
        if (!tradingIsOpen || finalPriceIsNext) return;
        if (currentStock.abs < 90 && price.price >= support)
        {
            if (price.price > previousPrice)
            {
              makeOrder(price.date + 1.seconds, 1);
            }
        }
        else
        {
          if (currentStock.abs < 90 && price.price <= resistance)
            makeOrder(price.date + 1.seconds, -10);
        }

        previousPrice = price.price;

        /*if (b_t >= 0)
        {
            //writefln("buying signal");
            if (currentStock.abs < 90)
            && price.price >= support)
                makeOrder(price.date + 1.seconds, 10);
        }
        else
        {
            //writefln("selling signal");
            if (currentStock.abs < 90)
            && price.price <= resistance)
                makeOrder(price.date + 1.seconds, -10);
        }*/
    }

    override string name()
    {
        return "n:%d-m:%d".format(n, m);
    }
}

version(BreakoutTrader)
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
        app ~= new BreakoutTrader(n, m);

    app.data.analyzeTraders(buildPath("out", "breakout", "all.csv"));
}
