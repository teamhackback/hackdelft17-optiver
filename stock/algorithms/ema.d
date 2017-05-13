module stock.algorithms.naive;

import stock.framework;

import std.algorithm;
import std.datetime;
import std.math;
import std.random;
import std.path;
import std.stdio;

class EMATrader : Trader
{
    override void newPrice(Price price)
    {
        int EMA = 0;
        if (!tradingIsOpen) return;
        if (finalPriceIsNext)
        {
            makeOrder(price.date + 1.seconds, -currentStock);
            return;
        }
        enum stockTradingOptions = [-10, 10];
        if (currentStock.abs < 90 && EMA > 0)
        {
            makeOrder(price.date + 1.seconds, stockTradingOptions.choice);
        }
        else
        {
            makeOrder(price.date + 1.seconds, -currentStock);
        }
    }
}

version(EMATrader)
void main(string[] args)
{
    string stockFolder = buildPath("optiver", "data");
    auto days = stockFolder.readDays;

    Trader trader = new EMATrader();
    writefln("Final balance: %.2f", runSimulation(trader, days));
}
