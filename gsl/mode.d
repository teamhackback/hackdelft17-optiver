/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.mode;

extern (C):

alias gsl_mode_t = uint;

enum GSL_PREC_DOUBLE = 0;
enum GSL_PREC_SINGLE = 1;
enum GSL_PREC_APPROX = 2;
uint GSL_MODE_PREC(gsl_mode_t mt);
enum GSL_MODE_DEFAULT = 0;

