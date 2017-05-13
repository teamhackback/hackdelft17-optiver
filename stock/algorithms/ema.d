module stock.algorithms.naive;

import stock.framework;

import std.algorithm;
import std.datetime;
import std.math;
import std.random;
import std.path;
import std.stdio;

double ema = 0;
int runs = 1;
double totalPrice = 0;
double interest = 0;

class EMATrader : Trader
{
    override void newPrice(Price price)
    {
        if (!tradingIsOpen) return;
        if (finalPriceIsNext)
        {
            makeOrder(price.date + 1.seconds, -currentStock);
            return;
        }

        ema = price.price - totalPrice/runs;
        runs++;
        totalPrice = totalPrice + price.price;
        //writeln(ema);

        enum stockTradingOptions = 10;
        if (currentStock.abs < 90)
        {
            if (ema > 0)
            {
              makeOrder(price.date + 1.seconds, stockTradingOptions);
              writeln("buy");
              interest = interest + price.price/1000;
            }
            else
            {
              if (currentStock.abs > -90)
              makeOrder(price.date + 1.seconds, -stockTradingOptions);
              writeln("sell");
              interest = interest - price.price/1000;
            }
        }
        else
        {
            makeOrder(price.date + 1.seconds, -currentStock);
            writeln("sellall");
            interest = interest - price.price/100;
        }
        writeln(interest);
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
