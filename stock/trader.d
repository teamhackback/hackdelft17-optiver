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
import std.path;

import stock.framework;

class Trader
{
    private Appender!(Order[]) _orders;
    public Price lastPrice;
    public int currentStock;

    // internal method to do some house-keeping
    void _onNewPrice(Price price, Price[] history)
    {
        lastPrice = price;
        // sell/buy everything if there's something remaining at the end of the day
        if (finalPriceIsNext)
            makeOrder(price.date + 1.seconds, -currentStock);
        onNewPrice(price, history);
    }

    // called with every data point
    abstract void onNewPrice(Price price, Price[] history);

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

    // TODO: should this be abstract?
    string name()
    {
        return "not-defined";
    }
}

auto getDays()
{
    string stockFolder = buildPath("optiver", "data");
    auto days = stockFolder.readDays;
    return days;
}

double runSimulation(Trader trader)
{
    return runSimulation(trader, getDays);
}

double runSimulation(Trader trader, Day[] days)
{
    return runSimulation!bool(trader, days, false);
}

double runSimulation(W)(Trader trader, W w)
{
    return runSimulation(trader, getDays, w);
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
        foreach (i, price; day.prices)
            trader._onNewPrice(price, day.prices[0..i]);
        assert(trader.currentStock == 0, "Stock balance isn't zero at the end of the day");
        currentBalance += calcTotalDay(day, trader.orders);

        static if (!is(W == bool))
            trader.orders.each!(order => order.write(w));

        trader._orders.clear();
    }
    return currentBalance;
}

struct DayBalanceEntry
{
    Date date;
    double balance;
}

struct DayBalances
{
    DayBalanceEntry[] values;
    double total;
}

auto runSimulationWithDays(Trader trader)
{
    runSimulationWithDays(trader, getDays);
}

auto runSimulationWithDays(Trader trader, Day[] days)
{
    trader.currentStock = 0;
    DayBalanceEntry[] balances;
    foreach (day; days)
    {
        trader.onNewDay(day.date);

        // simulate all data points
        foreach (i, price; day.prices)
            trader._onNewPrice(price, day.prices[0..i]);

        assert(trader.currentStock == 0, "Stock balance isn't zero at the end of the day");
        balances ~= DayBalanceEntry(day.date, calcTotalDay(day, trader.orders));

        trader._orders.clear();
    }
    return DayBalances(balances, balances.map!`a.balance`.sum);
}

import progress.bar;

void analyzeTraders(Trader[] traders, string csvOut)
{
    auto days = getDays;

    import std.typecons;
    import std.parallelism;

    alias NMResultTuple = Tuple!(Trader, "trader", DayBalances, "balances");
    NMResultTuple[] results;

    Bar b = new Bar();
    b.message = {return "Analyzing Traders";};
    b.max = traders.length;
    foreach(trader; traders.parallel(1))
    {
        //writefln("starting n: %d, m: %d ", nm.n, nm.m);
        auto result = runSimulationWithDays(trader, days);
        synchronized {
            results ~= NMResultTuple(trader, result);
            b.next();
        }
    }
    b.finish();

    // dump top50 to CLI
    results
        .sort!`a.balances.total > b.balances.total`[0..min(results.length, 50)]
        .each!(e => "%-10.2f (%s)".writefln(e.balances.total, e.trader.name));

    csvOut.dirName.mkdirRecurse;
    auto outFile = File(csvOut, "w");
    outFile.writeln("algorithm,date,balance,total");
    foreach (result; results)
    {
        foreach (balance; result.balances.values)
        {
            outFile.writefln("%s,%s,%.2f,%.2f", result.trader.name, balance.date.toISOExtString, balance.balance,result.balances.total);
        }
    }
}
