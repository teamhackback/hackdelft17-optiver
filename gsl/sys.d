/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.sys;

extern (C):

double gsl_log1p (const double x);
double gsl_expm1 (const double x);
double gsl_hypot (const double x, const double y);
double gsl_hypot3 (const double x, const double y, const double z);
double gsl_acosh (const double x);
double gsl_asinh (const double x);
double gsl_atanh (const double x);
int gsl_isnan (const double x);
int gsl_isinf (const double x);
int gsl_finite (const double x);
double gsl_nan ();
double gsl_posinf ();
double gsl_neginf ();
double gsl_fdiv (const double x, const double y);
double gsl_coerce_double (const double x);
float gsl_coerce_float (const float x);
real gsl_coerce_long_double (const real x);
double gsl_ldexp (const double x, const int e);
double gsl_frexp (const double x, int* e);
int gsl_fcmp (const double x1, const double x2, const double epsilon);