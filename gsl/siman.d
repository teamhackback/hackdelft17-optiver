/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.siman;
import gsl.rng;

extern (C):

alias double function (void*) gsl_siman_Efunc_t;
alias void function (const(gsl_rng)*, void*, double) gsl_siman_step_t;
alias double function (void*, void*) gsl_siman_metric_t;
alias void function (void*) gsl_siman_print_t;
alias void function (void*, void*) gsl_siman_copy_t;
alias void* function (void*) gsl_siman_copy_construct_t;
alias void function (void*) gsl_siman_destroy_t;

struct gsl_siman_params_t
{
    int n_tries;
    int iters_fixed_T;
    double step_size;
    double k;
    double t_initial;
    double mu_t;
    double t_min;
}

void gsl_siman_solve (const(gsl_rng)* r, void* x0_p, gsl_siman_Efunc_t Ef, gsl_siman_step_t take_step, gsl_siman_metric_t distance, gsl_siman_print_t print_position, gsl_siman_copy_t copyfunc, gsl_siman_copy_construct_t copy_constructor, gsl_siman_destroy_t destructor, size_t element_size, gsl_siman_params_t params);
void gsl_siman_solve_many (const(gsl_rng)* r, void* x0_p, gsl_siman_Efunc_t Ef, gsl_siman_step_t take_step, gsl_siman_metric_t distance, gsl_siman_print_t print_position, size_t element_size, gsl_siman_params_t params);