/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.multiroots;
import gsl.math;
import gsl.vector;
import gsl.matrix;

extern (C):

alias gsl_multiroot_function_struct gsl_multiroot_function;
alias gsl_multiroot_function_fdf_struct gsl_multiroot_function_fdf;

extern __gshared const(gsl_multiroot_fsolver_type)* gsl_multiroot_fsolver_dnewton;
extern __gshared const(gsl_multiroot_fsolver_type)* gsl_multiroot_fsolver_broyden;
extern __gshared const(gsl_multiroot_fsolver_type)* gsl_multiroot_fsolver_hybrid;
extern __gshared const(gsl_multiroot_fsolver_type)* gsl_multiroot_fsolver_hybrids;
extern __gshared const(gsl_multiroot_fdfsolver_type)* gsl_multiroot_fdfsolver_newton;
extern __gshared const(gsl_multiroot_fdfsolver_type)* gsl_multiroot_fdfsolver_gnewton;
extern __gshared const(gsl_multiroot_fdfsolver_type)* gsl_multiroot_fdfsolver_hybridj;
extern __gshared const(gsl_multiroot_fdfsolver_type)* gsl_multiroot_fdfsolver_hybridsj;

struct gsl_multiroot_function_struct
{
    int function (const(gsl_vector)*, void*, gsl_vector*) f;
    size_t n;
    void* params;
}

struct gsl_multiroot_fsolver_type
{
    const(char)* name;
    size_t size;
    int function (void*, size_t) alloc;
    int function (void*, gsl_multiroot_function*, gsl_vector*, gsl_vector*, gsl_vector*) set;
    int function (void*, gsl_multiroot_function*, gsl_vector*, gsl_vector*, gsl_vector*) iterate;
    void function (void*) free;
}

struct gsl_multiroot_fsolver
{
    const(gsl_multiroot_fsolver_type)* type;
    gsl_multiroot_function* function_;
    gsl_vector* x;
    gsl_vector* f;
    gsl_vector* dx;
    void* state;
}

struct gsl_multiroot_function_fdf_struct
{
    int function (const(gsl_vector)*, void*, gsl_vector*) f;
    int function (const(gsl_vector)*, void*, gsl_matrix*) df;
    int function (const(gsl_vector)*, void*, gsl_vector*, gsl_matrix*) fdf;
    size_t n;
    void* params;
}

struct gsl_multiroot_fdfsolver_type
{
    const(char)* name;
    size_t size;
    int function (void*, size_t) alloc;
    int function (void*, gsl_multiroot_function_fdf*, gsl_vector*, gsl_vector*, gsl_matrix*, gsl_vector*) set;
    int function (void*, gsl_multiroot_function_fdf*, gsl_vector*, gsl_vector*, gsl_matrix*, gsl_vector*) iterate;
    void function (void*) free;
}

struct gsl_multiroot_fdfsolver
{
    const(gsl_multiroot_fdfsolver_type)* type;
    gsl_multiroot_function_fdf* fdf;
    gsl_vector* x;
    gsl_vector* f;
    gsl_matrix* J;
    gsl_vector* dx;
    void* state;
}

int gsl_multiroot_fdjacobian (gsl_multiroot_function* F, const(gsl_vector)* x, const(gsl_vector)* f, double epsrel, gsl_matrix* jacobian);
gsl_multiroot_fsolver* gsl_multiroot_fsolver_alloc (const(gsl_multiroot_fsolver_type)* T, size_t n);
void gsl_multiroot_fsolver_free (gsl_multiroot_fsolver* s);
int gsl_multiroot_fsolver_set (gsl_multiroot_fsolver* s, gsl_multiroot_function* f, const(gsl_vector)* x);
int gsl_multiroot_fsolver_iterate (gsl_multiroot_fsolver* s);
const(char)* gsl_multiroot_fsolver_name (const(gsl_multiroot_fsolver)* s);
gsl_vector* gsl_multiroot_fsolver_root (const(gsl_multiroot_fsolver)* s);
gsl_vector* gsl_multiroot_fsolver_dx (const(gsl_multiroot_fsolver)* s);
gsl_vector* gsl_multiroot_fsolver_f (const(gsl_multiroot_fsolver)* s);
gsl_multiroot_fdfsolver* gsl_multiroot_fdfsolver_alloc (const(gsl_multiroot_fdfsolver_type)* T, size_t n);
int gsl_multiroot_fdfsolver_set (gsl_multiroot_fdfsolver* s, gsl_multiroot_function_fdf* fdf, const(gsl_vector)* x);
int gsl_multiroot_fdfsolver_iterate (gsl_multiroot_fdfsolver* s);
void gsl_multiroot_fdfsolver_free (gsl_multiroot_fdfsolver* s);
const(char)* gsl_multiroot_fdfsolver_name (const(gsl_multiroot_fdfsolver)* s);
gsl_vector* gsl_multiroot_fdfsolver_root (const(gsl_multiroot_fdfsolver)* s);
gsl_vector* gsl_multiroot_fdfsolver_dx (const(gsl_multiroot_fdfsolver)* s);
gsl_vector* gsl_multiroot_fdfsolver_f (const(gsl_multiroot_fdfsolver)* s);
int gsl_multiroot_test_delta (const(gsl_vector)* dx, const(gsl_vector)* x, double epsabs, double epsrel);
int gsl_multiroot_test_residual (const(gsl_vector)* f, double epsabs);