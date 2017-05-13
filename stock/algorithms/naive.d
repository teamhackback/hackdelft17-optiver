module stock.algorithms.naive;

import stock.framework;

import std.algorithm;
import std.datetime;
import std.math;
import std.path;
import std.random;
import std.stdio;

class NaiveTrader : Trader
{
    override void onNewPrice(Price price)
    {
        // ignore the last two data points
        if (!tradingIsOpen || finalPriceIsNext) return;
        enum stockTradingOptions = [-10, 10];
        if (currentStock.abs < 90)
        {
            makeOrder(price.date + 1.seconds, stockTradingOptions.choice);
        }
        else
        {
            makeOrder(price.date + 1.seconds, -currentStock);
        }
    }
}

version(NaiveTrader)
void main(string[] args)
{
    string stockFolder = buildPath("optiver", "data");
    auto days = stockFolder.readDays;

    Trader trader = new NaiveTrader();
    //writefln("Final balance: %.2f", runSimulation(trader, days));

    runSimulation(trader, days, File(buildPath("out", "orders_naive.csv"), "w").lockingTextWriter);
}
