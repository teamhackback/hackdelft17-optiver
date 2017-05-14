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
import dstats.regress;
import std.container.dlist;
import std.range;

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
        dlist.insertBack(v);
        if (length >= maxElements)
            dlist.removeFront;
        else
            length++;
    }
}

import gsl.fit;
pragma(lib, "gsl");

class SimpleAverageTrader : Trader
{
    CircularAverage windowLarge;
    CircularAverage windowSmall;
    CircularAverage windowTiny;
    double shoppingPrice;
    double buyRatio;
    double sellRatio;
    int noTrade;

    this(int max = 10, int small = 10, int tiny = 1, double _buyRatio = 1.001, double _sellRatio = 1.001)
    {
        windowLarge.maxElements = max;
        windowSmall.maxElements = small;
        windowTiny.maxElements = tiny;
        buyRatio = _buyRatio;
        sellRatio = _sellRatio;
    }

    override void onNewPrice(Price price)
    {
        if (!tradingIsOpen || finalPriceIsNext) return;
        windowLarge.put(price.price);
        if (windowLarge.length < windowLarge.maxElements) return;
        //windowSmall.put(price.price);
        //windowTiny.put(price.price);
        //auto x = repeat(1);
        auto x = iota(0, windowLarge.maxElements, 1.0).array;
        auto y = windowLarge.dlist[].array;

        double c0, c1, cov00, cov01, cov11, sumsq;
        gsl_fit_linear (x.ptr, 1, y.ptr, 1, windowLarge.maxElements,  &c0, &c1, &cov00, &cov01, &cov11, &sumsq);
        if (currentStock == 0 && c1 > 0.1)
        {
            shoppingPrice = price.price;
            noTrade = 0;
            return makeOrder(price.date + 1.seconds, 100);
        }
        if (currentStock == 100)
        {
            //writeln(price.price / shoppingPrice);
            if (price.price / shoppingPrice > sellRatio)
            {
                return makeOrder(price.date + 1.seconds, -100);
            }
        }
        noTrade++;
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
    Appender!(Trader[]) app;

    //app ~= new SimpleAverageTrader(600, 20, 2, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(6000, 20, 2, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(3000, 20, 2, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(600, 200, 2, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(600, 100, 10, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(600, 20, 2, 1.0001, 0.9999);
    //app ~= new SimpleAverageTrader(600, 20, 2, 1.001, 0.99999);

    runSimulation(new SimpleAverageTrader(), File(buildPath("out", "orders_simpleaverage.csv"), "w").lockingTextWriter).writeln;
    //app.data.analyzeTraders(buildPath("out", "simpleaverage.csv"));
}
