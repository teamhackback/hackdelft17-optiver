/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.bspline;
import gsl.math;
import gsl.vector;
import gsl.matrix;


extern (C):

struct gsl_bspline_workspace
{
    size_t k;
    size_t km1;
    size_t l;
    size_t nbreak;
    size_t n;
    gsl_vector* knots;
    gsl_vector* deltal;
    gsl_vector* deltar;
    gsl_vector* B;
    gsl_matrix* A;
    gsl_matrix* dB;
}

struct gsl_bspline_deriv_workspace
{
    size_t k;
    gsl_matrix* A;
    gsl_matrix* dB;
}

gsl_bspline_deriv_workspace* gsl_bspline_deriv_alloc (const size_t k);
void gsl_bspline_deriv_free (gsl_bspline_deriv_workspace* w);
gsl_bspline_workspace* gsl_bspline_alloc (const size_t k, const size_t nbreak);
void gsl_bspline_free (gsl_bspline_workspace* w);
size_t gsl_bspline_ncoeffs (gsl_bspline_workspace* w);
size_t gsl_bspline_order (gsl_bspline_workspace* w);
size_t gsl_bspline_nbreak (gsl_bspline_workspace* w);
double gsl_bspline_breakpoint (size_t i, gsl_bspline_workspace* w);
double gsl_bspline_greville_abscissa (size_t i, gsl_bspline_workspace* w);
int gsl_bspline_knots (const(gsl_vector)* breakpts, gsl_bspline_workspace* w);
int gsl_bspline_knots_uniform (const double a, const double b, gsl_bspline_workspace* w);
int gsl_bspline_knots_greville (const(gsl_vector)* abscissae, gsl_bspline_workspace* w, double* abserr);
int gsl_bspline_eval (const double x, gsl_vector* B, gsl_bspline_workspace* w);
int gsl_bspline_eval_nonzero (const double x, gsl_vector* Bk, size_t* istart, size_t* iend, gsl_bspline_workspace* w);
int gsl_bspline_deriv_eval (const double x, const size_t nderiv, gsl_matrix* dB, gsl_bspline_workspace* w);
int gsl_bspline_deriv_eval_nonzero (const double x, const size_t nderiv, gsl_matrix* dB, size_t* istart, size_t* iend, gsl_bspline_workspace* w);