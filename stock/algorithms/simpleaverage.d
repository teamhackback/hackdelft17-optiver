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
    CircularAverage windowLarge;
    CircularAverage windowSmall;
    CircularAverage windowTiny;
    double shoppingPrice;
    double buyRatio;
    double sellRatio;

    this(int max = 300, int small = 20, int tiny = 2, double _buyRatio = 1.001, double _sellRatio = 0.9999)
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
        windowSmall.put(price.price);
        windowTiny.put(price.price);
        if (currentStock == 0 && windowSmall.mean / windowLarge.mean > buyRatio)
        {
            makeOrder(price.date + 1.seconds, 100);
            shoppingPrice = price.price;
        }
        if (currentStock == 100 && windowTiny.mean / windowSmall.mean < sellRatio)
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
    Appender!(Trader[]) app;

    app ~= new SimpleAverageTrader(600, 20, 2, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(6000, 20, 2, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(3000, 20, 2, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(600, 200, 2, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(600, 100, 10, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(600, 20, 2, 1.0001, 0.9999);
    //app ~= new SimpleAverageTrader(600, 20, 2, 1.001, 0.99999);

    runSimulation(new SimpleAverageTrader(), File(buildPath("out", "orders_simpleaverage.csv"), "w").lockingTextWriter).writeln;
    //app.data.analyzeTraders(buildPath("out", "simpleaverage.csv"));
}
