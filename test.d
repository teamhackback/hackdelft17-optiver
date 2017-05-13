#!/usr/bin/env rdmd

import std.datetime;
import std.stdio;
import stock;

void main(string[] args)
{
    string stockFolder= "./optiver/data";
    auto days = stockFolder.readDays;
    writeln(days[0].prices[0..10]);

    // do some orders
    auto orders = naive(days);
    // calculate the result
    calcTotal(days, orders).writeln;
}

Order[] naive(Day[] days)
{
    Order[] orders;
    orders ~= Order(DateTime(2017, 03, 15, 9, 30, 0), 100);
    orders ~= Order(DateTime(2017, 03, 15, 9, 40, 0), -100);
    return orders;
}
