/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.precision;

extern (C):

alias gsl_prec_t = uint;
enum _GSL_PREC_T_NUM = 3;

extern __gshared const(double)* gsl_prec_eps;
extern __gshared const(double)* gsl_prec_sqrt_eps;
extern __gshared const(double)* gsl_prec_root3_eps;
extern __gshared const(double)* gsl_prec_root4_eps;
extern __gshared const(double)* gsl_prec_root5_eps;
extern __gshared const(double)* gsl_prec_root6_eps;
