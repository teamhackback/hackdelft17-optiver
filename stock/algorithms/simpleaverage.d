module stock.algorithms.simpleaverage;

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

class SimpleAverageTrader : Trader
{
    CircularAverage window;
    double shoppingPrice;

    this()
    {
        window.maxElements = 100;
    }

    override void onNewPrice(Price price)
    {
        if (!tradingIsOpen || finalPriceIsNext) return;

        window.put(price.price);
        double m = window.mean;
        if (currentStock == 0 && m > 10)
        {
            makeOrder(price.date + 1.seconds, 100);
            shoppingPrice = price.price;
        }
        if (currentStock == 100 && price.price / shoppingPrice < 0.9)
        {
            makeOrder(price.date + 1.seconds, -100);
        }
    }

    override string name()
    {
        //return "n:%d-m:%d".format(n, m);
        return "simpleaverage";
    }
}

version(SimpleAverageTrader)
void main(string[] args)
{
    import std.typecons;
    import std.array;
    import std.parallelism;
    import std.range;
    auto ns = iota(3000, 50000, 1000);
    auto ms = iota(100, 2000, 100);

    Appender!(Trader[]) app;

    //foreach(n; ns)
    //foreach(m; ms)
        //app ~= new SimpleAverageTrader(n, m);
    app ~= new SimpleAverageTrader();

    app.data.analyzeTraders(buildPath("out", "movingaverage", "all.csv"));
}
