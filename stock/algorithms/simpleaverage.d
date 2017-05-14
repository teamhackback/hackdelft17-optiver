module stock.algorithms.simpleaverage;

import stock.framework;

import std.array;
import std.algorithm;
import std.datetime;
import std.math;
import std.path;
import std.random;
import std.range;
import std.stdio;
import std.format;
import std.file;
//import dstats;
//import dstats.regress;
import std.container.dlist;
import std.range;
import gsl.fit;
pragma(lib, "gsl");

class SimpleAverageTrader : Trader
{
    int windowLarge;
    int windowSmall;
    int windowTiny;
    double shoppingPrice;
    double buyRatio;
    double sellRatio;
    int noTrade;
    File out_;

    double previousC = 0;

    this()
    {
        out_ = File("out/simple_regression.csv", "w");
        out_.writeln("date,price,betaMax,betaSmall");
    }

    bool hasOrder;

    enum State {
        unknown, down, up
    }
    State state;

    this(int max = 1000, int small = 30, int tiny = 1, double _buyRatio = 1.001, double _sellRatio = 1.005)
    {
        windowLarge = max;
        windowSmall = small;
        windowTiny = tiny;
        buyRatio = _buyRatio;
        sellRatio = _sellRatio;
    }

    override void onNewPrice(Price price, Price[] history)
    {
        if (hasOrder)
        {
            shoppingPrice = price.price;
            hasOrder = false;
        }
        enum chunkSize = 2;
        if (!tradingIsOpen || finalPriceIsNext) return;
        if (history.length < windowLarge * chunkSize) return;

        //if (price.date.second % chunkSize != 0) return;
        //auto y = history.retro.map!`a.price`.chunks(chunkSize).map!((a){
            //return a.sum / 1.0 / a.length;
        //}).take(windowLarge).retro.array;
        auto y = history.retro.take(1000).map!`a.price`.retro.array;
        auto x = iota(0, y.length, 1.0).array;
        double c0, c1, cov00, cov01, cov11, sumsq;
        gsl_fit_linear(x.ptr, 1, y.ptr, 1, y.length,  &c0, &c1, &cov00, &cov01, &cov11, &sumsq);
        double c1Max = c1;
        out_.writefln("%s,%.2f,%.6f, %.6f", price.date.toISOExtString, price.price, c1Max, c1Max);

        // downward
        if (previousC - c1 > 0)
        {
            hasOrder = true;
            if (currentStock == 100)
                if (shoppingPrice > price.price)
                    return makeOrder(price.date + 1.seconds, -100);
            else if (currentStock == 0)
                if (shoppingPrice < price.price)
                return makeOrder(price.date + 1.seconds, 100);
            //else if (currentStock == -100)
                    //return makeOrder(price.date + 1.seconds, 100);
        }
        // upward
        else if (previousC - c1 < 0)
        {
            //if (currentStock == 100)
                //return makeOrder(price.date + 1.seconds, -100);
            //if (currentStock == 0)
                //return makeOrder(price.date + 1.seconds, 100);
            //else if (currentStock == -100)
                //return makeOrder(price.date + 1.seconds, 100);
        }


        //if (currentStock == 0)
        //{
            //final switch (state)
            //{
                //case State.down:
                    //if (c1 > 0)
                    //{
                        //state = State.up;
                    //}
                    //break;
                //case State.up:
                    //if (c1 < 0)
                    //{
                        //state = State.down;
                        //hasOrder = true;
                        //return makeOrder(price.date + 1.seconds, -100);
                    //}
                    //break;
                //case State.unknown:
                    //state = c1 < 0 ? State.down : State.up;
                    //break;
            //}
        //} else {
            //final switch (state)
            //{
                //case State.down:
                    //if (price.price / shoppingPrice > sellRatio)
                    //{
                        //hasOrder = true;
                    //}
                    //break;
                //case State.up:
                    //if (shoppingPrice / price.price > sellRatio)
                    //{
                        //hasOrder = true;
                    //}
                    //break;
                //case State.unknown:
                    //break;
            //}
        //}

        //if (currentStock == 0 && c1 < -0.3)
        //{
            //shoppingPrice = price.price;
            //noTrade = 0;
            //writeln(c1, " ", price.date, " ", price.price);
            ////return makeOrder(price.date + 1.seconds, 100);
        //}
        //if (currentStock == 100)
        //{

            ////writeln(price.price / shoppingPrice);
            ////if (c1 < 0 && noTrade > 100)
            //if (price.price / shoppingPrice > 1.03 || c1 > 0.05)
            //{
                //noTrade = 0;
                //return makeOrder(price.date + 1.seconds, -100);
            //}
        //}
    }

    override string name()
    {
        //return "n:%d-m:%d".format(n, m);
        return "simpleaverage";
    }
}

version(SimpleAverageTrader)
void main(string[] args)
{
    Appender!(Trader[]) app;

    //app ~= new SimpleAverageTrader(600, 20, 2, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(6000, 20, 2, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(3000, 20, 2, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(600, 200, 2, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(600, 100, 10, 1.001, 0.9999);
    //app ~= new SimpleAverageTrader(600, 20, 2, 1.0001, 0.9999);
    //app ~= new SimpleAverageTrader(600, 20, 2, 1.001, 0.99999);

    runSimulation(new SimpleAverageTrader(), File(buildPath("out", "orders_simpleaverage.csv"), "w").lockingTextWriter).writeln;
    //app.data.analyzeTraders(buildPath("out", "simpleaverage.csv"));
}
