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

    double slope, oldSlope, oldPrice;

    override void onNewPrice(Price price, Price[] history)
    {
        if (!tradingIsOpen || finalPriceIsNext) return;

        slope = 1/(tan(price.price-oldPrice));

        if (currentStock.abs < 90 && slope > 45 && slope > oldSlope)
        {
            makeOrder(price.date + 1.seconds, +1);
        }

        if (currentStock.abs < 90 && slope < 45 && slope < oldSlope)
        {
            makeOrder(price.date + 1.seconds, -1);
        }

        oldSlope = slope;
        oldPrice = price.price;
    }
}

version(DesperateTrader)
void main(string[] args)
{
    Appender!(Trader[]) app;

    runSimulation(new DesperateTrader(), File(buildPath("out", "orders_desperate.csv"), "w").lockingTextWriter).writeln;
}
