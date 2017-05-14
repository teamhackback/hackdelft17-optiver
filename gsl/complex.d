/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.complex;
//import core.stdc.complex;

extern (C):

//gsl_complex
alias double* gsl_complex_packed;
alias float* gsl_complex_packed_float;
alias real* gsl_complex_packed_long_double;
alias const(double)* gsl_const_complex_packed;
alias const(float)* gsl_const_complex_packed_float;
alias const(real)* gsl_const_complex_packed_long_double;
alias double* gsl_complex_packed_array;
alias float* gsl_complex_packed_array_float;
alias real* gsl_complex_packed_array_long_double;
alias const(double)* gsl_const_complex_packed_array;
alias const(float)* gsl_const_complex_packed_array_float;
alias const(real)* gsl_const_complex_packed_array_long_double;
alias double* gsl_complex_packed_ptr;
alias float* gsl_complex_packed_float_ptr;
alias real* gsl_complex_packed_long_double_ptr;
alias const(double)* gsl_const_complex_packed_ptr;
alias const(float)* gsl_const_complex_packed_float_ptr;
alias const(real)* gsl_const_complex_packed_long_double_ptr;

struct gsl_complex_long_double
{
    real[2] dat;
}

struct gsl_complex
{
    double[2] dat;
}

struct gsl_complex_float
{
    float[2] dat;
}



// gsl_complex_math
gsl_complex gsl_complex_polar (double r, double theta);
gsl_complex gsl_complex_rect (double x, double y);
double gsl_complex_arg (gsl_complex z);
double gsl_complex_abs (gsl_complex z);
double gsl_complex_abs2 (gsl_complex z);
double gsl_complex_logabs (gsl_complex z);
gsl_complex gsl_complex_add (gsl_complex a, gsl_complex b);
gsl_complex gsl_complex_sub (gsl_complex a, gsl_complex b);
gsl_complex gsl_complex_mul (gsl_complex a, gsl_complex b);
gsl_complex gsl_complex_div (gsl_complex a, gsl_complex b);
gsl_complex gsl_complex_add_real (gsl_complex a, double x);
gsl_complex gsl_complex_sub_real (gsl_complex a, double x);
gsl_complex gsl_complex_mul_real (gsl_complex a, double x);
gsl_complex gsl_complex_div_real (gsl_complex a, double x);
gsl_complex gsl_complex_add_imag (gsl_complex a, double y);
gsl_complex gsl_complex_sub_imag (gsl_complex a, double y);
gsl_complex gsl_complex_mul_imag (gsl_complex a, double y);
gsl_complex gsl_complex_div_imag (gsl_complex a, double y);
gsl_complex gsl_complex_conjugate (gsl_complex z);
gsl_complex gsl_complex_inverse (gsl_complex a);
gsl_complex gsl_complex_negative (gsl_complex a);
gsl_complex gsl_complex_sqrt (gsl_complex z);
gsl_complex gsl_complex_sqrt_real (double x);
gsl_complex gsl_complex_pow (gsl_complex a, gsl_complex b);
gsl_complex gsl_complex_pow_real (gsl_complex a, double b);
gsl_complex gsl_complex_exp (gsl_complex a);
gsl_complex gsl_complex_log (gsl_complex a);
gsl_complex gsl_complex_log10 (gsl_complex a);
gsl_complex gsl_complex_log_b (gsl_complex a, gsl_complex b);
gsl_complex gsl_complex_sin (gsl_complex a);
gsl_complex gsl_complex_cos (gsl_complex a);
gsl_complex gsl_complex_sec (gsl_complex a);
gsl_complex gsl_complex_csc (gsl_complex a);
gsl_complex gsl_complex_tan (gsl_complex a);
gsl_complex gsl_complex_cot (gsl_complex a);
gsl_complex gsl_complex_arcsin (gsl_complex a);
gsl_complex gsl_complex_arcsin_real (double a);
gsl_complex gsl_complex_arccos (gsl_complex a);
gsl_complex gsl_complex_arccos_real (double a);
gsl_complex gsl_complex_arcsec (gsl_complex a);
gsl_complex gsl_complex_arcsec_real (double a);
gsl_complex gsl_complex_arccsc (gsl_complex a);
gsl_complex gsl_complex_arccsc_real (double a);
gsl_complex gsl_complex_arctan (gsl_complex a);
gsl_complex gsl_complex_arccot (gsl_complex a);
gsl_complex gsl_complex_sinh (gsl_complex a);
gsl_complex gsl_complex_cosh (gsl_complex a);
gsl_complex gsl_complex_sech (gsl_complex a);
gsl_complex gsl_complex_csch (gsl_complex a);
gsl_complex gsl_complex_tanh (gsl_complex a);
gsl_complex gsl_complex_coth (gsl_complex a);
gsl_complex gsl_complex_arcsinh (gsl_complex a);
gsl_complex gsl_complex_arccosh (gsl_complex a);
gsl_complex gsl_complex_arccosh_real (double a);
gsl_complex gsl_complex_arcsech (gsl_complex a);
gsl_complex gsl_complex_arccsch (gsl_complex a);
gsl_complex gsl_complex_arctanh (gsl_complex a);
gsl_complex gsl_complex_arctanh_real (double a);
gsl_complex gsl_complex_arccoth (gsl_complex a);
