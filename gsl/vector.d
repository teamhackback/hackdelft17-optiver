/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.vector;
import gsl.block;
import gsl.check_range;
import gsl.complex;
import core.stdc.stdio : FILE;
//import core.stdc.complex;
import core.stdc.config : c_long;
import core.stdc.config : c_ulong;

extern (C):

// gsl_vector_char
struct gsl_vector_char
{
    size_t size;
    size_t stride;
    char* data;
    gsl_block_char* block;
    int owner;
}

struct _gsl_vector_char_view
{
    gsl_vector_char vector;
}

struct _gsl_vector_char_const_view
{
    gsl_vector_char vector;
}

alias _gsl_vector_char_view gsl_vector_char_view;
alias const _gsl_vector_char_const_view gsl_vector_char_const_view;

gsl_vector_char* gsl_vector_char_alloc (const size_t n);
gsl_vector_char* gsl_vector_char_calloc (const size_t n);
gsl_vector_char* gsl_vector_char_alloc_from_block (gsl_block_char* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_char* gsl_vector_char_alloc_from_vector (gsl_vector_char* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_char_free (gsl_vector_char* v);
_gsl_vector_char_view gsl_vector_char_view_array (char* v, size_t n);
_gsl_vector_char_view gsl_vector_char_view_array_with_stride (char* base, size_t stride, size_t n);
_gsl_vector_char_const_view gsl_vector_char_const_view_array (const(char)* v, size_t n);
_gsl_vector_char_const_view gsl_vector_char_const_view_array_with_stride (const(char)* base, size_t stride, size_t n);
_gsl_vector_char_view gsl_vector_char_subvector (gsl_vector_char* v, size_t i, size_t n);
_gsl_vector_char_view gsl_vector_char_subvector_with_stride (gsl_vector_char* v, size_t i, size_t stride, size_t n);
_gsl_vector_char_const_view gsl_vector_char_const_subvector (const(gsl_vector_char)* v, size_t i, size_t n);
_gsl_vector_char_const_view gsl_vector_char_const_subvector_with_stride (const(gsl_vector_char)* v, size_t i, size_t stride, size_t n);
void gsl_vector_char_set_zero (gsl_vector_char* v);
void gsl_vector_char_set_all (gsl_vector_char* v, char x);
int gsl_vector_char_set_basis (gsl_vector_char* v, size_t i);
int gsl_vector_char_fread (FILE* stream, gsl_vector_char* v);
int gsl_vector_char_fwrite (FILE* stream, const(gsl_vector_char)* v);
int gsl_vector_char_fscanf (FILE* stream, gsl_vector_char* v);
int gsl_vector_char_fprintf (FILE* stream, const(gsl_vector_char)* v, const(char)* format);
int gsl_vector_char_memcpy (gsl_vector_char* dest, const(gsl_vector_char)* src);
int gsl_vector_char_reverse (gsl_vector_char* v);
int gsl_vector_char_swap (gsl_vector_char* v, gsl_vector_char* w);
int gsl_vector_char_swap_elements (gsl_vector_char* v, const size_t i, const size_t j);
char gsl_vector_char_max (const(gsl_vector_char)* v);
char gsl_vector_char_min (const(gsl_vector_char)* v);
void gsl_vector_char_minmax (const(gsl_vector_char)* v, char* min_out, char* max_out);
size_t gsl_vector_char_max_index (const(gsl_vector_char)* v);
size_t gsl_vector_char_min_index (const(gsl_vector_char)* v);
void gsl_vector_char_minmax_index (const(gsl_vector_char)* v, size_t* imin, size_t* imax);
int gsl_vector_char_add (gsl_vector_char* a, const(gsl_vector_char)* b);
int gsl_vector_char_sub (gsl_vector_char* a, const(gsl_vector_char)* b);
int gsl_vector_char_mul (gsl_vector_char* a, const(gsl_vector_char)* b);
int gsl_vector_char_div (gsl_vector_char* a, const(gsl_vector_char)* b);
int gsl_vector_char_scale (gsl_vector_char* a, const double x);
int gsl_vector_char_add_constant (gsl_vector_char* a, const double x);
int gsl_vector_char_equal (const(gsl_vector_char)* u, const(gsl_vector_char)* v);
int gsl_vector_char_isnull (const(gsl_vector_char)* v);
int gsl_vector_char_ispos (const(gsl_vector_char)* v);
int gsl_vector_char_isneg (const(gsl_vector_char)* v);
int gsl_vector_char_isnonneg (const(gsl_vector_char)* v);
char gsl_vector_char_get (const(gsl_vector_char)* v, const size_t i);
void gsl_vector_char_set (gsl_vector_char* v, const size_t i, char x);
char* gsl_vector_char_ptr (gsl_vector_char* v, const size_t i);
const(char)* gsl_vector_char_const_ptr (const(gsl_vector_char)* v, const size_t i);


// gsl_vector_complex_double
struct gsl_vector_complex
{
    size_t size;
    size_t stride;
    double* data;
    gsl_block_complex* block;
    int owner;
}

struct _gsl_vector_complex_view
{
    gsl_vector_complex vector;
}

struct _gsl_vector_complex_const_view
{
    gsl_vector_complex vector;
}

alias _gsl_vector_complex_view gsl_vector_complex_view;
alias const _gsl_vector_complex_const_view gsl_vector_complex_const_view;

gsl_vector_complex* gsl_vector_complex_alloc (const size_t n);
gsl_vector_complex* gsl_vector_complex_calloc (const size_t n);
gsl_vector_complex* gsl_vector_complex_alloc_from_block (gsl_block_complex* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_complex* gsl_vector_complex_alloc_from_vector (gsl_vector_complex* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_complex_free (gsl_vector_complex* v);
_gsl_vector_complex_view gsl_vector_complex_view_array (double* base, size_t n);
_gsl_vector_complex_view gsl_vector_complex_view_array_with_stride (double* base, size_t stride, size_t n);
_gsl_vector_complex_const_view gsl_vector_complex_const_view_array (const(double)* base, size_t n);
_gsl_vector_complex_const_view gsl_vector_complex_const_view_array_with_stride (const(double)* base, size_t stride, size_t n);
_gsl_vector_complex_view gsl_vector_complex_subvector (gsl_vector_complex* base, size_t i, size_t n);
_gsl_vector_complex_view gsl_vector_complex_subvector_with_stride (gsl_vector_complex* v, size_t i, size_t stride, size_t n);
_gsl_vector_complex_const_view gsl_vector_complex_const_subvector (const(gsl_vector_complex)* base, size_t i, size_t n);
_gsl_vector_complex_const_view gsl_vector_complex_const_subvector_with_stride (const(gsl_vector_complex)* v, size_t i, size_t stride, size_t n);
_gsl_vector_view gsl_vector_complex_real (gsl_vector_complex* v);
_gsl_vector_view gsl_vector_complex_imag (gsl_vector_complex* v);
_gsl_vector_const_view gsl_vector_complex_const_real (const(gsl_vector_complex)* v);
_gsl_vector_const_view gsl_vector_complex_const_imag (const(gsl_vector_complex)* v);
void gsl_vector_complex_set_zero (gsl_vector_complex* v);
void gsl_vector_complex_set_all (gsl_vector_complex* v, gsl_complex z);
int gsl_vector_complex_set_basis (gsl_vector_complex* v, size_t i);
int gsl_vector_complex_fread (FILE* stream, gsl_vector_complex* v);
int gsl_vector_complex_fwrite (FILE* stream, const(gsl_vector_complex)* v);
int gsl_vector_complex_fscanf (FILE* stream, gsl_vector_complex* v);
int gsl_vector_complex_fprintf (FILE* stream, const(gsl_vector_complex)* v, const(char)* format);
int gsl_vector_complex_memcpy (gsl_vector_complex* dest, const(gsl_vector_complex)* src);
int gsl_vector_complex_reverse (gsl_vector_complex* v);
int gsl_vector_complex_swap (gsl_vector_complex* v, gsl_vector_complex* w);
int gsl_vector_complex_swap_elements (gsl_vector_complex* v, const size_t i, const size_t j);
int gsl_vector_complex_equal (const(gsl_vector_complex)* u, const(gsl_vector_complex)* v);
int gsl_vector_complex_isnull (const(gsl_vector_complex)* v);
int gsl_vector_complex_ispos (const(gsl_vector_complex)* v);
int gsl_vector_complex_isneg (const(gsl_vector_complex)* v);
int gsl_vector_complex_isnonneg (const(gsl_vector_complex)* v);
int gsl_vector_complex_add (gsl_vector_complex* a, const(gsl_vector_complex)* b);
int gsl_vector_complex_sub (gsl_vector_complex* a, const(gsl_vector_complex)* b);
int gsl_vector_complex_mul (gsl_vector_complex* a, const(gsl_vector_complex)* b);
int gsl_vector_complex_div (gsl_vector_complex* a, const(gsl_vector_complex)* b);
int gsl_vector_complex_scale (gsl_vector_complex* a, const gsl_complex x);
int gsl_vector_complex_add_constant (gsl_vector_complex* a, const gsl_complex x);
gsl_complex gsl_vector_complex_get (const(gsl_vector_complex)* v, const size_t i);
void gsl_vector_complex_set (gsl_vector_complex* v, const size_t i, gsl_complex z);
gsl_complex* gsl_vector_complex_ptr (gsl_vector_complex* v, const size_t i);
const(gsl_complex)* gsl_vector_complex_const_ptr (const(gsl_vector_complex)* v, const size_t i);


//gsl_vector_complex_float
struct gsl_vector_complex_float
{
    size_t size;
    size_t stride;
    float* data;
    gsl_block_complex_float* block;
    int owner;
}

struct _gsl_vector_complex_float_view
{
  gsl_vector_complex_float vector;
}

struct _gsl_vector_complex_float_const_view
{
  gsl_vector_complex_float vector;
}

alias _gsl_vector_complex_float_view gsl_vector_complex_float_view;
alias const _gsl_vector_complex_float_const_view gsl_vector_complex_float_const_view;

gsl_vector_complex_float* gsl_vector_complex_float_alloc (const size_t n);
gsl_vector_complex_float* gsl_vector_complex_float_calloc (const size_t n);
gsl_vector_complex_float* gsl_vector_complex_float_alloc_from_block (gsl_block_complex_float* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_complex_float* gsl_vector_complex_float_alloc_from_vector (gsl_vector_complex_float* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_complex_float_free (gsl_vector_complex_float* v);
_gsl_vector_complex_float_view gsl_vector_complex_float_view_array (float* base, size_t n);
_gsl_vector_complex_float_view gsl_vector_complex_float_view_array_with_stride (float* base, size_t stride, size_t n);
_gsl_vector_complex_float_const_view gsl_vector_complex_float_const_view_array (const(float)* base, size_t n);
_gsl_vector_complex_float_const_view gsl_vector_complex_float_const_view_array_with_stride (const(float)* base, size_t stride, size_t n);
_gsl_vector_complex_float_view gsl_vector_complex_float_subvector (gsl_vector_complex_float* base, size_t i, size_t n);
_gsl_vector_complex_float_view gsl_vector_complex_float_subvector_with_stride (gsl_vector_complex_float* v, size_t i, size_t stride, size_t n);
_gsl_vector_complex_float_const_view gsl_vector_complex_float_const_subvector (const(gsl_vector_complex_float)* base, size_t i, size_t n);
_gsl_vector_complex_float_const_view gsl_vector_complex_float_const_subvector_with_stride (const(gsl_vector_complex_float)* v, size_t i, size_t stride, size_t n);
_gsl_vector_float_view gsl_vector_complex_float_real (gsl_vector_complex_float* v);
_gsl_vector_float_view gsl_vector_complex_float_imag (gsl_vector_complex_float* v);
_gsl_vector_float_const_view gsl_vector_complex_float_const_real (const(gsl_vector_complex_float)* v);
_gsl_vector_float_const_view gsl_vector_complex_float_const_imag (const(gsl_vector_complex_float)* v);
void gsl_vector_complex_float_set_zero (gsl_vector_complex_float* v);
void gsl_vector_complex_float_set_all (gsl_vector_complex_float* v, gsl_complex_float z);
int gsl_vector_complex_float_set_basis (gsl_vector_complex_float* v, size_t i);
int gsl_vector_complex_float_fread (FILE* stream, gsl_vector_complex_float* v);
int gsl_vector_complex_float_fwrite (FILE* stream, const(gsl_vector_complex_float)* v);
int gsl_vector_complex_float_fscanf (FILE* stream, gsl_vector_complex_float* v);
int gsl_vector_complex_float_fprintf (FILE* stream, const(gsl_vector_complex_float)* v, const(char)* format);
int gsl_vector_complex_float_memcpy (gsl_vector_complex_float* dest, const(gsl_vector_complex_float)* src);
int gsl_vector_complex_float_reverse (gsl_vector_complex_float* v);
int gsl_vector_complex_float_swap (gsl_vector_complex_float* v, gsl_vector_complex_float* w);
int gsl_vector_complex_float_swap_elements (gsl_vector_complex_float* v, const size_t i, const size_t j);
int gsl_vector_complex_float_equal (const(gsl_vector_complex_float)* u, const(gsl_vector_complex_float)* v);
int gsl_vector_complex_float_isnull (const(gsl_vector_complex_float)* v);
int gsl_vector_complex_float_ispos (const(gsl_vector_complex_float)* v);
int gsl_vector_complex_float_isneg (const(gsl_vector_complex_float)* v);
int gsl_vector_complex_float_isnonneg (const(gsl_vector_complex_float)* v);
int gsl_vector_complex_float_add (gsl_vector_complex_float* a, const(gsl_vector_complex_float)* b);
int gsl_vector_complex_float_sub (gsl_vector_complex_float* a, const(gsl_vector_complex_float)* b);
int gsl_vector_complex_float_mul (gsl_vector_complex_float* a, const(gsl_vector_complex_float)* b);
int gsl_vector_complex_float_div (gsl_vector_complex_float* a, const(gsl_vector_complex_float)* b);
int gsl_vector_complex_float_scale (gsl_vector_complex_float* a, const gsl_complex_float x);
int gsl_vector_complex_float_add_constant (gsl_vector_complex_float* a, const gsl_complex_float x);
gsl_complex_float gsl_vector_complex_float_get (const(gsl_vector_complex_float)* v, const size_t i);
void gsl_vector_complex_float_set (gsl_vector_complex_float* v, const size_t i, gsl_complex_float z);
gsl_complex_float* gsl_vector_complex_float_ptr (gsl_vector_complex_float* v, const size_t i);
const(gsl_complex_float)* gsl_vector_complex_float_const_ptr (const(gsl_vector_complex_float)* v, const size_t i);

//gsl_vector_complex_long_double
struct gsl_vector_complex_long_double
{
    size_t size;
    size_t stride;
    real* data;
    gsl_block_complex_long_double* block;
    int owner;
}

struct _gsl_vector_complex_long_double_view
{
    gsl_vector_complex_long_double vector;
}

struct _gsl_vector_complex_long_double_const_view
{
    gsl_vector_complex_long_double vector;
}

alias _gsl_vector_complex_long_double_view gsl_vector_complex_long_double_view;
alias const _gsl_vector_complex_long_double_const_view gsl_vector_complex_long_double_const_view;

gsl_vector_complex_long_double* gsl_vector_complex_long_double_alloc (const size_t n);
gsl_vector_complex_long_double* gsl_vector_complex_long_double_calloc (const size_t n);
gsl_vector_complex_long_double* gsl_vector_complex_long_double_alloc_from_block (gsl_block_complex_long_double* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_complex_long_double* gsl_vector_complex_long_double_alloc_from_vector (gsl_vector_complex_long_double* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_complex_long_double_free (gsl_vector_complex_long_double* v);
_gsl_vector_complex_long_double_view gsl_vector_complex_long_double_view_array (real* base, size_t n);
_gsl_vector_complex_long_double_view gsl_vector_complex_long_double_view_array_with_stride (real* base, size_t stride, size_t n);
_gsl_vector_complex_long_double_const_view gsl_vector_complex_long_double_const_view_array (const(real)* base, size_t n);
_gsl_vector_complex_long_double_const_view gsl_vector_complex_long_double_const_view_array_with_stride (const(real)* base, size_t stride, size_t n);
_gsl_vector_complex_long_double_view gsl_vector_complex_long_double_subvector (gsl_vector_complex_long_double* base, size_t i, size_t n);
_gsl_vector_complex_long_double_view gsl_vector_complex_long_double_subvector_with_stride (gsl_vector_complex_long_double* v, size_t i, size_t stride, size_t n);
_gsl_vector_complex_long_double_const_view gsl_vector_complex_long_double_const_subvector (const(gsl_vector_complex_long_double)* base, size_t i, size_t n);
_gsl_vector_complex_long_double_const_view gsl_vector_complex_long_double_const_subvector_with_stride (const(gsl_vector_complex_long_double)* v, size_t i, size_t stride, size_t n);
_gsl_vector_long_double_view gsl_vector_complex_long_double_real (gsl_vector_complex_long_double* v);
_gsl_vector_long_double_view gsl_vector_complex_long_double_imag (gsl_vector_complex_long_double* v);
_gsl_vector_long_double_const_view gsl_vector_complex_long_double_const_real (const(gsl_vector_complex_long_double)* v);
_gsl_vector_long_double_const_view gsl_vector_complex_long_double_const_imag (const(gsl_vector_complex_long_double)* v);
void gsl_vector_complex_long_double_set_zero (gsl_vector_complex_long_double* v);
void gsl_vector_complex_long_double_set_all (gsl_vector_complex_long_double* v, gsl_complex_long_double z);
int gsl_vector_complex_long_double_set_basis (gsl_vector_complex_long_double* v, size_t i);
int gsl_vector_complex_long_double_fread (FILE* stream, gsl_vector_complex_long_double* v);
int gsl_vector_complex_long_double_fwrite (FILE* stream, const(gsl_vector_complex_long_double)* v);
int gsl_vector_complex_long_double_fscanf (FILE* stream, gsl_vector_complex_long_double* v);
int gsl_vector_complex_long_double_fprintf (FILE* stream, const(gsl_vector_complex_long_double)* v, const(char)* format);
int gsl_vector_complex_long_double_memcpy (gsl_vector_complex_long_double* dest, const(gsl_vector_complex_long_double)* src);
int gsl_vector_complex_long_double_reverse (gsl_vector_complex_long_double* v);
int gsl_vector_complex_long_double_swap (gsl_vector_complex_long_double* v, gsl_vector_complex_long_double* w);
int gsl_vector_complex_long_double_swap_elements (gsl_vector_complex_long_double* v, const size_t i, const size_t j);
int gsl_vector_complex_long_double_equal (const(gsl_vector_complex_long_double)* u, const(gsl_vector_complex_long_double)* v);
int gsl_vector_complex_long_double_isnull (const(gsl_vector_complex_long_double)* v);
int gsl_vector_complex_long_double_ispos (const(gsl_vector_complex_long_double)* v);
int gsl_vector_complex_long_double_isneg (const(gsl_vector_complex_long_double)* v);
int gsl_vector_complex_long_double_isnonneg (const(gsl_vector_complex_long_double)* v);
int gsl_vector_complex_long_double_add (gsl_vector_complex_long_double* a, const(gsl_vector_complex_long_double)* b);
int gsl_vector_complex_long_double_sub (gsl_vector_complex_long_double* a, const(gsl_vector_complex_long_double)* b);
int gsl_vector_complex_long_double_mul (gsl_vector_complex_long_double* a, const(gsl_vector_complex_long_double)* b);
int gsl_vector_complex_long_double_div (gsl_vector_complex_long_double* a, const(gsl_vector_complex_long_double)* b);
int gsl_vector_complex_long_double_scale (gsl_vector_complex_long_double* a, const gsl_complex_long_double x);
int gsl_vector_complex_long_double_add_constant (gsl_vector_complex_long_double* a, const gsl_complex_long_double x);
gsl_complex_long_double gsl_vector_complex_long_double_get (const(gsl_vector_complex_long_double)* v, const size_t i);
void gsl_vector_complex_long_double_set (gsl_vector_complex_long_double* v, const size_t i, gsl_complex_long_double z);
gsl_complex_long_double* gsl_vector_complex_long_double_ptr (gsl_vector_complex_long_double* v, const size_t i);
const(gsl_complex_long_double)* gsl_vector_complex_long_double_const_ptr (const(gsl_vector_complex_long_double)* v, const size_t i);


//gsl_vector_double
struct gsl_vector
{
    size_t size;
    size_t stride;
    double* data;
    gsl_block* block;
    int owner;
}

struct _gsl_vector_view
{
    gsl_vector vector;
}

struct _gsl_vector_const_view
{
    gsl_vector vector;
}

alias _gsl_vector_view gsl_vector_view;
alias const _gsl_vector_const_view gsl_vector_const_view;

gsl_vector* gsl_vector_alloc (const size_t n);
gsl_vector* gsl_vector_calloc (const size_t n);
gsl_vector* gsl_vector_alloc_from_block (gsl_block* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector* gsl_vector_alloc_from_vector (gsl_vector* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_free (gsl_vector* v);
_gsl_vector_view gsl_vector_view_array (double* v, size_t n);
_gsl_vector_view gsl_vector_view_array_with_stride (double* base, size_t stride, size_t n);
_gsl_vector_const_view gsl_vector_const_view_array (const(double)* v, size_t n);
_gsl_vector_const_view gsl_vector_const_view_array_with_stride (const(double)* base, size_t stride, size_t n);
_gsl_vector_view gsl_vector_subvector (gsl_vector* v, size_t i, size_t n);
_gsl_vector_view gsl_vector_subvector_with_stride (gsl_vector* v, size_t i, size_t stride, size_t n);
_gsl_vector_const_view gsl_vector_const_subvector (const(gsl_vector)* v, size_t i, size_t n);
_gsl_vector_const_view gsl_vector_const_subvector_with_stride (const(gsl_vector)* v, size_t i, size_t stride, size_t n);
void gsl_vector_set_zero (gsl_vector* v);
void gsl_vector_set_all (gsl_vector* v, double x);
int gsl_vector_set_basis (gsl_vector* v, size_t i);
int gsl_vector_fread (FILE* stream, gsl_vector* v);
int gsl_vector_fwrite (FILE* stream, const(gsl_vector)* v);
int gsl_vector_fscanf (FILE* stream, gsl_vector* v);
int gsl_vector_fprintf (FILE* stream, const(gsl_vector)* v, const(char)* format);
int gsl_vector_memcpy (gsl_vector* dest, const(gsl_vector)* src);
int gsl_vector_reverse (gsl_vector* v);
int gsl_vector_swap (gsl_vector* v, gsl_vector* w);
int gsl_vector_swap_elements (gsl_vector* v, const size_t i, const size_t j);
double gsl_vector_max (const(gsl_vector)* v);
double gsl_vector_min (const(gsl_vector)* v);
void gsl_vector_minmax (const(gsl_vector)* v, double* min_out, double* max_out);
size_t gsl_vector_max_index (const(gsl_vector)* v);
size_t gsl_vector_min_index (const(gsl_vector)* v);
void gsl_vector_minmax_index (const(gsl_vector)* v, size_t* imin, size_t* imax);
int gsl_vector_add (gsl_vector* a, const(gsl_vector)* b);
int gsl_vector_sub (gsl_vector* a, const(gsl_vector)* b);
int gsl_vector_mul (gsl_vector* a, const(gsl_vector)* b);
int gsl_vector_div (gsl_vector* a, const(gsl_vector)* b);
int gsl_vector_scale (gsl_vector* a, const double x);
int gsl_vector_add_constant (gsl_vector* a, const double x);
int gsl_vector_equal (const(gsl_vector)* u, const(gsl_vector)* v);
int gsl_vector_isnull (const(gsl_vector)* v);
int gsl_vector_ispos (const(gsl_vector)* v);
int gsl_vector_isneg (const(gsl_vector)* v);
int gsl_vector_isnonneg (const(gsl_vector)* v);
double gsl_vector_get (const(gsl_vector)* v, const size_t i);
void gsl_vector_set (gsl_vector* v, const size_t i, double x);
double* gsl_vector_ptr (gsl_vector* v, const size_t i);
const(double)* gsl_vector_const_ptr (const(gsl_vector)* v, const size_t i);

//gsl_vector_float
struct gsl_vector_float
{
    size_t size;
    size_t stride;
    float* data;
    gsl_block_float* block;
    int owner;
}

struct _gsl_vector_float_view
{
  gsl_vector_float vector;
}

struct _gsl_vector_float_const_view
{
  gsl_vector_float vector;
}

alias _gsl_vector_float_view gsl_vector_float_view;
alias const _gsl_vector_float_const_view gsl_vector_float_const_view;

gsl_vector_float* gsl_vector_float_alloc (const size_t n);
gsl_vector_float* gsl_vector_float_calloc (const size_t n);
gsl_vector_float* gsl_vector_float_alloc_from_block (gsl_block_float* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_float* gsl_vector_float_alloc_from_vector (gsl_vector_float* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_float_free (gsl_vector_float* v);
_gsl_vector_float_view gsl_vector_float_view_array (float* v, size_t n);
_gsl_vector_float_view gsl_vector_float_view_array_with_stride (float* base, size_t stride, size_t n);
_gsl_vector_float_const_view gsl_vector_float_const_view_array (const(float)* v, size_t n);
_gsl_vector_float_const_view gsl_vector_float_const_view_array_with_stride (const(float)* base, size_t stride, size_t n);
_gsl_vector_float_view gsl_vector_float_subvector (gsl_vector_float* v, size_t i, size_t n);
_gsl_vector_float_view gsl_vector_float_subvector_with_stride (gsl_vector_float* v, size_t i, size_t stride, size_t n);
_gsl_vector_float_const_view gsl_vector_float_const_subvector (const(gsl_vector_float)* v, size_t i, size_t n);
_gsl_vector_float_const_view gsl_vector_float_const_subvector_with_stride (const(gsl_vector_float)* v, size_t i, size_t stride, size_t n);
void gsl_vector_float_set_zero (gsl_vector_float* v);
void gsl_vector_float_set_all (gsl_vector_float* v, float x);
int gsl_vector_float_set_basis (gsl_vector_float* v, size_t i);
int gsl_vector_float_fread (FILE* stream, gsl_vector_float* v);
int gsl_vector_float_fwrite (FILE* stream, const(gsl_vector_float)* v);
int gsl_vector_float_fscanf (FILE* stream, gsl_vector_float* v);
int gsl_vector_float_fprintf (FILE* stream, const(gsl_vector_float)* v, const(char)* format);
int gsl_vector_float_memcpy (gsl_vector_float* dest, const(gsl_vector_float)* src);
int gsl_vector_float_reverse (gsl_vector_float* v);
int gsl_vector_float_swap (gsl_vector_float* v, gsl_vector_float* w);
int gsl_vector_float_swap_elements (gsl_vector_float* v, const size_t i, const size_t j);
float gsl_vector_float_max (const(gsl_vector_float)* v);
float gsl_vector_float_min (const(gsl_vector_float)* v);
void gsl_vector_float_minmax (const(gsl_vector_float)* v, float* min_out, float* max_out);
size_t gsl_vector_float_max_index (const(gsl_vector_float)* v);
size_t gsl_vector_float_min_index (const(gsl_vector_float)* v);
void gsl_vector_float_minmax_index (const(gsl_vector_float)* v, size_t* imin, size_t* imax);
int gsl_vector_float_add (gsl_vector_float* a, const(gsl_vector_float)* b);
int gsl_vector_float_sub (gsl_vector_float* a, const(gsl_vector_float)* b);
int gsl_vector_float_mul (gsl_vector_float* a, const(gsl_vector_float)* b);
int gsl_vector_float_div (gsl_vector_float* a, const(gsl_vector_float)* b);
int gsl_vector_float_scale (gsl_vector_float* a, const double x);
int gsl_vector_float_add_constant (gsl_vector_float* a, const double x);
int gsl_vector_float_equal (const(gsl_vector_float)* u, const(gsl_vector_float)* v);
int gsl_vector_float_isnull (const(gsl_vector_float)* v);
int gsl_vector_float_ispos (const(gsl_vector_float)* v);
int gsl_vector_float_isneg (const(gsl_vector_float)* v);
int gsl_vector_float_isnonneg (const(gsl_vector_float)* v);
float gsl_vector_float_get (const(gsl_vector_float)* v, const size_t i);
void gsl_vector_float_set (gsl_vector_float* v, const size_t i, float x);
float* gsl_vector_float_ptr (gsl_vector_float* v, const size_t i);
const(float)* gsl_vector_float_const_ptr (const(gsl_vector_float)* v, const size_t i);


//gsl_vector_int
struct gsl_vector_int
{
    size_t size;
    size_t stride;
    int* data;
    gsl_block_int* block;
    int owner;
}

struct _gsl_vector_int_view
{
  gsl_vector_int vector;
}

struct _gsl_vector_int_const_view
{
  gsl_vector_int vector;
}

alias _gsl_vector_int_view gsl_vector_int_view;
alias const _gsl_vector_int_const_view gsl_vector_int_const_view;

gsl_vector_int* gsl_vector_int_alloc (const size_t n);
gsl_vector_int* gsl_vector_int_calloc (const size_t n);
gsl_vector_int* gsl_vector_int_alloc_from_block (gsl_block_int* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_int* gsl_vector_int_alloc_from_vector (gsl_vector_int* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_int_free (gsl_vector_int* v);
_gsl_vector_int_view gsl_vector_int_view_array (int* v, size_t n);
_gsl_vector_int_view gsl_vector_int_view_array_with_stride (int* base, size_t stride, size_t n);
_gsl_vector_int_const_view gsl_vector_int_const_view_array (const(int)* v, size_t n);
_gsl_vector_int_const_view gsl_vector_int_const_view_array_with_stride (const(int)* base, size_t stride, size_t n);
_gsl_vector_int_view gsl_vector_int_subvector (gsl_vector_int* v, size_t i, size_t n);
_gsl_vector_int_view gsl_vector_int_subvector_with_stride (gsl_vector_int* v, size_t i, size_t stride, size_t n);
_gsl_vector_int_const_view gsl_vector_int_const_subvector (const(gsl_vector_int)* v, size_t i, size_t n);
_gsl_vector_int_const_view gsl_vector_int_const_subvector_with_stride (const(gsl_vector_int)* v, size_t i, size_t stride, size_t n);
void gsl_vector_int_set_zero (gsl_vector_int* v);
void gsl_vector_int_set_all (gsl_vector_int* v, int x);
int gsl_vector_int_set_basis (gsl_vector_int* v, size_t i);
int gsl_vector_int_fread (FILE* stream, gsl_vector_int* v);
int gsl_vector_int_fwrite (FILE* stream, const(gsl_vector_int)* v);
int gsl_vector_int_fscanf (FILE* stream, gsl_vector_int* v);
int gsl_vector_int_fprintf (FILE* stream, const(gsl_vector_int)* v, const(char)* format);
int gsl_vector_int_memcpy (gsl_vector_int* dest, const(gsl_vector_int)* src);
int gsl_vector_int_reverse (gsl_vector_int* v);
int gsl_vector_int_swap (gsl_vector_int* v, gsl_vector_int* w);
int gsl_vector_int_swap_elements (gsl_vector_int* v, const size_t i, const size_t j);
int gsl_vector_int_max (const(gsl_vector_int)* v);
int gsl_vector_int_min (const(gsl_vector_int)* v);
void gsl_vector_int_minmax (const(gsl_vector_int)* v, int* min_out, int* max_out);
size_t gsl_vector_int_max_index (const(gsl_vector_int)* v);
size_t gsl_vector_int_min_index (const(gsl_vector_int)* v);
void gsl_vector_int_minmax_index (const(gsl_vector_int)* v, size_t* imin, size_t* imax);
int gsl_vector_int_add (gsl_vector_int* a, const(gsl_vector_int)* b);
int gsl_vector_int_sub (gsl_vector_int* a, const(gsl_vector_int)* b);
int gsl_vector_int_mul (gsl_vector_int* a, const(gsl_vector_int)* b);
int gsl_vector_int_div (gsl_vector_int* a, const(gsl_vector_int)* b);
int gsl_vector_int_scale (gsl_vector_int* a, const double x);
int gsl_vector_int_add_constant (gsl_vector_int* a, const double x);
int gsl_vector_int_equal (const(gsl_vector_int)* u, const(gsl_vector_int)* v);
int gsl_vector_int_isnull (const(gsl_vector_int)* v);
int gsl_vector_int_ispos (const(gsl_vector_int)* v);
int gsl_vector_int_isneg (const(gsl_vector_int)* v);
int gsl_vector_int_isnonneg (const(gsl_vector_int)* v);
int gsl_vector_int_get (const(gsl_vector_int)* v, const size_t i);
void gsl_vector_int_set (gsl_vector_int* v, const size_t i, int x);
int* gsl_vector_int_ptr (gsl_vector_int* v, const size_t i);
const(int)* gsl_vector_int_const_ptr (const(gsl_vector_int)* v, const size_t i);


//gsl_vector_long
struct gsl_vector_long
{
    size_t size;
    size_t stride;
    c_long* data;
    gsl_block_long* block;
    int owner;
}

struct _gsl_vector_long_view
{
  gsl_vector_long vector;
}


struct _gsl_vector_long_const_view
{
  gsl_vector_long vector;
}

alias _gsl_vector_long_view gsl_vector_long_view;
alias const _gsl_vector_long_const_view gsl_vector_long_const_view;

gsl_vector_long* gsl_vector_long_alloc (const size_t n);
gsl_vector_long* gsl_vector_long_calloc (const size_t n);
gsl_vector_long* gsl_vector_long_alloc_from_block (gsl_block_long* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_long* gsl_vector_long_alloc_from_vector (gsl_vector_long* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_long_free (gsl_vector_long* v);
_gsl_vector_long_view gsl_vector_long_view_array (c_long* v, size_t n);
_gsl_vector_long_view gsl_vector_long_view_array_with_stride (c_long* base, size_t stride, size_t n);
_gsl_vector_long_const_view gsl_vector_long_const_view_array (const(c_long)* v, size_t n);
_gsl_vector_long_const_view gsl_vector_long_const_view_array_with_stride (const(c_long)* base, size_t stride, size_t n);
_gsl_vector_long_view gsl_vector_long_subvector (gsl_vector_long* v, size_t i, size_t n);
_gsl_vector_long_view gsl_vector_long_subvector_with_stride (gsl_vector_long* v, size_t i, size_t stride, size_t n);
_gsl_vector_long_const_view gsl_vector_long_const_subvector (const(gsl_vector_long)* v, size_t i, size_t n);
_gsl_vector_long_const_view gsl_vector_long_const_subvector_with_stride (const(gsl_vector_long)* v, size_t i, size_t stride, size_t n);
void gsl_vector_long_set_zero (gsl_vector_long* v);
void gsl_vector_long_set_all (gsl_vector_long* v, c_long x);
int gsl_vector_long_set_basis (gsl_vector_long* v, size_t i);
int gsl_vector_long_fread (FILE* stream, gsl_vector_long* v);
int gsl_vector_long_fwrite (FILE* stream, const(gsl_vector_long)* v);
int gsl_vector_long_fscanf (FILE* stream, gsl_vector_long* v);
int gsl_vector_long_fprintf (FILE* stream, const(gsl_vector_long)* v, const(char)* format);
int gsl_vector_long_memcpy (gsl_vector_long* dest, const(gsl_vector_long)* src);
int gsl_vector_long_reverse (gsl_vector_long* v);
int gsl_vector_long_swap (gsl_vector_long* v, gsl_vector_long* w);
int gsl_vector_long_swap_elements (gsl_vector_long* v, const size_t i, const size_t j);
c_long gsl_vector_long_max (const(gsl_vector_long)* v);
c_long gsl_vector_long_min (const(gsl_vector_long)* v);
void gsl_vector_long_minmax (const(gsl_vector_long)* v, c_long* min_out, c_long* max_out);
size_t gsl_vector_long_max_index (const(gsl_vector_long)* v);
size_t gsl_vector_long_min_index (const(gsl_vector_long)* v);
void gsl_vector_long_minmax_index (const(gsl_vector_long)* v, size_t* imin, size_t* imax);
int gsl_vector_long_add (gsl_vector_long* a, const(gsl_vector_long)* b);
int gsl_vector_long_sub (gsl_vector_long* a, const(gsl_vector_long)* b);
int gsl_vector_long_mul (gsl_vector_long* a, const(gsl_vector_long)* b);
int gsl_vector_long_div (gsl_vector_long* a, const(gsl_vector_long)* b);
int gsl_vector_long_scale (gsl_vector_long* a, const double x);
int gsl_vector_long_add_constant (gsl_vector_long* a, const double x);
int gsl_vector_long_equal (const(gsl_vector_long)* u, const(gsl_vector_long)* v);
int gsl_vector_long_isnull (const(gsl_vector_long)* v);
int gsl_vector_long_ispos (const(gsl_vector_long)* v);
int gsl_vector_long_isneg (const(gsl_vector_long)* v);
int gsl_vector_long_isnonneg (const(gsl_vector_long)* v);
c_long gsl_vector_long_get (const(gsl_vector_long)* v, const size_t i);
void gsl_vector_long_set (gsl_vector_long* v, const size_t i, c_long x);
c_long* gsl_vector_long_ptr (gsl_vector_long* v, const size_t i);
const(c_long)* gsl_vector_long_const_ptr (const(gsl_vector_long)* v, const size_t i);


//gsl_vector_long_double
struct gsl_vector_long_double
{
    size_t size;
    size_t stride;
    real* data;
    gsl_block_long_double* block;
    int owner;
}

struct _gsl_vector_long_double_view
{
  gsl_vector_long_double vector;
}

struct _gsl_vector_long_double_const_view
{
  gsl_vector_long_double vector;
}

alias _gsl_vector_long_double_view gsl_vector_long_double_view;
alias const _gsl_vector_long_double_const_view gsl_vector_long_double_const_view;

gsl_vector_long_double* gsl_vector_long_double_alloc (const size_t n);
gsl_vector_long_double* gsl_vector_long_double_calloc (const size_t n);
gsl_vector_long_double* gsl_vector_long_double_alloc_from_block (gsl_block_long_double* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_long_double* gsl_vector_long_double_alloc_from_vector (gsl_vector_long_double* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_long_double_free (gsl_vector_long_double* v);
_gsl_vector_long_double_view gsl_vector_long_double_view_array (real* v, size_t n);
_gsl_vector_long_double_view gsl_vector_long_double_view_array_with_stride (real* base, size_t stride, size_t n);
_gsl_vector_long_double_const_view gsl_vector_long_double_const_view_array (const(real)* v, size_t n);
_gsl_vector_long_double_const_view gsl_vector_long_double_const_view_array_with_stride (const(real)* base, size_t stride, size_t n);
_gsl_vector_long_double_view gsl_vector_long_double_subvector (gsl_vector_long_double* v, size_t i, size_t n);
_gsl_vector_long_double_view gsl_vector_long_double_subvector_with_stride (gsl_vector_long_double* v, size_t i, size_t stride, size_t n);
_gsl_vector_long_double_const_view gsl_vector_long_double_const_subvector (const(gsl_vector_long_double)* v, size_t i, size_t n);
_gsl_vector_long_double_const_view gsl_vector_long_double_const_subvector_with_stride (const(gsl_vector_long_double)* v, size_t i, size_t stride, size_t n);
void gsl_vector_long_double_set_zero (gsl_vector_long_double* v);
void gsl_vector_long_double_set_all (gsl_vector_long_double* v, real x);
int gsl_vector_long_double_set_basis (gsl_vector_long_double* v, size_t i);
int gsl_vector_long_double_fread (FILE* stream, gsl_vector_long_double* v);
int gsl_vector_long_double_fwrite (FILE* stream, const(gsl_vector_long_double)* v);
int gsl_vector_long_double_fscanf (FILE* stream, gsl_vector_long_double* v);
int gsl_vector_long_double_fprintf (FILE* stream, const(gsl_vector_long_double)* v, const(char)* format);
int gsl_vector_long_double_memcpy (gsl_vector_long_double* dest, const(gsl_vector_long_double)* src);
int gsl_vector_long_double_reverse (gsl_vector_long_double* v);
int gsl_vector_long_double_swap (gsl_vector_long_double* v, gsl_vector_long_double* w);
int gsl_vector_long_double_swap_elements (gsl_vector_long_double* v, const size_t i, const size_t j);
real gsl_vector_long_double_max (const(gsl_vector_long_double)* v);
real gsl_vector_long_double_min (const(gsl_vector_long_double)* v);
void gsl_vector_long_double_minmax (const(gsl_vector_long_double)* v, real* min_out, real* max_out);
size_t gsl_vector_long_double_max_index (const(gsl_vector_long_double)* v);
size_t gsl_vector_long_double_min_index (const(gsl_vector_long_double)* v);
void gsl_vector_long_double_minmax_index (const(gsl_vector_long_double)* v, size_t* imin, size_t* imax);
int gsl_vector_long_double_add (gsl_vector_long_double* a, const(gsl_vector_long_double)* b);
int gsl_vector_long_double_sub (gsl_vector_long_double* a, const(gsl_vector_long_double)* b);
int gsl_vector_long_double_mul (gsl_vector_long_double* a, const(gsl_vector_long_double)* b);
int gsl_vector_long_double_div (gsl_vector_long_double* a, const(gsl_vector_long_double)* b);
int gsl_vector_long_double_scale (gsl_vector_long_double* a, const double x);
int gsl_vector_long_double_add_constant (gsl_vector_long_double* a, const double x);
int gsl_vector_long_double_equal (const(gsl_vector_long_double)* u, const(gsl_vector_long_double)* v);
int gsl_vector_long_double_isnull (const(gsl_vector_long_double)* v);
int gsl_vector_long_double_ispos (const(gsl_vector_long_double)* v);
int gsl_vector_long_double_isneg (const(gsl_vector_long_double)* v);
int gsl_vector_long_double_isnonneg (const(gsl_vector_long_double)* v);
real gsl_vector_long_double_get (const(gsl_vector_long_double)* v, const size_t i);
void gsl_vector_long_double_set (gsl_vector_long_double* v, const size_t i, real x);
real* gsl_vector_long_double_ptr (gsl_vector_long_double* v, const size_t i);
const(real)* gsl_vector_long_double_const_ptr (const(gsl_vector_long_double)* v, const size_t i);

//gsl_vector_short
struct gsl_vector_short
{
    size_t size;
    size_t stride;
    short* data;
    gsl_block_short* block;
    int owner;
}

struct _gsl_vector_short_view
{
  gsl_vector_short vector;
}

struct _gsl_vector_short_const_view
{
  gsl_vector_short vector;
}


alias _gsl_vector_short_view gsl_vector_short_view;
alias const _gsl_vector_short_const_view gsl_vector_short_const_view;

gsl_vector_short* gsl_vector_short_alloc (const size_t n);
gsl_vector_short* gsl_vector_short_calloc (const size_t n);
gsl_vector_short* gsl_vector_short_alloc_from_block (gsl_block_short* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_short* gsl_vector_short_alloc_from_vector (gsl_vector_short* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_short_free (gsl_vector_short* v);
_gsl_vector_short_view gsl_vector_short_view_array (short* v, size_t n);
_gsl_vector_short_view gsl_vector_short_view_array_with_stride (short* base, size_t stride, size_t n);
_gsl_vector_short_const_view gsl_vector_short_const_view_array (const(short)* v, size_t n);
_gsl_vector_short_const_view gsl_vector_short_const_view_array_with_stride (const(short)* base, size_t stride, size_t n);
_gsl_vector_short_view gsl_vector_short_subvector (gsl_vector_short* v, size_t i, size_t n);
_gsl_vector_short_view gsl_vector_short_subvector_with_stride (gsl_vector_short* v, size_t i, size_t stride, size_t n);
_gsl_vector_short_const_view gsl_vector_short_const_subvector (const(gsl_vector_short)* v, size_t i, size_t n);
_gsl_vector_short_const_view gsl_vector_short_const_subvector_with_stride (const(gsl_vector_short)* v, size_t i, size_t stride, size_t n);
void gsl_vector_short_set_zero (gsl_vector_short* v);
void gsl_vector_short_set_all (gsl_vector_short* v, short x);
int gsl_vector_short_set_basis (gsl_vector_short* v, size_t i);
int gsl_vector_short_fread (FILE* stream, gsl_vector_short* v);
int gsl_vector_short_fwrite (FILE* stream, const(gsl_vector_short)* v);
int gsl_vector_short_fscanf (FILE* stream, gsl_vector_short* v);
int gsl_vector_short_fprintf (FILE* stream, const(gsl_vector_short)* v, const(char)* format);
int gsl_vector_short_memcpy (gsl_vector_short* dest, const(gsl_vector_short)* src);
int gsl_vector_short_reverse (gsl_vector_short* v);
int gsl_vector_short_swap (gsl_vector_short* v, gsl_vector_short* w);
int gsl_vector_short_swap_elements (gsl_vector_short* v, const size_t i, const size_t j);
short gsl_vector_short_max (const(gsl_vector_short)* v);
short gsl_vector_short_min (const(gsl_vector_short)* v);
void gsl_vector_short_minmax (const(gsl_vector_short)* v, short* min_out, short* max_out);
size_t gsl_vector_short_max_index (const(gsl_vector_short)* v);
size_t gsl_vector_short_min_index (const(gsl_vector_short)* v);
void gsl_vector_short_minmax_index (const(gsl_vector_short)* v, size_t* imin, size_t* imax);
int gsl_vector_short_add (gsl_vector_short* a, const(gsl_vector_short)* b);
int gsl_vector_short_sub (gsl_vector_short* a, const(gsl_vector_short)* b);
int gsl_vector_short_mul (gsl_vector_short* a, const(gsl_vector_short)* b);
int gsl_vector_short_div (gsl_vector_short* a, const(gsl_vector_short)* b);
int gsl_vector_short_scale (gsl_vector_short* a, const double x);
int gsl_vector_short_add_constant (gsl_vector_short* a, const double x);
int gsl_vector_short_equal (const(gsl_vector_short)* u, const(gsl_vector_short)* v);
int gsl_vector_short_isnull (const(gsl_vector_short)* v);
int gsl_vector_short_ispos (const(gsl_vector_short)* v);
int gsl_vector_short_isneg (const(gsl_vector_short)* v);
int gsl_vector_short_isnonneg (const(gsl_vector_short)* v);
short gsl_vector_short_get (const(gsl_vector_short)* v, const size_t i);
void gsl_vector_short_set (gsl_vector_short* v, const size_t i, short x);
short* gsl_vector_short_ptr (gsl_vector_short* v, const size_t i);
const(short)* gsl_vector_short_const_ptr (const(gsl_vector_short)* v, const size_t i);


//gsl_vector_uchar
struct gsl_vector_uchar
{
    size_t size;
    size_t stride;
    ubyte* data;
    gsl_block_uchar* block;
    int owner;
}

struct _gsl_vector_uchar_view
{
  gsl_vector_uchar vector;
}

struct _gsl_vector_uchar_const_view
{
  gsl_vector_uchar vector;
}

alias _gsl_vector_uchar_view gsl_vector_uchar_view;
alias const _gsl_vector_uchar_const_view gsl_vector_uchar_const_view;

gsl_vector_uchar* gsl_vector_uchar_alloc (const size_t n);
gsl_vector_uchar* gsl_vector_uchar_calloc (const size_t n);
gsl_vector_uchar* gsl_vector_uchar_alloc_from_block (gsl_block_uchar* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_uchar* gsl_vector_uchar_alloc_from_vector (gsl_vector_uchar* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_uchar_free (gsl_vector_uchar* v);
_gsl_vector_uchar_view gsl_vector_uchar_view_array (ubyte* v, size_t n);
_gsl_vector_uchar_view gsl_vector_uchar_view_array_with_stride (ubyte* base, size_t stride, size_t n);
_gsl_vector_uchar_const_view gsl_vector_uchar_const_view_array (const(ubyte)* v, size_t n);
_gsl_vector_uchar_const_view gsl_vector_uchar_const_view_array_with_stride (const(ubyte)* base, size_t stride, size_t n);
_gsl_vector_uchar_view gsl_vector_uchar_subvector (gsl_vector_uchar* v, size_t i, size_t n);
_gsl_vector_uchar_view gsl_vector_uchar_subvector_with_stride (gsl_vector_uchar* v, size_t i, size_t stride, size_t n);
_gsl_vector_uchar_const_view gsl_vector_uchar_const_subvector (const(gsl_vector_uchar)* v, size_t i, size_t n);
_gsl_vector_uchar_const_view gsl_vector_uchar_const_subvector_with_stride (const(gsl_vector_uchar)* v, size_t i, size_t stride, size_t n);
void gsl_vector_uchar_set_zero (gsl_vector_uchar* v);
void gsl_vector_uchar_set_all (gsl_vector_uchar* v, ubyte x);
int gsl_vector_uchar_set_basis (gsl_vector_uchar* v, size_t i);
int gsl_vector_uchar_fread (FILE* stream, gsl_vector_uchar* v);
int gsl_vector_uchar_fwrite (FILE* stream, const(gsl_vector_uchar)* v);
int gsl_vector_uchar_fscanf (FILE* stream, gsl_vector_uchar* v);
int gsl_vector_uchar_fprintf (FILE* stream, const(gsl_vector_uchar)* v, const(char)* format);
int gsl_vector_uchar_memcpy (gsl_vector_uchar* dest, const(gsl_vector_uchar)* src);
int gsl_vector_uchar_reverse (gsl_vector_uchar* v);
int gsl_vector_uchar_swap (gsl_vector_uchar* v, gsl_vector_uchar* w);
int gsl_vector_uchar_swap_elements (gsl_vector_uchar* v, const size_t i, const size_t j);
ubyte gsl_vector_uchar_max (const(gsl_vector_uchar)* v);
ubyte gsl_vector_uchar_min (const(gsl_vector_uchar)* v);
void gsl_vector_uchar_minmax (const(gsl_vector_uchar)* v, ubyte* min_out, ubyte* max_out);
size_t gsl_vector_uchar_max_index (const(gsl_vector_uchar)* v);
size_t gsl_vector_uchar_min_index (const(gsl_vector_uchar)* v);
void gsl_vector_uchar_minmax_index (const(gsl_vector_uchar)* v, size_t* imin, size_t* imax);
int gsl_vector_uchar_add (gsl_vector_uchar* a, const(gsl_vector_uchar)* b);
int gsl_vector_uchar_sub (gsl_vector_uchar* a, const(gsl_vector_uchar)* b);
int gsl_vector_uchar_mul (gsl_vector_uchar* a, const(gsl_vector_uchar)* b);
int gsl_vector_uchar_div (gsl_vector_uchar* a, const(gsl_vector_uchar)* b);
int gsl_vector_uchar_scale (gsl_vector_uchar* a, const double x);
int gsl_vector_uchar_add_constant (gsl_vector_uchar* a, const double x);
int gsl_vector_uchar_equal (const(gsl_vector_uchar)* u, const(gsl_vector_uchar)* v);
int gsl_vector_uchar_isnull (const(gsl_vector_uchar)* v);
int gsl_vector_uchar_ispos (const(gsl_vector_uchar)* v);
int gsl_vector_uchar_isneg (const(gsl_vector_uchar)* v);
int gsl_vector_uchar_isnonneg (const(gsl_vector_uchar)* v);
ubyte gsl_vector_uchar_get (const(gsl_vector_uchar)* v, const size_t i);
void gsl_vector_uchar_set (gsl_vector_uchar* v, const size_t i, ubyte x);
ubyte* gsl_vector_uchar_ptr (gsl_vector_uchar* v, const size_t i);
const(ubyte)* gsl_vector_uchar_const_ptr (const(gsl_vector_uchar)* v, const size_t i);


//gsl_vector_uint
struct gsl_vector_uint
{
    size_t size;
    size_t stride;
    uint* data;
    gsl_block_uint* block;
    int owner;
}

struct _gsl_vector_uint_view
{
  gsl_vector_uint vector;
}

struct _gsl_vector_uint_const_view
{
  gsl_vector_uint vector;
}

alias _gsl_vector_uint_view gsl_vector_uint_view;
alias const _gsl_vector_uint_const_view gsl_vector_uint_const_view;


gsl_vector_uint* gsl_vector_uint_alloc (const size_t n);
gsl_vector_uint* gsl_vector_uint_calloc (const size_t n);
gsl_vector_uint* gsl_vector_uint_alloc_from_block (gsl_block_uint* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_uint* gsl_vector_uint_alloc_from_vector (gsl_vector_uint* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_uint_free (gsl_vector_uint* v);
_gsl_vector_uint_view gsl_vector_uint_view_array (uint* v, size_t n);
_gsl_vector_uint_view gsl_vector_uint_view_array_with_stride (uint* base, size_t stride, size_t n);
_gsl_vector_uint_const_view gsl_vector_uint_const_view_array (const(uint)* v, size_t n);
_gsl_vector_uint_const_view gsl_vector_uint_const_view_array_with_stride (const(uint)* base, size_t stride, size_t n);
_gsl_vector_uint_view gsl_vector_uint_subvector (gsl_vector_uint* v, size_t i, size_t n);
_gsl_vector_uint_view gsl_vector_uint_subvector_with_stride (gsl_vector_uint* v, size_t i, size_t stride, size_t n);
_gsl_vector_uint_const_view gsl_vector_uint_const_subvector (const(gsl_vector_uint)* v, size_t i, size_t n);
_gsl_vector_uint_const_view gsl_vector_uint_const_subvector_with_stride (const(gsl_vector_uint)* v, size_t i, size_t stride, size_t n);
void gsl_vector_uint_set_zero (gsl_vector_uint* v);
void gsl_vector_uint_set_all (gsl_vector_uint* v, uint x);
int gsl_vector_uint_set_basis (gsl_vector_uint* v, size_t i);
int gsl_vector_uint_fread (FILE* stream, gsl_vector_uint* v);
int gsl_vector_uint_fwrite (FILE* stream, const(gsl_vector_uint)* v);
int gsl_vector_uint_fscanf (FILE* stream, gsl_vector_uint* v);
int gsl_vector_uint_fprintf (FILE* stream, const(gsl_vector_uint)* v, const(char)* format);
int gsl_vector_uint_memcpy (gsl_vector_uint* dest, const(gsl_vector_uint)* src);
int gsl_vector_uint_reverse (gsl_vector_uint* v);
int gsl_vector_uint_swap (gsl_vector_uint* v, gsl_vector_uint* w);
int gsl_vector_uint_swap_elements (gsl_vector_uint* v, const size_t i, const size_t j);
uint gsl_vector_uint_max (const(gsl_vector_uint)* v);
uint gsl_vector_uint_min (const(gsl_vector_uint)* v);
void gsl_vector_uint_minmax (const(gsl_vector_uint)* v, uint* min_out, uint* max_out);
size_t gsl_vector_uint_max_index (const(gsl_vector_uint)* v);
size_t gsl_vector_uint_min_index (const(gsl_vector_uint)* v);
void gsl_vector_uint_minmax_index (const(gsl_vector_uint)* v, size_t* imin, size_t* imax);
int gsl_vector_uint_add (gsl_vector_uint* a, const(gsl_vector_uint)* b);
int gsl_vector_uint_sub (gsl_vector_uint* a, const(gsl_vector_uint)* b);
int gsl_vector_uint_mul (gsl_vector_uint* a, const(gsl_vector_uint)* b);
int gsl_vector_uint_div (gsl_vector_uint* a, const(gsl_vector_uint)* b);
int gsl_vector_uint_scale (gsl_vector_uint* a, const double x);
int gsl_vector_uint_add_constant (gsl_vector_uint* a, const double x);
int gsl_vector_uint_equal (const(gsl_vector_uint)* u, const(gsl_vector_uint)* v);
int gsl_vector_uint_isnull (const(gsl_vector_uint)* v);
int gsl_vector_uint_ispos (const(gsl_vector_uint)* v);
int gsl_vector_uint_isneg (const(gsl_vector_uint)* v);
int gsl_vector_uint_isnonneg (const(gsl_vector_uint)* v);
uint gsl_vector_uint_get (const(gsl_vector_uint)* v, const size_t i);
void gsl_vector_uint_set (gsl_vector_uint* v, const size_t i, uint x);
uint* gsl_vector_uint_ptr (gsl_vector_uint* v, const size_t i);
const(uint)* gsl_vector_uint_const_ptr (const(gsl_vector_uint)* v, const size_t i);

//gsl_vector_ulong
struct gsl_vector_ulong
{
    size_t size;
    size_t stride;
    c_ulong* data;
    gsl_block_ulong* block;
    int owner;
}

struct _gsl_vector_ulong_view
{
  gsl_vector_ulong vector;
}

struct _gsl_vector_ulong_const_view
{
  gsl_vector_ulong vector;
}

alias _gsl_vector_ulong_view gsl_vector_ulong_view;
alias const _gsl_vector_ulong_const_view gsl_vector_ulong_const_view;

gsl_vector_ulong* gsl_vector_ulong_alloc (const size_t n);
gsl_vector_ulong* gsl_vector_ulong_calloc (const size_t n);
gsl_vector_ulong* gsl_vector_ulong_alloc_from_block (gsl_block_ulong* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_ulong* gsl_vector_ulong_alloc_from_vector (gsl_vector_ulong* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_ulong_free (gsl_vector_ulong* v);
_gsl_vector_ulong_view gsl_vector_ulong_view_array (c_ulong* v, size_t n);
_gsl_vector_ulong_view gsl_vector_ulong_view_array_with_stride (c_ulong* base, size_t stride, size_t n);
_gsl_vector_ulong_const_view gsl_vector_ulong_const_view_array (const(c_ulong)* v, size_t n);
_gsl_vector_ulong_const_view gsl_vector_ulong_const_view_array_with_stride (const(c_ulong)* base, size_t stride, size_t n);
_gsl_vector_ulong_view gsl_vector_ulong_subvector (gsl_vector_ulong* v, size_t i, size_t n);
_gsl_vector_ulong_view gsl_vector_ulong_subvector_with_stride (gsl_vector_ulong* v, size_t i, size_t stride, size_t n);
_gsl_vector_ulong_const_view gsl_vector_ulong_const_subvector (const(gsl_vector_ulong)* v, size_t i, size_t n);
_gsl_vector_ulong_const_view gsl_vector_ulong_const_subvector_with_stride (const(gsl_vector_ulong)* v, size_t i, size_t stride, size_t n);
void gsl_vector_ulong_set_zero (gsl_vector_ulong* v);
void gsl_vector_ulong_set_all (gsl_vector_ulong* v, c_ulong x);
int gsl_vector_ulong_set_basis (gsl_vector_ulong* v, size_t i);
int gsl_vector_ulong_fread (FILE* stream, gsl_vector_ulong* v);
int gsl_vector_ulong_fwrite (FILE* stream, const(gsl_vector_ulong)* v);
int gsl_vector_ulong_fscanf (FILE* stream, gsl_vector_ulong* v);
int gsl_vector_ulong_fprintf (FILE* stream, const(gsl_vector_ulong)* v, const(char)* format);
int gsl_vector_ulong_memcpy (gsl_vector_ulong* dest, const(gsl_vector_ulong)* src);
int gsl_vector_ulong_reverse (gsl_vector_ulong* v);
int gsl_vector_ulong_swap (gsl_vector_ulong* v, gsl_vector_ulong* w);
int gsl_vector_ulong_swap_elements (gsl_vector_ulong* v, const size_t i, const size_t j);
c_ulong gsl_vector_ulong_max (const(gsl_vector_ulong)* v);
c_ulong gsl_vector_ulong_min (const(gsl_vector_ulong)* v);
void gsl_vector_ulong_minmax (const(gsl_vector_ulong)* v, c_ulong* min_out, c_ulong* max_out);
size_t gsl_vector_ulong_max_index (const(gsl_vector_ulong)* v);
size_t gsl_vector_ulong_min_index (const(gsl_vector_ulong)* v);
void gsl_vector_ulong_minmax_index (const(gsl_vector_ulong)* v, size_t* imin, size_t* imax);
int gsl_vector_ulong_add (gsl_vector_ulong* a, const(gsl_vector_ulong)* b);
int gsl_vector_ulong_sub (gsl_vector_ulong* a, const(gsl_vector_ulong)* b);
int gsl_vector_ulong_mul (gsl_vector_ulong* a, const(gsl_vector_ulong)* b);
int gsl_vector_ulong_div (gsl_vector_ulong* a, const(gsl_vector_ulong)* b);
int gsl_vector_ulong_scale (gsl_vector_ulong* a, const double x);
int gsl_vector_ulong_add_constant (gsl_vector_ulong* a, const double x);
int gsl_vector_ulong_equal (const(gsl_vector_ulong)* u, const(gsl_vector_ulong)* v);
int gsl_vector_ulong_isnull (const(gsl_vector_ulong)* v);
int gsl_vector_ulong_ispos (const(gsl_vector_ulong)* v);
int gsl_vector_ulong_isneg (const(gsl_vector_ulong)* v);
int gsl_vector_ulong_isnonneg (const(gsl_vector_ulong)* v);
c_ulong gsl_vector_ulong_get (const(gsl_vector_ulong)* v, const size_t i);
void gsl_vector_ulong_set (gsl_vector_ulong* v, const size_t i, c_ulong x);
c_ulong* gsl_vector_ulong_ptr (gsl_vector_ulong* v, const size_t i);
const(c_ulong)* gsl_vector_ulong_const_ptr (const(gsl_vector_ulong)* v, const size_t i);

//gsl_vector_ushort
struct gsl_vector_ushort
{
    size_t size;
    size_t stride;
    ushort* data;
    gsl_block_ushort* block;
    int owner;
}

struct _gsl_vector_ushort_view
{
  gsl_vector_ushort vector;
}


struct _gsl_vector_ushort_const_view
{
  gsl_vector_ushort vector;
}

alias _gsl_vector_ushort_view gsl_vector_ushort_view;
alias const _gsl_vector_ushort_const_view gsl_vector_ushort_const_view;

gsl_vector_ushort* gsl_vector_ushort_alloc (const size_t n);
gsl_vector_ushort* gsl_vector_ushort_calloc (const size_t n);
gsl_vector_ushort* gsl_vector_ushort_alloc_from_block (gsl_block_ushort* b, const size_t offset, const size_t n, const size_t stride);
gsl_vector_ushort* gsl_vector_ushort_alloc_from_vector (gsl_vector_ushort* v, const size_t offset, const size_t n, const size_t stride);
void gsl_vector_ushort_free (gsl_vector_ushort* v);
_gsl_vector_ushort_view gsl_vector_ushort_view_array (ushort* v, size_t n);
_gsl_vector_ushort_view gsl_vector_ushort_view_array_with_stride (ushort* base, size_t stride, size_t n);
_gsl_vector_ushort_const_view gsl_vector_ushort_const_view_array (const(ushort)* v, size_t n);
_gsl_vector_ushort_const_view gsl_vector_ushort_const_view_array_with_stride (const(ushort)* base, size_t stride, size_t n);
_gsl_vector_ushort_view gsl_vector_ushort_subvector (gsl_vector_ushort* v, size_t i, size_t n);
_gsl_vector_ushort_view gsl_vector_ushort_subvector_with_stride (gsl_vector_ushort* v, size_t i, size_t stride, size_t n);
_gsl_vector_ushort_const_view gsl_vector_ushort_const_subvector (const(gsl_vector_ushort)* v, size_t i, size_t n);
_gsl_vector_ushort_const_view gsl_vector_ushort_const_subvector_with_stride (const(gsl_vector_ushort)* v, size_t i, size_t stride, size_t n);
void gsl_vector_ushort_set_zero (gsl_vector_ushort* v);
void gsl_vector_ushort_set_all (gsl_vector_ushort* v, ushort x);
int gsl_vector_ushort_set_basis (gsl_vector_ushort* v, size_t i);
int gsl_vector_ushort_fread (FILE* stream, gsl_vector_ushort* v);
int gsl_vector_ushort_fwrite (FILE* stream, const(gsl_vector_ushort)* v);
int gsl_vector_ushort_fscanf (FILE* stream, gsl_vector_ushort* v);
int gsl_vector_ushort_fprintf (FILE* stream, const(gsl_vector_ushort)* v, const(char)* format);
int gsl_vector_ushort_memcpy (gsl_vector_ushort* dest, const(gsl_vector_ushort)* src);
int gsl_vector_ushort_reverse (gsl_vector_ushort* v);
int gsl_vector_ushort_swap (gsl_vector_ushort* v, gsl_vector_ushort* w);
int gsl_vector_ushort_swap_elements (gsl_vector_ushort* v, const size_t i, const size_t j);
ushort gsl_vector_ushort_max (const(gsl_vector_ushort)* v);
ushort gsl_vector_ushort_min (const(gsl_vector_ushort)* v);
void gsl_vector_ushort_minmax (const(gsl_vector_ushort)* v, ushort* min_out, ushort* max_out);
size_t gsl_vector_ushort_max_index (const(gsl_vector_ushort)* v);
size_t gsl_vector_ushort_min_index (const(gsl_vector_ushort)* v);
void gsl_vector_ushort_minmax_index (const(gsl_vector_ushort)* v, size_t* imin, size_t* imax);
int gsl_vector_ushort_add (gsl_vector_ushort* a, const(gsl_vector_ushort)* b);
int gsl_vector_ushort_sub (gsl_vector_ushort* a, const(gsl_vector_ushort)* b);
int gsl_vector_ushort_mul (gsl_vector_ushort* a, const(gsl_vector_ushort)* b);
int gsl_vector_ushort_div (gsl_vector_ushort* a, const(gsl_vector_ushort)* b);
int gsl_vector_ushort_scale (gsl_vector_ushort* a, const double x);
int gsl_vector_ushort_add_constant (gsl_vector_ushort* a, const double x);
int gsl_vector_ushort_equal (const(gsl_vector_ushort)* u, const(gsl_vector_ushort)* v);
int gsl_vector_ushort_isnull (const(gsl_vector_ushort)* v);
int gsl_vector_ushort_ispos (const(gsl_vector_ushort)* v);
int gsl_vector_ushort_isneg (const(gsl_vector_ushort)* v);
int gsl_vector_ushort_isnonneg (const(gsl_vector_ushort)* v);
ushort gsl_vector_ushort_get (const(gsl_vector_ushort)* v, const size_t i);
void gsl_vector_ushort_set (gsl_vector_ushort* v, const size_t i, ushort x);
ushort* gsl_vector_ushort_ptr (gsl_vector_ushort* v, const size_t i);
const(ushort)* gsl_vector_ushort_const_ptr (const(gsl_vector_ushort)* v, const size_t i);

















