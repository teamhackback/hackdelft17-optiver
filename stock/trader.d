module stock.trader;

import std.algorithm;
import std.array;
import std.conv;
import std.datetime;
import std.file;
import std.format;
import std.math;
import std.range;
import std.stdio;
import std.string;

import stock.framework;

class Trader
{
    private Appender!(Order[]) _orders;
    public Price lastPrice;
    public int currentStock;

    // internal method to do some house-keeping
    void _newPrice(Price price)
    {
        lastPrice = price;
        newPrice(price);
    }

    // called with every data point
    abstract void newPrice(Price price);

    void makeOrder(DateTime date, int stock)
    in
    {
        scope(failure)
        {
            writefln("date: %s, stock: %d", date, stock);
        }
        assert(-100 <= stock && stock <= 100, "Out of stock boundaries");
        assert(lastPrice.date < date, "Don't make an order for the past");
        assert(FirstTradingTime <= date.timeOfDay && date.timeOfDay <= FinalTradingTime, "Make an order within a valid interval");
    }
    body
    {
        currentStock += stock;
        assert(-100 <= currentStock && currentStock <= 100, "Out of stock boundaries");
        _orders ~= Order(date, stock);
    }

    Order[] orders()
    {
        return _orders.data;
    }

    // with the report of the last price of the day, no trading is possible anymore
    // hence all final orders should be done at 17:29:59
    bool finalPriceIsNext()
    {
        enum oneSecondBeforeFinal = FinalTradingTime - 1.seconds;
        return lastPrice.date.timeOfDay == oneSecondBeforeFinal;
    }

    bool tradingIsOpen()
    {
        return lastPrice.date.timeOfDay < FinalTradingTime;
    }
}

double runSimulation(Trader trader, Day[] days)
{
    double currentBalance = 0;
    trader.currentStock = 0;
    foreach (day; days)
    {
        // simulate all data points
        day.prices.each!(p => trader._newPrice(p));
        assert(trader.currentStock == 0, "Stock balance isn't zero at the end of the day");
        currentBalance += calcTotalDay(day, trader.orders);
        trader._orders.clear();
    }
    return currentBalance;
}
