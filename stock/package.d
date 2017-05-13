module stock;

import std.algorithm;
import std.array;
import std.conv;
import std.datetime;
import std.file;
import std.math;
import std.range;
import std.stdio;
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
}

struct Price
{
    DateTime date;
    double price;
}

auto readDay(string stockFile)
{
    auto app = appender!(Price[])();
    app.reserve(40_000);
    foreach (line; File(stockFile).byLine.dropOne)
    {
        auto parts = line.splitter(",");
        auto p1 = parts.front.filter!(e => !e.among('-', ':')).map!(e => e != ' ' ? cast(char) e : 'T').array;
        Price price = {
            date: DateTime.fromISOString(p1),
            price: parts.dropOne.front.to!double
        };
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
        auto index = timeDiff.total!`seconds`;
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
