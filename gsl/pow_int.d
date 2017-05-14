/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.pow_int;

extern (C):

double gsl_pow_2(const(double) x);
double gsl_pow_3(const(double) x);
double gsl_pow_4(const(double) x);
double gsl_pow_5(const(double) x);
double gsl_pow_6(const(double) x);
double gsl_pow_7(const(double) x);
double gsl_pow_8(const(double) x);
double gsl_pow_9(const(double) x);

double gsl_pow_int(double x, int n);
double gsl_pow_uint(double x, uint n);

