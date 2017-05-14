/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.roots;

//import core.stdc.math;
import gsl.math;

extern (C):

extern __gshared const(gsl_root_fsolver_type)* gsl_root_fsolver_bisection;
extern __gshared const(gsl_root_fsolver_type)* gsl_root_fsolver_brent;
extern __gshared const(gsl_root_fsolver_type)* gsl_root_fsolver_falsepos;
extern __gshared const(gsl_root_fdfsolver_type)* gsl_root_fdfsolver_newton;
extern __gshared const(gsl_root_fdfsolver_type)* gsl_root_fdfsolver_secant;
extern __gshared const(gsl_root_fdfsolver_type)* gsl_root_fdfsolver_steffenson;

struct gsl_root_fsolver_type
{
    const(char)* name;
    size_t size;
    int function (void*, gsl_function*, double*, double, double) set;
    int function (void*, gsl_function*, double*, double*, double*) iterate;
}

struct gsl_root_fsolver
{
    const(gsl_root_fsolver_type)* type;
    gsl_function* function_;
    double root;
    double x_lower;
    double x_upper;
    void* state;
}

struct gsl_root_fdfsolver_type
{
    const(char)* name;
    size_t size;
    int function (void*, gsl_function_fdf*, double*) set;
    int function (void*, gsl_function_fdf*, double*) iterate;
}

struct gsl_root_fdfsolver
{
    const(gsl_root_fdfsolver_type)* type;
    gsl_function_fdf* fdf;
    double root;
    void* state;
}

gsl_root_fsolver* gsl_root_fsolver_alloc (const(gsl_root_fsolver_type)* T);
void gsl_root_fsolver_free (gsl_root_fsolver* s);
int gsl_root_fsolver_set (gsl_root_fsolver* s, gsl_function* f, double x_lower, double x_upper);
int gsl_root_fsolver_iterate (gsl_root_fsolver* s);
const(char)* gsl_root_fsolver_name (const(gsl_root_fsolver)* s);
double gsl_root_fsolver_root (const(gsl_root_fsolver)* s);
double gsl_root_fsolver_x_lower (const(gsl_root_fsolver)* s);
double gsl_root_fsolver_x_upper (const(gsl_root_fsolver)* s);
gsl_root_fdfsolver* gsl_root_fdfsolver_alloc (const(gsl_root_fdfsolver_type)* T);
int gsl_root_fdfsolver_set (gsl_root_fdfsolver* s, gsl_function_fdf* fdf, double root);
int gsl_root_fdfsolver_iterate (gsl_root_fdfsolver* s);
void gsl_root_fdfsolver_free (gsl_root_fdfsolver* s);
const(char)* gsl_root_fdfsolver_name (const(gsl_root_fdfsolver)* s);
double gsl_root_fdfsolver_root (const(gsl_root_fdfsolver)* s);
int gsl_root_test_interval (double x_lower, double x_upper, double epsabs, double epsrel);
int gsl_root_test_residual (double f, double epsabs);
int gsl_root_test_delta (double x1, double x0, double epsabs, double epsrel);