/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.nan;

extern (C):

alias floatnum = double;
enum GSL_POSINF = floatnum.infinity;
enum GSL_NEGINF  = -floatnum.infinity;

enum GSL_NAN  = floatnum.nan;
enum GSL_POSZERO = +floatnum.min_normal;
enum GSL_NEGZERO = -floatnum.min_normal;
