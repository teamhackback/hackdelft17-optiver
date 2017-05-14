/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.qrng;
import gsl.errno;

extern (C):

extern __gshared const(gsl_qrng_type)* gsl_qrng_niederreiter_2;
extern __gshared const(gsl_qrng_type)* gsl_qrng_sobol;
extern __gshared const(gsl_qrng_type)* gsl_qrng_halton;
extern __gshared const(gsl_qrng_type)* gsl_qrng_reversehalton;

struct gsl_qrng_type
{
    const(char)* name;
    uint max_dimension;
    size_t function (uint) state_size;
    int function (void*, uint) init_state;
    int function (void*, uint, double*) get;
}

struct gsl_qrng
{
    const(gsl_qrng_type)* type;
    uint dimension;
    size_t state_size;
    void* state;
}

gsl_qrng* gsl_qrng_alloc (const(gsl_qrng_type)* T, uint dimension);
int gsl_qrng_memcpy (gsl_qrng* dest, const(gsl_qrng)* src);
gsl_qrng* gsl_qrng_clone (const(gsl_qrng)* q);
void gsl_qrng_free (gsl_qrng* q);
void gsl_qrng_init (gsl_qrng* q);
const(char)* gsl_qrng_name (const(gsl_qrng)* q);
size_t gsl_qrng_size (const(gsl_qrng)* q);
void* gsl_qrng_state (const(gsl_qrng)* q);
int gsl_qrng_get (const(gsl_qrng)* q, double* x);