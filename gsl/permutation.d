/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.permutation;
import gsl.errno;
import gsl.vector;
import core.stdc.config;
import core.stdc.stdio : FILE;
import gsl.check_range;
import gsl.complex;

extern (C):

//gsl_permutation
alias gsl_permutation_struct gsl_permutation;

struct gsl_permutation_struct
{
    size_t size;
    size_t* data;
}

gsl_permutation* gsl_permutation_alloc (const size_t n);
gsl_permutation* gsl_permutation_calloc (const size_t n);
void gsl_permutation_init (gsl_permutation* p);
void gsl_permutation_free (gsl_permutation* p);
int gsl_permutation_memcpy (gsl_permutation* dest, const(gsl_permutation)* src);
int gsl_permutation_fread (FILE* stream, gsl_permutation* p);
int gsl_permutation_fwrite (FILE* stream, const(gsl_permutation)* p);
int gsl_permutation_fscanf (FILE* stream, gsl_permutation* p);
int gsl_permutation_fprintf (FILE* stream, const(gsl_permutation)* p, const(char)* format);
size_t gsl_permutation_size (const(gsl_permutation)* p);
size_t* gsl_permutation_data (const(gsl_permutation)* p);
int gsl_permutation_swap (gsl_permutation* p, const size_t i, const size_t j);
int gsl_permutation_valid (const(gsl_permutation)* p);
void gsl_permutation_reverse (gsl_permutation* p);
int gsl_permutation_inverse (gsl_permutation* inv, const(gsl_permutation)* p);
int gsl_permutation_next (gsl_permutation* p);
int gsl_permutation_prev (gsl_permutation* p);
int gsl_permutation_mul (gsl_permutation* p, const(gsl_permutation)* pa, const(gsl_permutation)* pb);
int gsl_permutation_linear_to_canonical (gsl_permutation* q, const(gsl_permutation)* p);
int gsl_permutation_canonical_to_linear (gsl_permutation* p, const(gsl_permutation)* q);
size_t gsl_permutation_inversions (const(gsl_permutation)* p);
size_t gsl_permutation_linear_cycles (const(gsl_permutation)* p);
size_t gsl_permutation_canonical_cycles (const(gsl_permutation)* q);
size_t gsl_permutation_get (const(gsl_permutation)* p, const size_t i);

//gsl_permute_char
int gsl_permute_char (const(size_t)* p, char* data, const size_t stride, const size_t n);
int gsl_permute_char_inverse (const(size_t)* p, char* data, const size_t stride, const size_t n);

//gsl_permute_complex_double
int gsl_permute_complex (const(size_t)* p, double* data, const size_t stride, const size_t n);
int gsl_permute_complex_inverse (const(size_t)* p, double* data, const size_t stride, const size_t n);

//gsl_permute_complex_float
int gsl_permute_complex_float (const(size_t)* p, float* data, const size_t stride, const size_t n);
int gsl_permute_complex_float_inverse (const(size_t)* p, float* data, const size_t stride, const size_t n);

//gsl_permute_complex_long_double
int gsl_permute_complex_long_double (const(size_t)* p, real* data, const size_t stride, const size_t n);
int gsl_permute_complex_long_double_inverse (const(size_t)* p, real* data, const size_t stride, const size_t n);

//gsl_permute_double
int gsl_permute (const(size_t)* p, double* data, const size_t stride, const size_t n);
int gsl_permute_inverse (const(size_t)* p, double* data, const size_t stride, const size_t n);

//gsl_permute_float
int gsl_permute_float (const(size_t)* p, float* data, const size_t stride, const size_t n);
int gsl_permute_float_inverse (const(size_t)* p, float* data, const size_t stride, const size_t n);

//gsl_permute_int
int gsl_permute_int (const(size_t)* p, int* data, const size_t stride, const size_t n);
int gsl_permute_int_inverse (const(size_t)* p, int* data, const size_t stride, const size_t n);

//gsl_permute_long
int gsl_permute_long (const(size_t)* p, c_long* data, const size_t stride, const size_t n);
int gsl_permute_long_inverse (const(size_t)* p, c_long* data, const size_t stride, const size_t n);

//gsl_permutation
int gsl_permute_long_double (const(size_t)* p, real* data, const size_t stride, const size_t n);
int gsl_permute_long_double_inverse (const(size_t)* p, real* data, const size_t stride, const size_t n);

//gsl_permute_short
int gsl_permute_short (const(size_t)* p, short* data, const size_t stride, const size_t n);
int gsl_permute_short_inverse (const(size_t)* p, short* data, const size_t stride, const size_t n);

//gsl_permute_uchar
int gsl_permute_uchar (const(size_t)* p, ubyte* data, const size_t stride, const size_t n);
int gsl_permute_uchar_inverse (const(size_t)* p, ubyte* data, const size_t stride, const size_t n);

//gsl_permute_uint
int gsl_permute_uint (const(size_t)* p, uint* data, const size_t stride, const size_t n);
int gsl_permute_uint_inverse (const(size_t)* p, uint* data, const size_t stride, const size_t n);

//gsl_permute_ulong
int gsl_permute_ulong (const(size_t)* p, c_ulong* data, const size_t stride, const size_t n);
int gsl_permute_ulong_inverse (const(size_t)* p, c_ulong* data, const size_t stride, const size_t n);

//gsl_permute_ushort
int gsl_permute_ushort (const(size_t)* p, ushort* data, const size_t stride, const size_t n);
int gsl_permute_ushort_inverse (const(size_t)* p, ushort* data, const size_t stride, const size_t n);

//gsl_permute_vector_char
int gsl_permute_vector_char (const(gsl_permutation)* p, gsl_vector_char* v);
int gsl_permute_vector_char_inverse (const(gsl_permutation)* p, gsl_vector_char* v);

//gsl_permute_vector_complex
int gsl_permute_vector_complex (const(gsl_permutation)* p, gsl_vector_complex* v);
int gsl_permute_vector_complex_inverse (const(gsl_permutation)* p, gsl_vector_complex* v);

//gsl_permute_vector_complex_float
int gsl_permute_vector_complex_float (const(gsl_permutation)* p, gsl_vector_complex_float* v);
int gsl_permute_vector_complex_float_inverse (const(gsl_permutation)* p, gsl_vector_complex_float* v);

//gsl_permute_vector_complex_long_double
int gsl_permute_vector_complex_long_double (const(gsl_permutation)* p, gsl_vector_complex_long_double* v);
int gsl_permute_vector_complex_long_double_inverse (const(gsl_permutation)* p, gsl_vector_complex_long_double* v);

//gsl_permute_vector
int gsl_permute_vector (const(gsl_permutation)* p, gsl_vector* v);
int gsl_permute_vector_inverse (const(gsl_permutation)* p, gsl_vector* v);

//gsl_permute_vector_float
int gsl_permute_vector_float (const(gsl_permutation)* p, gsl_vector_float* v);
int gsl_permute_vector_float_inverse (const(gsl_permutation)* p, gsl_vector_float* v);

//gsl_permute_vector_int
int gsl_permute_vector_int (const(gsl_permutation)* p, gsl_vector_int* v);
int gsl_permute_vector_int_inverse (const(gsl_permutation)* p, gsl_vector_int* v);

//gsl_permute_vector_long
int gsl_permute_vector_long (const(gsl_permutation)* p, gsl_vector_long* v);
int gsl_permute_vector_long_inverse (const(gsl_permutation)* p, gsl_vector_long* v);

//gsl_permute_vector_long_double
int gsl_permute_vector_long_double (const(gsl_permutation)* p, gsl_vector_long_double* v);
int gsl_permute_vector_long_double_inverse (const(gsl_permutation)* p, gsl_vector_long_double* v);

//gsl_permute_vector_short
int gsl_permute_vector_short (const(gsl_permutation)* p, gsl_vector_short* v);
int gsl_permute_vector_short_inverse (const(gsl_permutation)* p, gsl_vector_short* v);

//gsl_permute_vector_uchar
int gsl_permute_vector_uchar (const(gsl_permutation)* p, gsl_vector_uchar* v);
int gsl_permute_vector_uchar_inverse (const(gsl_permutation)* p, gsl_vector_uchar* v);

//gsl_permute_vector_uint
int gsl_permute_vector_uint (const(gsl_permutation)* p, gsl_vector_uint* v);
int gsl_permute_vector_uint_inverse (const(gsl_permutation)* p, gsl_vector_uint* v);

//gsl_permute_vector_ulong
int gsl_permute_vector_ulong (const(gsl_permutation)* p, gsl_vector_ulong* v);
int gsl_permute_vector_ulong_inverse (const(gsl_permutation)* p, gsl_vector_ulong* v);

//gsl_permute_vector_ushort
int gsl_permute_vector_ushort (const(gsl_permutation)* p, gsl_vector_ushort* v);
int gsl_permute_vector_ushort_inverse (const(gsl_permutation)* p, gsl_vector_ushort* v);
