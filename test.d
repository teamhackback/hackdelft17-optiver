#!/usr/bin/env rdmd

import std.datetime;
import std.stdio;
import stock;

void main(string[] args)
{
    string file = "./optiver/data";
    auto days = file.readDays;
    Order[] orders;
    writeln(days[0].prices[0..10]);

    // do some orders
    orders ~= Order(DateTime(2017, 03, 15, 9, 30, 0), 100);
    orders ~= Order(DateTime(2017, 03, 15, 9, 40, 0), -100);
    // calculate the result
    days.calculateDays(orders).writeln;
}
