/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.min;
//import core.stdc.math;
import core.stdc.config : c_ulong;
import gsl.linalg;
import gsl.math;

extern (C):

alias int function (gsl_function_struct*, double*, double*, double*, double*, double*, double*, c_ulong) gsl_min_bracketing_function;

extern __gshared const(gsl_min_fminimizer_type)* gsl_min_fminimizer_goldensection;
extern __gshared const(gsl_min_fminimizer_type)* gsl_min_fminimizer_brent;
extern __gshared const(gsl_min_fminimizer_type)* gsl_min_fminimizer_quad_golden;

struct gsl_min_fminimizer_type
{
    const(char)* name;
    size_t size;
    int function (void*, gsl_function*, double, double, double, double, double, double) set;
    int function (void*, gsl_function*, double*, double*, double*, double*, double*, double*) iterate;
}

struct gsl_min_fminimizer
{
    const(gsl_min_fminimizer_type)* type;
    gsl_function* function_;
    double x_minimum;
    double x_lower;
    double x_upper;
    double f_minimum;
    double f_lower;
    double f_upper;
    void* state;
}

gsl_min_fminimizer* gsl_min_fminimizer_alloc (const(gsl_min_fminimizer_type)* T);
void gsl_min_fminimizer_free (gsl_min_fminimizer* s);
int gsl_min_fminimizer_set (gsl_min_fminimizer* s, gsl_function* f, double x_minimum, double x_lower, double x_upper);
int gsl_min_fminimizer_set_with_values (gsl_min_fminimizer* s, gsl_function* f, double x_minimum, double f_minimum, double x_lower, double f_lower, double x_upper, double f_upper);
int gsl_min_fminimizer_iterate (gsl_min_fminimizer* s);
const(char)* gsl_min_fminimizer_name (const(gsl_min_fminimizer)* s);
double gsl_min_fminimizer_x_minimum (const(gsl_min_fminimizer)* s);
double gsl_min_fminimizer_x_lower (const(gsl_min_fminimizer)* s);
double gsl_min_fminimizer_x_upper (const(gsl_min_fminimizer)* s);
double gsl_min_fminimizer_f_minimum (const(gsl_min_fminimizer)* s);
double gsl_min_fminimizer_f_lower (const(gsl_min_fminimizer)* s);
double gsl_min_fminimizer_f_upper (const(gsl_min_fminimizer)* s);
double gsl_min_fminimizer_minimum (const(gsl_min_fminimizer)* s);
int gsl_min_test_interval (double x_lower, double x_upper, double epsabs, double epsrel);
int gsl_min_find_bracket (gsl_function* f, double* x_minimum, double* f_minimum, double* x_lower, double* f_lower, double* x_upper, double* f_upper, size_t eval_max);