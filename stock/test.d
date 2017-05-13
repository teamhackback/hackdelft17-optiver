#!/usr/bin/env rdmd

module stock.test;

import std.datetime;
import std.stdio;
import std.algorithm;

import std.path : buildPath;
import std.datetime : DateTime;

import stock.framework;

void main(string[] args)
{
    string stockFolder= buildPath("optiver", "data");
    auto days = stockFolder.readDays;
    //writeln(days[0].prices[0..10]);

    import stock.algorithms.naive;
    Trader trader = new NaiveTrader();
    auto balance = runSimulation(trader, days);
    writefln("Final balance: %.2f", balance);
}

void testNaive(Day[] days)
{
    // do some orders
    auto orders = naive(days);

    // calculate the result
    calcTotal(days, orders).writeln;

    // output
    stdout.lockingTextWriter.dumpOrders(orders);
}

Order[] naive(Day[] days)
{
    Order[] orders;
    orders ~= Order(DateTime(2017, 03, 15, 9, 30, 0), 100);
    orders ~= Order(DateTime(2017, 03, 15, 9, 40, 0), -100);
    return orders;
}
