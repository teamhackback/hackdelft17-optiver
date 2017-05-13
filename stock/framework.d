module stock.framework;

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
import std.parallelism;

struct Order
{
    DateTime date;
    int amount;

    invariant
    {
        assert(-100 <= amount);
        assert(amount <= 100);
    }

    void write(Writer)(Writer w)
    {
        w.formattedWrite("%s,%d\n", date.toISOExtString.map!(e => e == 'T' ? ' ' : cast(char) e).array.to!string, amount);
    }
}

enum FirstTradingTime = TimeOfDay(9, 0, 0);
enum FinalTradingTime = TimeOfDay(17, 29, 59);

void dumpOrders(Writer)(Writer w, Order[] orders)
{
    orders.each!(order => order.write(w));
}

class Price
{
    DateTime date;
    double price;
    this(DateTime _date, double _price)
    {
        date = _date;
        price = _price;
    }

    override string toString()
    {
        return "Price(%s,%s)".format(date, price);
    }
}

auto readDay(string stockFile)
{
    auto app = appender!(Price[])();
    app.reserve(40_000);
    foreach (line; File(stockFile).byLine.dropOne)
    {
        auto parts = line.splitter(",");
        auto p1 = parts.front.filter!(e => !e.among('-', ':')).map!(e => e != ' ' ? cast(char) e : 'T').array;
        Price price = new Price(
            DateTime.fromISOString(p1),
            parts.dropOne.front.to!double
        );
        app.put(price);
    }
    return app.data;
}

struct Day
{
    Date date;
    Price[] prices;

    Price priceAt(DateTime suggestedDate)
    {
        auto timeDiff = suggestedDate.timeOfDay - TimeOfDay(9, 0, 0);
        auto index = timeDiff.total!`seconds`.to!size_t;
        //writefln("Index: %s", index);
        return prices[index];
    }
}

auto readDays(string stockFolder)
{
    Day[] days;
    foreach (file; stockFolder
                            .dirEntries(SpanMode.breadth)
                            .filter!(f => f.name.endsWith("_prices.csv"))
                            .parallel(1))
    {
        //"Reading %s".writefln(file.name);
        auto prices = file.name.readDay;
        assert(prices.length == 30600);
        Day d = {
            prices: prices,
            date: prices[0].date.date
        };
        synchronized {
            days ~= d;
        };
    }
    return days;
}

double calcTotalDay(O)(Day day, O orders)
if (is(ElementType!O == Order))
{
    int stock;
    double balance = 0;
    foreach (order; orders)
    {
        stock += order.amount;
        assert(stock >= -100 && stock <= 100, "Stock boundaries reached");
        balance += -sgn(order.amount) * day.priceAt(order.date).price;
    }
    assert(stock == 0, "Stock balance isn't zero at the end of the day");
    return balance;
}

double calcTotal(Day[] days, Order[] orders)
{
    return days
            .map!(day => calcTotalDay(day,
                            orders.filter!(order => order.date.date == day.date))
            )
            .sum;
}



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
