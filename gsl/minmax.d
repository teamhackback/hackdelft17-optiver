/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.minmax;

T GSL_MAX(T)(T a, T b){
  return a > b ? a : b;
}

T GSL_MIN(T)(T a, T b){
  return a < b ? a : b;
}

/* Define MAX and MIN macros/functions if they don't exist. */

extern (C):

/* function versions of the above, in case they are needed */
double gsl_max (double a, double b);
double gsl_min (double a, double b);

/* inline-friendly strongly typed versions */

/*
int function(int a, int b) GSL_MAX_INT;
int function(int a, int b) GSL_MIN_INT;
double function(double a, double b) GSL_MAX_DBL;
double function(double a, double b) GSL_MIN_DBL;
real function(real a, real b) GSL_MAX_LDBL;
real function(real a, real b) GSL_MIN_LDBL;
*/