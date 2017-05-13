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
import std.ascii;

import stock.framework;

class Trader
{
    private Appender!(Order[]) _orders;
    public Price lastPrice;
    public int currentStock;

    // internal method to do some house-keeping
    void _onNewPrice(Price price)
    {
        lastPrice = price;
        onNewPrice(price);
    }

    // called with every data point
    abstract void onNewPrice(Price price);

    void onNewDay(Date day) {}

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
    return runSimulation!bool(trader, days, false);
}

double runSimulation(W)(Trader trader, Day[] days, W w)
{
    double currentBalance = 0;
    trader.currentStock = 0;
    static if (!is(W == bool))
    {
        w.put("times,trades");
        w.put(newline);
    }
    foreach (day; days)
    {
        trader.onNewDay(day.date);

        // simulate all data points
        day.prices.each!(p => trader._onNewPrice(p));
        assert(trader.currentStock == 0, "Stock balance isn't zero at the end of the day");
        currentBalance += calcTotalDay(day, trader.orders);

        static if (!is(W == bool))
            trader.orders.each!(order => order.write(w));

        trader._orders.clear();
    }
    return currentBalance;
}
