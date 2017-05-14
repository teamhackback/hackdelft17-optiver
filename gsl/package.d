/** GSL bindings for D.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl;
public import gsl.blas;
public import gsl.block;
public import gsl.bspline;
public import gsl.cblas;
public import gsl.cdf;
public import gsl.chebyshev;
public import gsl.check_range;
public import gsl.combination;
public import gsl.complex;
public import gsl.constants;
public import gsl.deriv;
public import gsl.dht;
public import gsl.diff;
public import gsl.eigen;
public import gsl.errno;
public import gsl.fft;
public import gsl.fit;
public import gsl.histogram;
public import gsl.integration;
public import gsl.interpolation;
public import gsl.linalg;
public import gsl.machine;
public import gsl.math;
public import gsl.matrix;
public import gsl.min;
public import gsl.minmax;
public import gsl.mode;
public import gsl.monte;
public import gsl.multifit;
public import gsl.multilarge;
public import gsl.multimin;
public import gsl.multiroots;
public import gsl.multiset;
public import gsl.nan;
public import gsl.ntuple;
public import gsl.odeiv2;
public import gsl.odeiv;
public import gsl.permutation;
public import gsl.poly;
public import gsl.pow_int;
public import gsl.precision;
public import gsl.qrng;
public import gsl.randist;
public import gsl.rng;
public import gsl.roots;
public import gsl.rstat;
public import gsl.siman;
public import gsl.sort;
public import gsl.spblas;
public import gsl.spmatrix;
public import gsl.statistics;
public import gsl.sum;
public import gsl.sys;
public import gsl.vector;
public import gsl.wavelet;


import std.math: pow, round;
T round_dp(T)(T x, int dp = 0){
    T factor = pow(10, dp + 1);
    x *= factor;
    x += 1.;
    x /= 10.;
    factor /= 10.;
    return round(x)/factor;
}


unittest
{
	import std.stdio : writefln;
	import gsl.randist : gsl_ran_gaussian_pdf;
	import gsl.cdf : gsl_cdf_gaussian_P;
	assert(round_dp(gsl_ran_gaussian_pdf (0 , 1.), 7) == 0.3989423);
	assert(gsl_cdf_gaussian_P (0 , 1.) == 0.5);
	assert(round_dp(gsl_cdf_gaussian_P (-1.96 , 1.), 7) == 0.0249979);
	assert(round_dp(gsl_cdf_gaussian_P (1.96, 1.), 7) == 0.9750021);
}

unittest
{
	////
	import std.stdio : writefln;
	import std.range : iota, array;
	import gsl.statistics : gsl_stats_mean, gsl_stats_variance, gsl_stats_sd, gsl_stats_absdev;
	double[10] some_numbers = iota(1., 11., 1.).array();
	assert(round_dp(gsl_ran_gaussian_pdf (0 , 1.), 7) == 0.3989423);
	assert(gsl_stats_mean(some_numbers.ptr, 1, some_numbers.length) == 5.5);
	assert(round_dp(gsl_stats_sd(some_numbers.ptr, 1, some_numbers.length), 7) == 3.0276504);
	assert(round_dp(gsl_stats_variance(some_numbers.ptr, 1, some_numbers.length), 7) == 9.1666667);
	assert(gsl_stats_absdev(some_numbers.ptr, 1, some_numbers.length) == 2.5);
}

/*
void main(){
	import std.range : iota, array;
    import std.stdio : writeln;

    double[] x;
    import gsl.randist : gsl_ran_gaussian_pdf;
    import gsl.cdf : gsl_cdf_gaussian_P;
    writeln("PDF, x = 0: ", gsl_ran_gaussian_pdf(0, 1));
    writeln("CDF, x = 0: ", gsl_cdf_gaussian_P (0, 1));
    writeln("CDF, x = -1.96: ", gsl_cdf_gaussian_P (-1.96, 1));
    writeln("CDF, x = 1.96: ", gsl_cdf_gaussian_P (1.96, 1));

    import gsl.statistics : gsl_stats_mean, gsl_stats_variance, gsl_stats_sd, gsl_stats_absdev;
    double[10] some_numbers = iota(1., 11., 1.).array();
    writeln("\n", gsl_stats_mean(some_numbers.ptr, 1, some_numbers.length));
    writeln(gsl_stats_sd(some_numbers.ptr, 1, some_numbers.length));
    writeln(gsl_stats_variance(some_numbers.ptr, 1, some_numbers.length));
    writeln(gsl_stats_absdev(some_numbers.ptr, 1, some_numbers.length));
}
*/