/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.multiset;

import core.stdc.stdio : FILE;
import core.stdc.stdio;
import gsl.errno;
import gsl.check_range;

extern (C):

alias gsl_multiset_struct gsl_multiset;

struct gsl_multiset_struct
{
    size_t n;
    size_t k;
    size_t* data;
}

gsl_multiset* gsl_multiset_alloc (const size_t n, const size_t k);
gsl_multiset* gsl_multiset_calloc (const size_t n, const size_t k);
void gsl_multiset_init_first (gsl_multiset* c);
void gsl_multiset_init_last (gsl_multiset* c);
void gsl_multiset_free (gsl_multiset* c);
int gsl_multiset_memcpy (gsl_multiset* dest, const(gsl_multiset)* src);
int gsl_multiset_fread (FILE* stream, gsl_multiset* c);
int gsl_multiset_fwrite (FILE* stream, const(gsl_multiset)* c);
int gsl_multiset_fscanf (FILE* stream, gsl_multiset* c);
int gsl_multiset_fprintf (FILE* stream, const(gsl_multiset)* c, const(char)* format);
size_t gsl_multiset_n (const(gsl_multiset)* c);
size_t gsl_multiset_k (const(gsl_multiset)* c);
size_t* gsl_multiset_data (const(gsl_multiset)* c);
int gsl_multiset_valid (gsl_multiset* c);
int gsl_multiset_next (gsl_multiset* c);
int gsl_multiset_prev (gsl_multiset* c);
size_t gsl_multiset_get (const(gsl_multiset)* c, const size_t i);