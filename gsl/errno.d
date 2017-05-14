/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.errno;
import core.stdc.stdio : FILE;

extern (C):

enum GSL_SUCCESS  = 0; 
enum GSL_FAILURE  = -1;
enum GSL_CONTINUE = -2;  /* iteration has not converged */
enum GSL_EDOM     = 1;   /* input domain error; e.g sqrt(-1) */
enum GSL_ERANGE   = 2;   /* output range error; e.g. exp(1e100) */
enum GSL_EFAULT   = 3;   /* invalid pointer */
enum GSL_EINVAL   = 4;   /* invalid argument supplied by user */
enum GSL_EFAILED  = 5;   /* generic failure */
enum GSL_EFACTOR  = 6;   /* factorization failed */
enum GSL_ESANITY  = 7;   /* sanity check failed - shouldn't happen */
enum GSL_ENOMEM   = 8;   /* malloc failed */
enum GSL_EBADFUNC = 9;   /* problem with user-supplied function */
enum GSL_ERUNAWAY = 10;  /* iterative process is out of control */
enum GSL_EMAXITER = 11;  /* exceeded max number of iterations */
enum GSL_EZERODIV = 12;  /* tried to divide by zero */
enum GSL_EBADTOL  = 13;  /* user specified an invalid tolerance */
enum GSL_ETOL     = 14;  /* failed to reach the specified tolerance */
enum GSL_EUNDRFLW = 15;  /* underflow */
enum GSL_EOVRFLW  = 16;  /* overflow  */
enum GSL_ELOSS    = 17;  /* loss of accuracy */
enum GSL_EROUND   = 18;  /* failed because of roundoff error */
enum GSL_EBADLEN  = 19;  /* matrix, vector lengths are not conformant */
enum GSL_ENOTSQR  = 20;  /* matrix not square */
enum GSL_ESING    = 21;  /* apparent singularity detected */
enum GSL_EDIVERGE = 22;  /* integral or series is divergent */
enum GSL_EUNSUP   = 23;  /* requested feature is not supported by the hardware */
enum GSL_EUNIMPL  = 24;  /* requested feature not (yet) implemented */
enum GSL_ECACHE   = 25;  /* cache limit exceeded */
enum GSL_ETABLE   = 26;  /* table limit exceeded */
enum GSL_ENOPROG  = 27;  /* iteration is not making progress towards solution */
enum GSL_ENOPROGJ = 28;  /* jacobian evaluations are not improving the solution */
enum GSL_ETOLF    = 29;  /* cannot reach the specified tolerance in F */
enum GSL_ETOLX    = 30;  /* cannot reach the specified tolerance in X */
enum GSL_ETOLG    = 31;  /* cannot reach the specified tolerance in gradient */
enum GSL_EOF      = 32;   /* end of file */


void gsl_error (const(char)* reason, const(char)* file, int line, int gsl_errno);

void gsl_stream_printf (const(char)* label, const(char)* file, int line, const(char)* reason);

const(char)* gsl_strerror (const int gsl_errno);

alias gsl_error_handler_t = void function(const(char)* reason, const(char)* file, int line, int gsl_errno);
alias gsl_stream_handler_t = void function(const(char)* label, const(char)* file, int line, const(char)* reason);

gsl_error_handler_t* gsl_set_error_handler (gsl_error_handler_t* new_handler);
gsl_error_handler_t* gsl_set_error_handler_off();
gsl_stream_handler_t* gsl_set_stream_handler (gsl_stream_handler_t* new_handler);

FILE* gsl_set_stream (FILE* new_stream);

