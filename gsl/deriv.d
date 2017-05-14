/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.deriv;
import gsl.math;

extern (C):

int gsl_deriv_central (const(gsl_function)* f, double x, double h, double* result, double* abserr);
int gsl_deriv_backward (const(gsl_function)* f, double x, double h, double* result, double* abserr);
int gsl_deriv_forward (const(gsl_function)* f, double x, double h, double* result, double* abserr);
