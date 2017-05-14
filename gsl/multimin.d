/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.multimin;
import gsl.math;
import gsl.vector;
import gsl.matrix;
import gsl.min;

extern (C):

alias gsl_multimin_function_struct gsl_multimin_function;
alias gsl_multimin_function_fdf_struct gsl_multimin_function_fdf;

extern __gshared const(gsl_multimin_fdfminimizer_type)* gsl_multimin_fdfminimizer_steepest_descent;
extern __gshared const(gsl_multimin_fdfminimizer_type)* gsl_multimin_fdfminimizer_conjugate_pr;
extern __gshared const(gsl_multimin_fdfminimizer_type)* gsl_multimin_fdfminimizer_conjugate_fr;
extern __gshared const(gsl_multimin_fdfminimizer_type)* gsl_multimin_fdfminimizer_vector_bfgs;
extern __gshared const(gsl_multimin_fdfminimizer_type)* gsl_multimin_fdfminimizer_vector_bfgs2;
extern __gshared const(gsl_multimin_fminimizer_type)* gsl_multimin_fminimizer_nmsimplex;
extern __gshared const(gsl_multimin_fminimizer_type)* gsl_multimin_fminimizer_nmsimplex2;
extern __gshared const(gsl_multimin_fminimizer_type)* gsl_multimin_fminimizer_nmsimplex2rand;

struct gsl_multimin_function_struct
{
    double function (const(gsl_vector)*, void*) f;
    size_t n;
    void* params;
}

struct gsl_multimin_function_fdf_struct
{
    double function (const(gsl_vector)*, void*) f;
    void function (const(gsl_vector)*, void*, gsl_vector*) df;
    void function (const(gsl_vector)*, void*, double*, gsl_vector*) fdf;
    size_t n;
    void* params;
}

struct gsl_multimin_fminimizer_type
{
    const(char)* name;
    size_t size;
    int function (void*, size_t) alloc;
    int function (void*, gsl_multimin_function*, const(gsl_vector)*, double*, const(gsl_vector)*) set;
    int function (void*, gsl_multimin_function*, gsl_vector*, double*, double*) iterate;
    void function (void*) free;
}

struct gsl_multimin_fminimizer
{
    const(gsl_multimin_fminimizer_type)* type;
    gsl_multimin_function* f;
    double fval;
    gsl_vector* x;
    double size;
    void* state;
}

struct gsl_multimin_fdfminimizer_type
{
    const(char)* name;
    size_t size;
    int function (void*, size_t) alloc;
    int function (void*, gsl_multimin_function_fdf*, const(gsl_vector)*, double*, gsl_vector*, double, double) set;
    int function (void*, gsl_multimin_function_fdf*, gsl_vector*, double*, gsl_vector*, gsl_vector*) iterate;
    int function (void*) restart;
    void function (void*) free;
}

struct gsl_multimin_fdfminimizer
{
    const(gsl_multimin_fdfminimizer_type)* type;
    gsl_multimin_function_fdf* fdf;
    double f;
    gsl_vector* x;
    gsl_vector* gradient;
    gsl_vector* dx;
    void* state;
}

int gsl_multimin_diff (const(gsl_multimin_function)* f, const(gsl_vector)* x, gsl_vector* g);
gsl_multimin_fminimizer* gsl_multimin_fminimizer_alloc (const(gsl_multimin_fminimizer_type)* T, size_t n);
int gsl_multimin_fminimizer_set (gsl_multimin_fminimizer* s, gsl_multimin_function* f, const(gsl_vector)* x, const(gsl_vector)* step_size);
void gsl_multimin_fminimizer_free (gsl_multimin_fminimizer* s);
const(char)* gsl_multimin_fminimizer_name (const(gsl_multimin_fminimizer)* s);
int gsl_multimin_fminimizer_iterate (gsl_multimin_fminimizer* s);
gsl_vector* gsl_multimin_fminimizer_x (const(gsl_multimin_fminimizer)* s);
double gsl_multimin_fminimizer_minimum (const(gsl_multimin_fminimizer)* s);
double gsl_multimin_fminimizer_size (const(gsl_multimin_fminimizer)* s);
int gsl_multimin_test_gradient (const(gsl_vector)* g, double epsabs);
int gsl_multimin_test_size (const double size, double epsabs);
gsl_multimin_fdfminimizer* gsl_multimin_fdfminimizer_alloc (const(gsl_multimin_fdfminimizer_type)* T, size_t n);
int gsl_multimin_fdfminimizer_set (gsl_multimin_fdfminimizer* s, gsl_multimin_function_fdf* fdf, const(gsl_vector)* x, double step_size, double tol);
void gsl_multimin_fdfminimizer_free (gsl_multimin_fdfminimizer* s);
const(char)* gsl_multimin_fdfminimizer_name (const(gsl_multimin_fdfminimizer)* s);
int gsl_multimin_fdfminimizer_iterate (gsl_multimin_fdfminimizer* s);
int gsl_multimin_fdfminimizer_restart (gsl_multimin_fdfminimizer* s);
gsl_vector* gsl_multimin_fdfminimizer_x (const(gsl_multimin_fdfminimizer)* s);
gsl_vector* gsl_multimin_fdfminimizer_dx (const(gsl_multimin_fdfminimizer)* s);
gsl_vector* gsl_multimin_fdfminimizer_gradient (const(gsl_multimin_fdfminimizer)* s);
double gsl_multimin_fdfminimizer_minimum (const(gsl_multimin_fdfminimizer)* s);