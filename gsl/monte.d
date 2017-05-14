/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.monte;
import gsl.rng;

extern (C):

//monte
alias gsl_monte_function_struct gsl_monte_function;

struct gsl_monte_function_struct
{
    double function (double*, size_t, void*) f;
    size_t dim;
    void* params;
}

//gsl_monte_miser
struct gsl_monte_miser_state
{
    size_t min_calls;
    size_t min_calls_per_bisection;
    double dither;
    double estimate_frac;
    double alpha;
    size_t dim;
    int estimate_style;
    int depth;
    int verbose;
    double* x;
    double* xmid;
    double* sigma_l;
    double* sigma_r;
    double* fmax_l;
    double* fmax_r;
    double* fmin_l;
    double* fmin_r;
    double* fsum_l;
    double* fsum_r;
    double* fsum2_l;
    double* fsum2_r;
    size_t* hits_l;
    size_t* hits_r;
}

struct gsl_monte_miser_params
{
    double estimate_frac;
    size_t min_calls;
    size_t min_calls_per_bisection;
    double alpha;
    double dither;
}

int gsl_monte_miser_integrate (gsl_monte_function* f, const(double)* xl, const(double)* xh, size_t dim, size_t calls, gsl_rng* r, gsl_monte_miser_state* state, double* result, double* abserr);
gsl_monte_miser_state* gsl_monte_miser_alloc (size_t dim);
int gsl_monte_miser_init (gsl_monte_miser_state* state);
void gsl_monte_miser_free (gsl_monte_miser_state* state);
void gsl_monte_miser_params_get (const(gsl_monte_miser_state)* state, gsl_monte_miser_params* params);
void gsl_monte_miser_params_set (gsl_monte_miser_state* state, const(gsl_monte_miser_params)* params);

//gsl_monte_plain
struct gsl_monte_plain_state
{
    size_t dim;
    double* x;
}

int gsl_monte_plain_integrate (const(gsl_monte_function)* f, const(double)* xl, const(double)* xu, const size_t dim, const size_t calls, gsl_rng* r, gsl_monte_plain_state* state, double* result, double* abserr);
gsl_monte_plain_state* gsl_monte_plain_alloc (size_t dim);
int gsl_monte_plain_init (gsl_monte_plain_state* state);
void gsl_monte_plain_free (gsl_monte_plain_state* state);
