/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.ntuple;

import core.stdc.stdio : FILE;
import gsl.errno;
import gsl.histogram;

extern (C):

struct gsl_ntuple
{
    FILE* file;
    void* ntuple_data;
    size_t size;
}

struct gsl_ntuple_select_fn
{
    int function (void*, void*) function_;
    void* params;
}

struct gsl_ntuple_value_fn
{
    double function (void*, void*) function_;
    void* params;
}

gsl_ntuple* gsl_ntuple_open (char* filename, void* ntuple_data, size_t size);
gsl_ntuple* gsl_ntuple_create (char* filename, void* ntuple_data, size_t size);
int gsl_ntuple_write (gsl_ntuple* ntuple);
int gsl_ntuple_read (gsl_ntuple* ntuple);
int gsl_ntuple_bookdata (gsl_ntuple* ntuple);
int gsl_ntuple_project (gsl_histogram* h, gsl_ntuple* ntuple, gsl_ntuple_value_fn* value_func, gsl_ntuple_select_fn* select_func);
int gsl_ntuple_close (gsl_ntuple* ntuple);