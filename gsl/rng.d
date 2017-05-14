/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.rng;
import gsl.errno;
import core.stdc.stdio : FILE;
import core.stdc.config : c_ulong;

extern (C):

struct gsl_rng_type
{
    const(char)* name;
    c_ulong max;
    c_ulong min;
    size_t size;
    void function (void*, c_ulong) set;
    c_ulong function (void*) get;
    double function (void*) get_double;
}

struct gsl_rng
{
    const(gsl_rng_type)* type;
    void* state;
}

extern __gshared const(gsl_rng_type)* gsl_rng_borosh13;
extern __gshared const(gsl_rng_type)* gsl_rng_coveyou;
extern __gshared const(gsl_rng_type)* gsl_rng_cmrg;
extern __gshared const(gsl_rng_type)* gsl_rng_fishman18;
extern __gshared const(gsl_rng_type)* gsl_rng_fishman20;
extern __gshared const(gsl_rng_type)* gsl_rng_fishman2x;
extern __gshared const(gsl_rng_type)* gsl_rng_gfsr4;
extern __gshared const(gsl_rng_type)* gsl_rng_knuthran;
extern __gshared const(gsl_rng_type)* gsl_rng_knuthran2;
extern __gshared const(gsl_rng_type)* gsl_rng_knuthran2002;
extern __gshared const(gsl_rng_type)* gsl_rng_lecuyer21;
extern __gshared const(gsl_rng_type)* gsl_rng_minstd;
extern __gshared const(gsl_rng_type)* gsl_rng_mrg;
extern __gshared const(gsl_rng_type)* gsl_rng_mt19937;
extern __gshared const(gsl_rng_type)* gsl_rng_mt19937_1999;
extern __gshared const(gsl_rng_type)* gsl_rng_mt19937_1998;
extern __gshared const(gsl_rng_type)* gsl_rng_r250;
extern __gshared const(gsl_rng_type)* gsl_rng_ran0;
extern __gshared const(gsl_rng_type)* gsl_rng_ran1;
extern __gshared const(gsl_rng_type)* gsl_rng_ran2;
extern __gshared const(gsl_rng_type)* gsl_rng_ran3;
extern __gshared const(gsl_rng_type)* gsl_rng_rand;
extern __gshared const(gsl_rng_type)* gsl_rng_rand48;
extern __gshared const(gsl_rng_type)* gsl_rng_random128_bsd;
extern __gshared const(gsl_rng_type)* gsl_rng_random128_glibc2;
extern __gshared const(gsl_rng_type)* gsl_rng_random128_libc5;
extern __gshared const(gsl_rng_type)* gsl_rng_random256_bsd;
extern __gshared const(gsl_rng_type)* gsl_rng_random256_glibc2;
extern __gshared const(gsl_rng_type)* gsl_rng_random256_libc5;
extern __gshared const(gsl_rng_type)* gsl_rng_random32_bsd;
extern __gshared const(gsl_rng_type)* gsl_rng_random32_glibc2;
extern __gshared const(gsl_rng_type)* gsl_rng_random32_libc5;
extern __gshared const(gsl_rng_type)* gsl_rng_random64_bsd;
extern __gshared const(gsl_rng_type)* gsl_rng_random64_glibc2;
extern __gshared const(gsl_rng_type)* gsl_rng_random64_libc5;
extern __gshared const(gsl_rng_type)* gsl_rng_random8_bsd;
extern __gshared const(gsl_rng_type)* gsl_rng_random8_glibc2;
extern __gshared const(gsl_rng_type)* gsl_rng_random8_libc5;
extern __gshared const(gsl_rng_type)* gsl_rng_random_bsd;
extern __gshared const(gsl_rng_type)* gsl_rng_random_glibc2;
extern __gshared const(gsl_rng_type)* gsl_rng_random_libc5;
extern __gshared const(gsl_rng_type)* gsl_rng_randu;
extern __gshared const(gsl_rng_type)* gsl_rng_ranf;
extern __gshared const(gsl_rng_type)* gsl_rng_ranlux;
extern __gshared const(gsl_rng_type)* gsl_rng_ranlux389;
extern __gshared const(gsl_rng_type)* gsl_rng_ranlxd1;
extern __gshared const(gsl_rng_type)* gsl_rng_ranlxd2;
extern __gshared const(gsl_rng_type)* gsl_rng_ranlxs0;
extern __gshared const(gsl_rng_type)* gsl_rng_ranlxs1;
extern __gshared const(gsl_rng_type)* gsl_rng_ranlxs2;
extern __gshared const(gsl_rng_type)* gsl_rng_ranmar;
extern __gshared const(gsl_rng_type)* gsl_rng_slatec;
extern __gshared const(gsl_rng_type)* gsl_rng_taus;
extern __gshared const(gsl_rng_type)* gsl_rng_taus2;
extern __gshared const(gsl_rng_type)* gsl_rng_taus113;
extern __gshared const(gsl_rng_type)* gsl_rng_transputer;
extern __gshared const(gsl_rng_type)* gsl_rng_tt800;
extern __gshared const(gsl_rng_type)* gsl_rng_uni;
extern __gshared const(gsl_rng_type)* gsl_rng_uni32;
extern __gshared const(gsl_rng_type)* gsl_rng_vax;
extern __gshared const(gsl_rng_type)* gsl_rng_waterman14;
extern __gshared const(gsl_rng_type)* gsl_rng_zuf;
extern __gshared const(gsl_rng_type)* gsl_rng_default;
extern __gshared c_ulong gsl_rng_default_seed;

const(gsl_rng_type*)* gsl_rng_types_setup ();
gsl_rng* gsl_rng_alloc (const(gsl_rng_type)* T);
int gsl_rng_memcpy (gsl_rng* dest, const(gsl_rng)* src);
gsl_rng* gsl_rng_clone (const(gsl_rng)* r);
void gsl_rng_free (gsl_rng* r);
void gsl_rng_set (const(gsl_rng)* r, c_ulong seed);
c_ulong gsl_rng_max (const(gsl_rng)* r);
c_ulong gsl_rng_min (const(gsl_rng)* r);
const(char)* gsl_rng_name (const(gsl_rng)* r);
int gsl_rng_fread (FILE* stream, gsl_rng* r);
int gsl_rng_fwrite (FILE* stream, const(gsl_rng)* r);
size_t gsl_rng_size (const(gsl_rng)* r);
void* gsl_rng_state (const(gsl_rng)* r);
void gsl_rng_print_state (const(gsl_rng)* r);
const(gsl_rng_type)* gsl_rng_env_setup ();
c_ulong gsl_rng_get (const(gsl_rng)* r);
double gsl_rng_uniform (const(gsl_rng)* r);
double gsl_rng_uniform_pos (const(gsl_rng)* r);
c_ulong gsl_rng_uniform_int (const(gsl_rng)* r, c_ulong n);