/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.fit;
import gsl.math;

extern (C):

int gsl_fit_linear (const(double)* x, const size_t xstride, const(double)* y, const size_t ystride, const size_t n, double* c0, double* c1, double* cov00, double* cov01, double* cov11, double* sumsq);
int gsl_fit_wlinear (const(double)* x, const size_t xstride, const(double)* w, const size_t wstride, const(double)* y, const size_t ystride, const size_t n, double* c0, double* c1, double* cov00, double* cov01, double* cov11, double* chisq);
int gsl_fit_linear_est (const double x, const double c0, const double c1, const double cov00, const double cov01, const double cov11, double* y, double* y_err);
int gsl_fit_mul (const(double)* x, const size_t xstride, const(double)* y, const size_t ystride, const size_t n, double* c1, double* cov11, double* sumsq);
int gsl_fit_wmul (const(double)* x, const size_t xstride, const(double)* w, const size_t wstride, const(double)* y, const size_t ystride, const size_t n, double* c1, double* cov11, double* sumsq);
int gsl_fit_mul_est (const double x, const double c1, const double cov11, double* y, double* y_err);