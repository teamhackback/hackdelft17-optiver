module stock.algorithms.naive;

import stock.framework;

import std.algorithm;
import std.array;
import std.datetime;
import std.math;
import std.path;
import std.random;
import std.stdio;

class NaiveTrader : Trader
{
    double lastOrderPrice;
    int emptyRuns;
    bool calcBalance;
    int balanceCalcType;
    double balance;
    override void onNewDay(Date date)
    {
        balance = 0;
    }
    override void onNewPrice(Price price, Price[] history)
    {
        emptyRuns++;
        //if (calcBalance)
        //{
            //balance -= sgn(balanceCalcType) * price.price;
        //}
        if (price.date.second == 0 && price.date.minute % 5 == 0)
        {
            balance = 0;
        }
        // ignore the last two data points
        if (!tradingIsOpen || finalPriceIsNext) return;

        if (balance > 200)
            return;

        enum stockTradingOptions = [10, -10];
        if (currentStock.abs < 100)
        {
            emptyRuns = 0;
            lastOrderPrice = price.price;
            calcBalance = true;
            auto stocks = stockTradingOptions.choice;
            //auto stocks = 100;
            balanceCalcType = stocks;
            if (sgn(currentStock) * lastOrderPrice - price.price > 0 && emptyRuns < 100) return;
            return makeOrder(price.date + 1.seconds, stocks);
        }
        else
        {
            emptyRuns = 0;
            lastOrderPrice = price.price;
            calcBalance = true;
            balanceCalcType = -currentStock;
            if (sgn(currentStock) * lastOrderPrice - price.price > 0 && emptyRuns < 100) return;
            makeOrder(price.date + 1.seconds, -currentStock);
        }
    }

    override string name()
    {
        return "random";
    }
}

version(NaiveTrader)
void main(string[] args)
{
    Trader trader = new NaiveTrader();
    //writefln("Final balance: %.2f", runSimulation(trader, days));

    Appender!(Trader[]) app;
    foreach (_; 0 .. 50)
        app ~= new NaiveTrader();

    analyzeTraders(app.data, buildPath("out", "naive.csv"));

    runSimulation(trader, File(buildPath("out", "orders_naive.csv"), "w").lockingTextWriter).writeln;
}
