/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.sum;

extern (C):

struct gsl_sum_levin_u_workspace
{
    size_t size;
    size_t i;
    size_t terms_used;
    double sum_plain;
    double* q_num;
    double* q_den;
    double* dq_num;
    double* dq_den;
    double* dsum;
}

struct gsl_sum_levin_utrunc_workspace
{
    size_t size;
    size_t i;
    size_t terms_used;
    double sum_plain;
    double* q_num;
    double* q_den;
    double* dsum;
}

gsl_sum_levin_u_workspace* gsl_sum_levin_u_alloc (size_t n);
void gsl_sum_levin_u_free (gsl_sum_levin_u_workspace* w);
int gsl_sum_levin_u_accel (const(double)* array, const size_t n, gsl_sum_levin_u_workspace* w, double* sum_accel, double* abserr);
int gsl_sum_levin_u_minmax (const(double)* array, const size_t n, const size_t min_terms, const size_t max_terms, gsl_sum_levin_u_workspace* w, double* sum_accel, double* abserr);
int gsl_sum_levin_u_step (const double term, const size_t n, const size_t nmax, gsl_sum_levin_u_workspace* w, double* sum_accel);
gsl_sum_levin_utrunc_workspace* gsl_sum_levin_utrunc_alloc (size_t n);
void gsl_sum_levin_utrunc_free (gsl_sum_levin_utrunc_workspace* w);
int gsl_sum_levin_utrunc_accel (const(double)* array, const size_t n, gsl_sum_levin_utrunc_workspace* w, double* sum_accel, double* abserr_trunc);
int gsl_sum_levin_utrunc_minmax (const(double)* array, const size_t n, const size_t min_terms, const size_t max_terms, gsl_sum_levin_utrunc_workspace* w, double* sum_accel, double* abserr_trunc);
int gsl_sum_levin_utrunc_step (const double term, const size_t n, gsl_sum_levin_utrunc_workspace* w, double* sum_accel);