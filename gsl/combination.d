/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.combination;
import gsl.errno;
import core.stdc.stdio : FILE;

extern (C):

alias gsl_combination_struct gsl_combination;

struct gsl_combination_struct
{
    size_t n;
    size_t k;
    size_t* data;
}

gsl_combination* gsl_combination_alloc (const size_t n, const size_t k);
gsl_combination* gsl_combination_calloc (const size_t n, const size_t k);
void gsl_combination_init_first (gsl_combination* c);
void gsl_combination_init_last (gsl_combination* c);
void gsl_combination_free (gsl_combination* c);
int gsl_combination_memcpy (gsl_combination* dest, const(gsl_combination)* src);
int gsl_combination_fread (FILE* stream, gsl_combination* c);
int gsl_combination_fwrite (FILE* stream, const(gsl_combination)* c);
int gsl_combination_fscanf (FILE* stream, gsl_combination* c);
int gsl_combination_fprintf (FILE* stream, const(gsl_combination)* c, const(char)* format);
size_t gsl_combination_n (const(gsl_combination)* c);
size_t gsl_combination_k (const(gsl_combination)* c);
size_t* gsl_combination_data (const(gsl_combination)* c);
int gsl_combination_valid (gsl_combination* c);
int gsl_combination_next (gsl_combination* c);
int gsl_combination_prev (gsl_combination* c);
size_t gsl_combination_get (const(gsl_combination)* c, const size_t i);