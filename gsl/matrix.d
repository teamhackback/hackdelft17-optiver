/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.matrix;

import core.stdc.stdio : FILE;
import core.stdc.config : c_long, c_ulong;
//import core.stdc.complex;
import gsl.errno;
import gsl.check_range;
import gsl.block;
import gsl.vector;
import gsl.complex;

extern (C):


// gsl_matrix_char
struct gsl_matrix_char
{
    size_t size1;
    size_t size2;
    size_t tda;
    char* data;
    gsl_block_char* block;
    int owner;
}

struct _gsl_matrix_char_view
{
    gsl_matrix_char matrix;
}

struct _gsl_matrix_char_const_view
{
    gsl_matrix_char matrix;
}

alias _gsl_matrix_char_view gsl_matrix_char_view;
alias const _gsl_matrix_char_const_view gsl_matrix_char_const_view;

gsl_matrix_char* gsl_matrix_char_alloc (const size_t n1, const size_t n2);
gsl_matrix_char* gsl_matrix_char_calloc (const size_t n1, const size_t n2);
gsl_matrix_char* gsl_matrix_char_alloc_from_block (gsl_block_char* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_char* gsl_matrix_char_alloc_from_matrix (gsl_matrix_char* m, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_char* gsl_vector_char_alloc_row_from_matrix (gsl_matrix_char* m, const size_t i);
gsl_vector_char* gsl_vector_char_alloc_col_from_matrix (gsl_matrix_char* m, const size_t j);
void gsl_matrix_char_free (gsl_matrix_char* m);
_gsl_matrix_char_view gsl_matrix_char_submatrix (gsl_matrix_char* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_char_view gsl_matrix_char_row (gsl_matrix_char* m, const size_t i);
_gsl_vector_char_view gsl_matrix_char_column (gsl_matrix_char* m, const size_t j);
_gsl_vector_char_view gsl_matrix_char_diagonal (gsl_matrix_char* m);
_gsl_vector_char_view gsl_matrix_char_subdiagonal (gsl_matrix_char* m, const size_t k);
_gsl_vector_char_view gsl_matrix_char_superdiagonal (gsl_matrix_char* m, const size_t k);
_gsl_vector_char_view gsl_matrix_char_subrow (gsl_matrix_char* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_char_view gsl_matrix_char_subcolumn (gsl_matrix_char* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_char_view gsl_matrix_char_view_array (char* base, const size_t n1, const size_t n2);
_gsl_matrix_char_view gsl_matrix_char_view_array_with_tda (char* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_char_view gsl_matrix_char_view_vector (gsl_vector_char* v, const size_t n1, const size_t n2);
_gsl_matrix_char_view gsl_matrix_char_view_vector_with_tda (gsl_vector_char* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_char_const_view gsl_matrix_char_const_submatrix (const(gsl_matrix_char)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_char_const_view gsl_matrix_char_const_row (const(gsl_matrix_char)* m, const size_t i);
_gsl_vector_char_const_view gsl_matrix_char_const_column (const(gsl_matrix_char)* m, const size_t j);
_gsl_vector_char_const_view gsl_matrix_char_const_diagonal (const(gsl_matrix_char)* m);
_gsl_vector_char_const_view gsl_matrix_char_const_subdiagonal (const(gsl_matrix_char)* m, const size_t k);
_gsl_vector_char_const_view gsl_matrix_char_const_superdiagonal (const(gsl_matrix_char)* m, const size_t k);
_gsl_vector_char_const_view gsl_matrix_char_const_subrow (const(gsl_matrix_char)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_char_const_view gsl_matrix_char_const_subcolumn (const(gsl_matrix_char)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_char_const_view gsl_matrix_char_const_view_array (const(char)* base, const size_t n1, const size_t n2);
_gsl_matrix_char_const_view gsl_matrix_char_const_view_array_with_tda (const(char)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_char_const_view gsl_matrix_char_const_view_vector (const(gsl_vector_char)* v, const size_t n1, const size_t n2);
_gsl_matrix_char_const_view gsl_matrix_char_const_view_vector_with_tda (const(gsl_vector_char)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_char_set_zero (gsl_matrix_char* m);
void gsl_matrix_char_set_identity (gsl_matrix_char* m);
void gsl_matrix_char_set_all (gsl_matrix_char* m, char x);
int gsl_matrix_char_fread (FILE* stream, gsl_matrix_char* m);
int gsl_matrix_char_fwrite (FILE* stream, const(gsl_matrix_char)* m);
int gsl_matrix_char_fscanf (FILE* stream, gsl_matrix_char* m);
int gsl_matrix_char_fprintf (FILE* stream, const(gsl_matrix_char)* m, const(char)* format);
int gsl_matrix_char_memcpy (gsl_matrix_char* dest, const(gsl_matrix_char)* src);
int gsl_matrix_char_swap (gsl_matrix_char* m1, gsl_matrix_char* m2);
int gsl_matrix_char_swap_rows (gsl_matrix_char* m, const size_t i, const size_t j);
int gsl_matrix_char_swap_columns (gsl_matrix_char* m, const size_t i, const size_t j);
int gsl_matrix_char_swap_rowcol (gsl_matrix_char* m, const size_t i, const size_t j);
int gsl_matrix_char_transpose (gsl_matrix_char* m);
int gsl_matrix_char_transpose_memcpy (gsl_matrix_char* dest, const(gsl_matrix_char)* src);
char gsl_matrix_char_max (const(gsl_matrix_char)* m);
char gsl_matrix_char_min (const(gsl_matrix_char)* m);
void gsl_matrix_char_minmax (const(gsl_matrix_char)* m, char* min_out, char* max_out);
void gsl_matrix_char_max_index (const(gsl_matrix_char)* m, size_t* imax, size_t* jmax);
void gsl_matrix_char_min_index (const(gsl_matrix_char)* m, size_t* imin, size_t* jmin);
void gsl_matrix_char_minmax_index (const(gsl_matrix_char)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);
int gsl_matrix_char_equal (const(gsl_matrix_char)* a, const(gsl_matrix_char)* b);
int gsl_matrix_char_isnull (const(gsl_matrix_char)* m);
int gsl_matrix_char_ispos (const(gsl_matrix_char)* m);
int gsl_matrix_char_isneg (const(gsl_matrix_char)* m);
int gsl_matrix_char_isnonneg (const(gsl_matrix_char)* m);
int gsl_matrix_char_add (gsl_matrix_char* a, const(gsl_matrix_char)* b);
int gsl_matrix_char_sub (gsl_matrix_char* a, const(gsl_matrix_char)* b);
int gsl_matrix_char_mul_elements (gsl_matrix_char* a, const(gsl_matrix_char)* b);
int gsl_matrix_char_div_elements (gsl_matrix_char* a, const(gsl_matrix_char)* b);
int gsl_matrix_char_scale (gsl_matrix_char* a, const double x);
int gsl_matrix_char_add_constant (gsl_matrix_char* a, const double x);
int gsl_matrix_char_add_diagonal (gsl_matrix_char* a, const double x);
int gsl_matrix_char_get_row (gsl_vector_char* v, const(gsl_matrix_char)* m, const size_t i);
int gsl_matrix_char_get_col (gsl_vector_char* v, const(gsl_matrix_char)* m, const size_t j);
int gsl_matrix_char_set_row (gsl_matrix_char* m, const size_t i, const(gsl_vector_char)* v);
int gsl_matrix_char_set_col (gsl_matrix_char* m, const size_t j, const(gsl_vector_char)* v);
char gsl_matrix_char_get (const(gsl_matrix_char)* m, const size_t i, const size_t j);
void gsl_matrix_char_set (gsl_matrix_char* m, const size_t i, const size_t j, const char x);
char* gsl_matrix_char_ptr (gsl_matrix_char* m, const size_t i, const size_t j);
const(char)* gsl_matrix_char_const_ptr (const(gsl_matrix_char)* m, const size_t i, const size_t j);


//gsl_matrix_complex
struct gsl_matrix_complex
{
    size_t size1;
    size_t size2;
    size_t tda;
    double* data;
    gsl_block_complex* block;
    int owner;
}

struct _gsl_matrix_complex_view
{
    gsl_matrix_complex matrix;
}

struct _gsl_matrix_complex_const_view
{
    gsl_matrix_complex matrix;
}

alias _gsl_matrix_complex_view gsl_matrix_complex_view;
alias const _gsl_matrix_complex_const_view gsl_matrix_complex_const_view;

gsl_matrix_complex* gsl_matrix_complex_alloc (const size_t n1, const size_t n2);
gsl_matrix_complex* gsl_matrix_complex_calloc (const size_t n1, const size_t n2);
gsl_matrix_complex* gsl_matrix_complex_alloc_from_block (gsl_block_complex* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_complex* gsl_matrix_complex_alloc_from_matrix (gsl_matrix_complex* b, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_complex* gsl_vector_complex_alloc_row_from_matrix (gsl_matrix_complex* m, const size_t i);
gsl_vector_complex* gsl_vector_complex_alloc_col_from_matrix (gsl_matrix_complex* m, const size_t j);
void gsl_matrix_complex_free (gsl_matrix_complex* m);
_gsl_matrix_complex_view gsl_matrix_complex_submatrix (gsl_matrix_complex* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_complex_view gsl_matrix_complex_row (gsl_matrix_complex* m, const size_t i);
_gsl_vector_complex_view gsl_matrix_complex_column (gsl_matrix_complex* m, const size_t j);
_gsl_vector_complex_view gsl_matrix_complex_diagonal (gsl_matrix_complex* m);
_gsl_vector_complex_view gsl_matrix_complex_subdiagonal (gsl_matrix_complex* m, const size_t k);
_gsl_vector_complex_view gsl_matrix_complex_superdiagonal (gsl_matrix_complex* m, const size_t k);
_gsl_vector_complex_view gsl_matrix_complex_subrow (gsl_matrix_complex* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_complex_view gsl_matrix_complex_subcolumn (gsl_matrix_complex* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_complex_view gsl_matrix_complex_view_array (double* base, const size_t n1, const size_t n2);
_gsl_matrix_complex_view gsl_matrix_complex_view_array_with_tda (double* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_complex_view gsl_matrix_complex_view_vector (gsl_vector_complex* v, const size_t n1, const size_t n2);
_gsl_matrix_complex_view gsl_matrix_complex_view_vector_with_tda (gsl_vector_complex* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_complex_const_view gsl_matrix_complex_const_submatrix (const(gsl_matrix_complex)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_complex_const_view gsl_matrix_complex_const_row (const(gsl_matrix_complex)* m, const size_t i);
_gsl_vector_complex_const_view gsl_matrix_complex_const_column (const(gsl_matrix_complex)* m, const size_t j);
_gsl_vector_complex_const_view gsl_matrix_complex_const_diagonal (const(gsl_matrix_complex)* m);
_gsl_vector_complex_const_view gsl_matrix_complex_const_subdiagonal (const(gsl_matrix_complex)* m, const size_t k);
_gsl_vector_complex_const_view gsl_matrix_complex_const_superdiagonal (const(gsl_matrix_complex)* m, const size_t k);
_gsl_vector_complex_const_view gsl_matrix_complex_const_subrow (const(gsl_matrix_complex)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_complex_const_view gsl_matrix_complex_const_subcolumn (const(gsl_matrix_complex)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_complex_const_view gsl_matrix_complex_const_view_array (const(double)* base, const size_t n1, const size_t n2);
_gsl_matrix_complex_const_view gsl_matrix_complex_const_view_array_with_tda (const(double)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_complex_const_view gsl_matrix_complex_const_view_vector (const(gsl_vector_complex)* v, const size_t n1, const size_t n2);
_gsl_matrix_complex_const_view gsl_matrix_complex_const_view_vector_with_tda (const(gsl_vector_complex)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_complex_set_zero (gsl_matrix_complex* m);
void gsl_matrix_complex_set_identity (gsl_matrix_complex* m);
void gsl_matrix_complex_set_all (gsl_matrix_complex* m, gsl_complex x);
int gsl_matrix_complex_fread (FILE* stream, gsl_matrix_complex* m);
int gsl_matrix_complex_fwrite (FILE* stream, const(gsl_matrix_complex)* m);
int gsl_matrix_complex_fscanf (FILE* stream, gsl_matrix_complex* m);
int gsl_matrix_complex_fprintf (FILE* stream, const(gsl_matrix_complex)* m, const(char)* format);
int gsl_matrix_complex_memcpy (gsl_matrix_complex* dest, const(gsl_matrix_complex)* src);
int gsl_matrix_complex_swap (gsl_matrix_complex* m1, gsl_matrix_complex* m2);
int gsl_matrix_complex_swap_rows (gsl_matrix_complex* m, const size_t i, const size_t j);
int gsl_matrix_complex_swap_columns (gsl_matrix_complex* m, const size_t i, const size_t j);
int gsl_matrix_complex_swap_rowcol (gsl_matrix_complex* m, const size_t i, const size_t j);
int gsl_matrix_complex_transpose (gsl_matrix_complex* m);
int gsl_matrix_complex_transpose_memcpy (gsl_matrix_complex* dest, const(gsl_matrix_complex)* src);
int gsl_matrix_complex_equal (const(gsl_matrix_complex)* a, const(gsl_matrix_complex)* b);
int gsl_matrix_complex_isnull (const(gsl_matrix_complex)* m);
int gsl_matrix_complex_ispos (const(gsl_matrix_complex)* m);
int gsl_matrix_complex_isneg (const(gsl_matrix_complex)* m);
int gsl_matrix_complex_isnonneg (const(gsl_matrix_complex)* m);
int gsl_matrix_complex_add (gsl_matrix_complex* a, const(gsl_matrix_complex)* b);
int gsl_matrix_complex_sub (gsl_matrix_complex* a, const(gsl_matrix_complex)* b);
int gsl_matrix_complex_mul_elements (gsl_matrix_complex* a, const(gsl_matrix_complex)* b);
int gsl_matrix_complex_div_elements (gsl_matrix_complex* a, const(gsl_matrix_complex)* b);
int gsl_matrix_complex_scale (gsl_matrix_complex* a, const gsl_complex x);
int gsl_matrix_complex_add_constant (gsl_matrix_complex* a, const gsl_complex x);
int gsl_matrix_complex_add_diagonal (gsl_matrix_complex* a, const gsl_complex x);
int gsl_matrix_complex_get_row (gsl_vector_complex* v, const(gsl_matrix_complex)* m, const size_t i);
int gsl_matrix_complex_get_col (gsl_vector_complex* v, const(gsl_matrix_complex)* m, const size_t j);
int gsl_matrix_complex_set_row (gsl_matrix_complex* m, const size_t i, const(gsl_vector_complex)* v);
int gsl_matrix_complex_set_col (gsl_matrix_complex* m, const size_t j, const(gsl_vector_complex)* v);
gsl_complex gsl_matrix_complex_get (const(gsl_matrix_complex)* m, const size_t i, const size_t j);
void gsl_matrix_complex_set (gsl_matrix_complex* m, const size_t i, const size_t j, const gsl_complex x);
gsl_complex* gsl_matrix_complex_ptr (gsl_matrix_complex* m, const size_t i, const size_t j);
const(gsl_complex)* gsl_matrix_complex_const_ptr (const(gsl_matrix_complex)* m, const size_t i, const size_t j);


//gsl_matrix_complex_float
struct gsl_matrix_complex_float
{
    size_t size1;
    size_t size2;
    size_t tda;
    float* data;
    gsl_block_complex_float* block;
    int owner;
}

struct _gsl_matrix_complex_float_view
{
    gsl_matrix_complex_float matrix;
}

struct _gsl_matrix_complex_float_const_view
{
    gsl_matrix_complex_float matrix;
}

alias _gsl_matrix_complex_float_view gsl_matrix_complex_float_view;
alias const _gsl_matrix_complex_float_const_view gsl_matrix_complex_float_const_view;

gsl_matrix_complex_float* gsl_matrix_complex_float_alloc (const size_t n1, const size_t n2);
gsl_matrix_complex_float* gsl_matrix_complex_float_calloc (const size_t n1, const size_t n2);
gsl_matrix_complex_float* gsl_matrix_complex_float_alloc_from_block (gsl_block_complex_float* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_complex_float* gsl_matrix_complex_float_alloc_from_matrix (gsl_matrix_complex_float* b, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_complex_float* gsl_vector_complex_float_alloc_row_from_matrix (gsl_matrix_complex_float* m, const size_t i);
gsl_vector_complex_float* gsl_vector_complex_float_alloc_col_from_matrix (gsl_matrix_complex_float* m, const size_t j);
void gsl_matrix_complex_float_free (gsl_matrix_complex_float* m);
_gsl_matrix_complex_float_view gsl_matrix_complex_float_submatrix (gsl_matrix_complex_float* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_complex_float_view gsl_matrix_complex_float_row (gsl_matrix_complex_float* m, const size_t i);
_gsl_vector_complex_float_view gsl_matrix_complex_float_column (gsl_matrix_complex_float* m, const size_t j);
_gsl_vector_complex_float_view gsl_matrix_complex_float_diagonal (gsl_matrix_complex_float* m);
_gsl_vector_complex_float_view gsl_matrix_complex_float_subdiagonal (gsl_matrix_complex_float* m, const size_t k);
_gsl_vector_complex_float_view gsl_matrix_complex_float_superdiagonal (gsl_matrix_complex_float* m, const size_t k);
_gsl_vector_complex_float_view gsl_matrix_complex_float_subrow (gsl_matrix_complex_float* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_complex_float_view gsl_matrix_complex_float_subcolumn (gsl_matrix_complex_float* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_complex_float_view gsl_matrix_complex_float_view_array (float* base, const size_t n1, const size_t n2);
_gsl_matrix_complex_float_view gsl_matrix_complex_float_view_array_with_tda (float* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_complex_float_view gsl_matrix_complex_float_view_vector (gsl_vector_complex_float* v, const size_t n1, const size_t n2);
_gsl_matrix_complex_float_view gsl_matrix_complex_float_view_vector_with_tda (gsl_vector_complex_float* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_complex_float_const_view gsl_matrix_complex_float_const_submatrix (const(gsl_matrix_complex_float)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_complex_float_const_view gsl_matrix_complex_float_const_row (const(gsl_matrix_complex_float)* m, const size_t i);
_gsl_vector_complex_float_const_view gsl_matrix_complex_float_const_column (const(gsl_matrix_complex_float)* m, const size_t j);
_gsl_vector_complex_float_const_view gsl_matrix_complex_float_const_diagonal (const(gsl_matrix_complex_float)* m);
_gsl_vector_complex_float_const_view gsl_matrix_complex_float_const_subdiagonal (const(gsl_matrix_complex_float)* m, const size_t k);
_gsl_vector_complex_float_const_view gsl_matrix_complex_float_const_superdiagonal (const(gsl_matrix_complex_float)* m, const size_t k);
_gsl_vector_complex_float_const_view gsl_matrix_complex_float_const_subrow (const(gsl_matrix_complex_float)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_complex_float_const_view gsl_matrix_complex_float_const_subcolumn (const(gsl_matrix_complex_float)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_complex_float_const_view gsl_matrix_complex_float_const_view_array (const(float)* base, const size_t n1, const size_t n2);
_gsl_matrix_complex_float_const_view gsl_matrix_complex_float_const_view_array_with_tda (const(float)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_complex_float_const_view gsl_matrix_complex_float_const_view_vector (const(gsl_vector_complex_float)* v, const size_t n1, const size_t n2);
_gsl_matrix_complex_float_const_view gsl_matrix_complex_float_const_view_vector_with_tda (const(gsl_vector_complex_float)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_complex_float_set_zero (gsl_matrix_complex_float* m);
void gsl_matrix_complex_float_set_identity (gsl_matrix_complex_float* m);
void gsl_matrix_complex_float_set_all (gsl_matrix_complex_float* m, gsl_complex_float x);
int gsl_matrix_complex_float_fread (FILE* stream, gsl_matrix_complex_float* m);
int gsl_matrix_complex_float_fwrite (FILE* stream, const(gsl_matrix_complex_float)* m);
int gsl_matrix_complex_float_fscanf (FILE* stream, gsl_matrix_complex_float* m);
int gsl_matrix_complex_float_fprintf (FILE* stream, const(gsl_matrix_complex_float)* m, const(char)* format);
int gsl_matrix_complex_float_memcpy (gsl_matrix_complex_float* dest, const(gsl_matrix_complex_float)* src);
int gsl_matrix_complex_float_swap (gsl_matrix_complex_float* m1, gsl_matrix_complex_float* m2);
int gsl_matrix_complex_float_swap_rows (gsl_matrix_complex_float* m, const size_t i, const size_t j);
int gsl_matrix_complex_float_swap_columns (gsl_matrix_complex_float* m, const size_t i, const size_t j);
int gsl_matrix_complex_float_swap_rowcol (gsl_matrix_complex_float* m, const size_t i, const size_t j);
int gsl_matrix_complex_float_transpose (gsl_matrix_complex_float* m);
int gsl_matrix_complex_float_transpose_memcpy (gsl_matrix_complex_float* dest, const(gsl_matrix_complex_float)* src);
int gsl_matrix_complex_float_equal (const(gsl_matrix_complex_float)* a, const(gsl_matrix_complex_float)* b);
int gsl_matrix_complex_float_isnull (const(gsl_matrix_complex_float)* m);
int gsl_matrix_complex_float_ispos (const(gsl_matrix_complex_float)* m);
int gsl_matrix_complex_float_isneg (const(gsl_matrix_complex_float)* m);
int gsl_matrix_complex_float_isnonneg (const(gsl_matrix_complex_float)* m);
int gsl_matrix_complex_float_add (gsl_matrix_complex_float* a, const(gsl_matrix_complex_float)* b);
int gsl_matrix_complex_float_sub (gsl_matrix_complex_float* a, const(gsl_matrix_complex_float)* b);
int gsl_matrix_complex_float_mul_elements (gsl_matrix_complex_float* a, const(gsl_matrix_complex_float)* b);
int gsl_matrix_complex_float_div_elements (gsl_matrix_complex_float* a, const(gsl_matrix_complex_float)* b);
int gsl_matrix_complex_float_scale (gsl_matrix_complex_float* a, const gsl_complex_float x);
int gsl_matrix_complex_float_add_constant (gsl_matrix_complex_float* a, const gsl_complex_float x);
int gsl_matrix_complex_float_add_diagonal (gsl_matrix_complex_float* a, const gsl_complex_float x);
int gsl_matrix_complex_float_get_row (gsl_vector_complex_float* v, const(gsl_matrix_complex_float)* m, const size_t i);
int gsl_matrix_complex_float_get_col (gsl_vector_complex_float* v, const(gsl_matrix_complex_float)* m, const size_t j);
int gsl_matrix_complex_float_set_row (gsl_matrix_complex_float* m, const size_t i, const(gsl_vector_complex_float)* v);
int gsl_matrix_complex_float_set_col (gsl_matrix_complex_float* m, const size_t j, const(gsl_vector_complex_float)* v);
gsl_complex_float gsl_matrix_complex_float_get (const(gsl_matrix_complex_float)* m, const size_t i, const size_t j);
void gsl_matrix_complex_float_set (gsl_matrix_complex_float* m, const size_t i, const size_t j, const gsl_complex_float x);
gsl_complex_float* gsl_matrix_complex_float_ptr (gsl_matrix_complex_float* m, const size_t i, const size_t j);
const(gsl_complex_float)* gsl_matrix_complex_float_const_ptr (const(gsl_matrix_complex_float)* m, const size_t i, const size_t j);


//gsl_matrix_complex_long_double
struct gsl_matrix_complex_long_double
{
    size_t size1;
    size_t size2;
    size_t tda;
    real* data;
    gsl_block_complex_long_double* block;
    int owner;
}

struct _gsl_matrix_complex_long_double_view
{
    gsl_matrix_complex_long_double matrix;
}

struct _gsl_matrix_complex_long_double_const_view
{
    gsl_matrix_complex_long_double matrix;
}

alias _gsl_matrix_complex_long_double_view gsl_matrix_complex_long_double_view;
alias const _gsl_matrix_complex_long_double_const_view gsl_matrix_complex_long_double_const_view;

gsl_matrix_complex_long_double* gsl_matrix_complex_long_double_alloc (const size_t n1, const size_t n2);
gsl_matrix_complex_long_double* gsl_matrix_complex_long_double_calloc (const size_t n1, const size_t n2);
gsl_matrix_complex_long_double* gsl_matrix_complex_long_double_alloc_from_block (gsl_block_complex_long_double* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_complex_long_double* gsl_matrix_complex_long_double_alloc_from_matrix (gsl_matrix_complex_long_double* b, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_complex_long_double* gsl_vector_complex_long_double_alloc_row_from_matrix (gsl_matrix_complex_long_double* m, const size_t i);
gsl_vector_complex_long_double* gsl_vector_complex_long_double_alloc_col_from_matrix (gsl_matrix_complex_long_double* m, const size_t j);
void gsl_matrix_complex_long_double_free (gsl_matrix_complex_long_double* m);
_gsl_matrix_complex_long_double_view gsl_matrix_complex_long_double_submatrix (gsl_matrix_complex_long_double* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_complex_long_double_view gsl_matrix_complex_long_double_row (gsl_matrix_complex_long_double* m, const size_t i);
_gsl_vector_complex_long_double_view gsl_matrix_complex_long_double_column (gsl_matrix_complex_long_double* m, const size_t j);
_gsl_vector_complex_long_double_view gsl_matrix_complex_long_double_diagonal (gsl_matrix_complex_long_double* m);
_gsl_vector_complex_long_double_view gsl_matrix_complex_long_double_subdiagonal (gsl_matrix_complex_long_double* m, const size_t k);
_gsl_vector_complex_long_double_view gsl_matrix_complex_long_double_superdiagonal (gsl_matrix_complex_long_double* m, const size_t k);
_gsl_vector_complex_long_double_view gsl_matrix_complex_long_double_subrow (gsl_matrix_complex_long_double* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_complex_long_double_view gsl_matrix_complex_long_double_subcolumn (gsl_matrix_complex_long_double* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_complex_long_double_view gsl_matrix_complex_long_double_view_array (real* base, const size_t n1, const size_t n2);
_gsl_matrix_complex_long_double_view gsl_matrix_complex_long_double_view_array_with_tda (real* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_complex_long_double_view gsl_matrix_complex_long_double_view_vector (gsl_vector_complex_long_double* v, const size_t n1, const size_t n2);
_gsl_matrix_complex_long_double_view gsl_matrix_complex_long_double_view_vector_with_tda (gsl_vector_complex_long_double* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_complex_long_double_const_view gsl_matrix_complex_long_double_const_submatrix (const(gsl_matrix_complex_long_double)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_complex_long_double_const_view gsl_matrix_complex_long_double_const_row (const(gsl_matrix_complex_long_double)* m, const size_t i);
_gsl_vector_complex_long_double_const_view gsl_matrix_complex_long_double_const_column (const(gsl_matrix_complex_long_double)* m, const size_t j);
_gsl_vector_complex_long_double_const_view gsl_matrix_complex_long_double_const_diagonal (const(gsl_matrix_complex_long_double)* m);
_gsl_vector_complex_long_double_const_view gsl_matrix_complex_long_double_const_subdiagonal (const(gsl_matrix_complex_long_double)* m, const size_t k);
_gsl_vector_complex_long_double_const_view gsl_matrix_complex_long_double_const_superdiagonal (const(gsl_matrix_complex_long_double)* m, const size_t k);
_gsl_vector_complex_long_double_const_view gsl_matrix_complex_long_double_const_subrow (const(gsl_matrix_complex_long_double)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_complex_long_double_const_view gsl_matrix_complex_long_double_const_subcolumn (const(gsl_matrix_complex_long_double)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_complex_long_double_const_view gsl_matrix_complex_long_double_const_view_array (const(real)* base, const size_t n1, const size_t n2);
_gsl_matrix_complex_long_double_const_view gsl_matrix_complex_long_double_const_view_array_with_tda (const(real)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_complex_long_double_const_view gsl_matrix_complex_long_double_const_view_vector (const(gsl_vector_complex_long_double)* v, const size_t n1, const size_t n2);
_gsl_matrix_complex_long_double_const_view gsl_matrix_complex_long_double_const_view_vector_with_tda (const(gsl_vector_complex_long_double)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_complex_long_double_set_zero (gsl_matrix_complex_long_double* m);
void gsl_matrix_complex_long_double_set_identity (gsl_matrix_complex_long_double* m);
void gsl_matrix_complex_long_double_set_all (gsl_matrix_complex_long_double* m, gsl_complex_long_double x);
int gsl_matrix_complex_long_double_fread (FILE* stream, gsl_matrix_complex_long_double* m);
int gsl_matrix_complex_long_double_fwrite (FILE* stream, const(gsl_matrix_complex_long_double)* m);
int gsl_matrix_complex_long_double_fscanf (FILE* stream, gsl_matrix_complex_long_double* m);
int gsl_matrix_complex_long_double_fprintf (FILE* stream, const(gsl_matrix_complex_long_double)* m, const(char)* format);
int gsl_matrix_complex_long_double_memcpy (gsl_matrix_complex_long_double* dest, const(gsl_matrix_complex_long_double)* src);
int gsl_matrix_complex_long_double_swap (gsl_matrix_complex_long_double* m1, gsl_matrix_complex_long_double* m2);
int gsl_matrix_complex_long_double_swap_rows (gsl_matrix_complex_long_double* m, const size_t i, const size_t j);
int gsl_matrix_complex_long_double_swap_columns (gsl_matrix_complex_long_double* m, const size_t i, const size_t j);
int gsl_matrix_complex_long_double_swap_rowcol (gsl_matrix_complex_long_double* m, const size_t i, const size_t j);
int gsl_matrix_complex_long_double_transpose (gsl_matrix_complex_long_double* m);
int gsl_matrix_complex_long_double_transpose_memcpy (gsl_matrix_complex_long_double* dest, const(gsl_matrix_complex_long_double)* src);
int gsl_matrix_complex_long_double_equal (const(gsl_matrix_complex_long_double)* a, const(gsl_matrix_complex_long_double)* b);
int gsl_matrix_complex_long_double_isnull (const(gsl_matrix_complex_long_double)* m);
int gsl_matrix_complex_long_double_ispos (const(gsl_matrix_complex_long_double)* m);
int gsl_matrix_complex_long_double_isneg (const(gsl_matrix_complex_long_double)* m);
int gsl_matrix_complex_long_double_isnonneg (const(gsl_matrix_complex_long_double)* m);
int gsl_matrix_complex_long_double_add (gsl_matrix_complex_long_double* a, const(gsl_matrix_complex_long_double)* b);
int gsl_matrix_complex_long_double_sub (gsl_matrix_complex_long_double* a, const(gsl_matrix_complex_long_double)* b);
int gsl_matrix_complex_long_double_mul_elements (gsl_matrix_complex_long_double* a, const(gsl_matrix_complex_long_double)* b);
int gsl_matrix_complex_long_double_div_elements (gsl_matrix_complex_long_double* a, const(gsl_matrix_complex_long_double)* b);
int gsl_matrix_complex_long_double_scale (gsl_matrix_complex_long_double* a, const gsl_complex_long_double x);
int gsl_matrix_complex_long_double_add_constant (gsl_matrix_complex_long_double* a, const gsl_complex_long_double x);
int gsl_matrix_complex_long_double_add_diagonal (gsl_matrix_complex_long_double* a, const gsl_complex_long_double x);
int gsl_matrix_complex_long_double_get_row (gsl_vector_complex_long_double* v, const(gsl_matrix_complex_long_double)* m, const size_t i);
int gsl_matrix_complex_long_double_get_col (gsl_vector_complex_long_double* v, const(gsl_matrix_complex_long_double)* m, const size_t j);
int gsl_matrix_complex_long_double_set_row (gsl_matrix_complex_long_double* m, const size_t i, const(gsl_vector_complex_long_double)* v);
int gsl_matrix_complex_long_double_set_col (gsl_matrix_complex_long_double* m, const size_t j, const(gsl_vector_complex_long_double)* v);
gsl_complex_long_double gsl_matrix_complex_long_double_get (const(gsl_matrix_complex_long_double)* m, const size_t i, const size_t j);
void gsl_matrix_complex_long_double_set (gsl_matrix_complex_long_double* m, const size_t i, const size_t j, const gsl_complex_long_double x);
gsl_complex_long_double* gsl_matrix_complex_long_double_ptr (gsl_matrix_complex_long_double* m, const size_t i, const size_t j);
const(gsl_complex_long_double)* gsl_matrix_complex_long_double_const_ptr (const(gsl_matrix_complex_long_double)* m, const size_t i, const size_t j);


//gsl_matrix
struct gsl_matrix
{
    size_t size1;
    size_t size2;
    size_t tda;
    double* data;
    gsl_block* block;
    int owner;
}

struct _gsl_matrix_view
{
    gsl_matrix matrix;
}

struct _gsl_matrix_const_view
{
    gsl_matrix matrix;
}

alias _gsl_matrix_view gsl_matrix_view;
alias const _gsl_matrix_const_view gsl_matrix_const_view;

gsl_matrix* gsl_matrix_alloc (const size_t n1, const size_t n2);
gsl_matrix* gsl_matrix_calloc (const size_t n1, const size_t n2);
gsl_matrix* gsl_matrix_alloc_from_block (gsl_block* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix* gsl_matrix_alloc_from_matrix (gsl_matrix* m, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector* gsl_vector_alloc_row_from_matrix (gsl_matrix* m, const size_t i);
gsl_vector* gsl_vector_alloc_col_from_matrix (gsl_matrix* m, const size_t j);
void gsl_matrix_free (gsl_matrix* m);
_gsl_matrix_view gsl_matrix_submatrix (gsl_matrix* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_view gsl_matrix_row (gsl_matrix* m, const size_t i);
_gsl_vector_view gsl_matrix_column (gsl_matrix* m, const size_t j);
_gsl_vector_view gsl_matrix_diagonal (gsl_matrix* m);
_gsl_vector_view gsl_matrix_subdiagonal (gsl_matrix* m, const size_t k);
_gsl_vector_view gsl_matrix_superdiagonal (gsl_matrix* m, const size_t k);
_gsl_vector_view gsl_matrix_subrow (gsl_matrix* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_view gsl_matrix_subcolumn (gsl_matrix* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_view gsl_matrix_view_array (double* base, const size_t n1, const size_t n2);
_gsl_matrix_view gsl_matrix_view_array_with_tda (double* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_view gsl_matrix_view_vector (gsl_vector* v, const size_t n1, const size_t n2);
_gsl_matrix_view gsl_matrix_view_vector_with_tda (gsl_vector* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_const_view gsl_matrix_const_submatrix (const(gsl_matrix)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_const_view gsl_matrix_const_row (const(gsl_matrix)* m, const size_t i);
_gsl_vector_const_view gsl_matrix_const_column (const(gsl_matrix)* m, const size_t j);
_gsl_vector_const_view gsl_matrix_const_diagonal (const(gsl_matrix)* m);
_gsl_vector_const_view gsl_matrix_const_subdiagonal (const(gsl_matrix)* m, const size_t k);
_gsl_vector_const_view gsl_matrix_const_superdiagonal (const(gsl_matrix)* m, const size_t k);
_gsl_vector_const_view gsl_matrix_const_subrow (const(gsl_matrix)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_const_view gsl_matrix_const_subcolumn (const(gsl_matrix)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_const_view gsl_matrix_const_view_array (const(double)* base, const size_t n1, const size_t n2);
_gsl_matrix_const_view gsl_matrix_const_view_array_with_tda (const(double)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_const_view gsl_matrix_const_view_vector (const(gsl_vector)* v, const size_t n1, const size_t n2);
_gsl_matrix_const_view gsl_matrix_const_view_vector_with_tda (const(gsl_vector)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_set_zero (gsl_matrix* m);
void gsl_matrix_set_identity (gsl_matrix* m);
void gsl_matrix_set_all (gsl_matrix* m, double x);
int gsl_matrix_fread (FILE* stream, gsl_matrix* m);
int gsl_matrix_fwrite (FILE* stream, const(gsl_matrix)* m);
int gsl_matrix_fscanf (FILE* stream, gsl_matrix* m);
int gsl_matrix_fprintf (FILE* stream, const(gsl_matrix)* m, const(char)* format);
int gsl_matrix_memcpy (gsl_matrix* dest, const(gsl_matrix)* src);
int gsl_matrix_swap (gsl_matrix* m1, gsl_matrix* m2);
int gsl_matrix_swap_rows (gsl_matrix* m, const size_t i, const size_t j);
int gsl_matrix_swap_columns (gsl_matrix* m, const size_t i, const size_t j);
int gsl_matrix_swap_rowcol (gsl_matrix* m, const size_t i, const size_t j);
int gsl_matrix_transpose (gsl_matrix* m);
int gsl_matrix_transpose_memcpy (gsl_matrix* dest, const(gsl_matrix)* src);
double gsl_matrix_max (const(gsl_matrix)* m);
double gsl_matrix_min (const(gsl_matrix)* m);
void gsl_matrix_minmax (const(gsl_matrix)* m, double* min_out, double* max_out);
void gsl_matrix_max_index (const(gsl_matrix)* m, size_t* imax, size_t* jmax);
void gsl_matrix_min_index (const(gsl_matrix)* m, size_t* imin, size_t* jmin);
void gsl_matrix_minmax_index (const(gsl_matrix)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);
int gsl_matrix_equal (const(gsl_matrix)* a, const(gsl_matrix)* b);
int gsl_matrix_isnull (const(gsl_matrix)* m);
int gsl_matrix_ispos (const(gsl_matrix)* m);
int gsl_matrix_isneg (const(gsl_matrix)* m);
int gsl_matrix_isnonneg (const(gsl_matrix)* m);
int gsl_matrix_add (gsl_matrix* a, const(gsl_matrix)* b);
int gsl_matrix_sub (gsl_matrix* a, const(gsl_matrix)* b);
int gsl_matrix_mul_elements (gsl_matrix* a, const(gsl_matrix)* b);
int gsl_matrix_div_elements (gsl_matrix* a, const(gsl_matrix)* b);
int gsl_matrix_scale (gsl_matrix* a, const double x);
int gsl_matrix_add_constant (gsl_matrix* a, const double x);
int gsl_matrix_add_diagonal (gsl_matrix* a, const double x);
int gsl_matrix_get_row (gsl_vector* v, const(gsl_matrix)* m, const size_t i);
int gsl_matrix_get_col (gsl_vector* v, const(gsl_matrix)* m, const size_t j);
int gsl_matrix_set_row (gsl_matrix* m, const size_t i, const(gsl_vector)* v);
int gsl_matrix_set_col (gsl_matrix* m, const size_t j, const(gsl_vector)* v);
double gsl_matrix_get (const(gsl_matrix)* m, const size_t i, const size_t j);
void gsl_matrix_set (gsl_matrix* m, const size_t i, const size_t j, const double x);
double* gsl_matrix_ptr (gsl_matrix* m, const size_t i, const size_t j);
const(double)* gsl_matrix_const_ptr (const(gsl_matrix)* m, const size_t i, const size_t j);


//gsl_matrix_float
struct gsl_matrix_float
{
    size_t size1;
    size_t size2;
    size_t tda;
    float* data;
    gsl_block_float* block;
    int owner;
}

struct _gsl_matrix_float_view
{
    gsl_matrix_float matrix;
}

struct _gsl_matrix_float_const_view
{
    gsl_matrix_float matrix;
}

alias _gsl_matrix_float_view gsl_matrix_float_view;
alias const _gsl_matrix_float_const_view gsl_matrix_float_const_view;

gsl_matrix_float* gsl_matrix_float_alloc (const size_t n1, const size_t n2);
gsl_matrix_float* gsl_matrix_float_calloc (const size_t n1, const size_t n2);
gsl_matrix_float* gsl_matrix_float_alloc_from_block (gsl_block_float* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_float* gsl_matrix_float_alloc_from_matrix (gsl_matrix_float* m, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_float* gsl_vector_float_alloc_row_from_matrix (gsl_matrix_float* m, const size_t i);
gsl_vector_float* gsl_vector_float_alloc_col_from_matrix (gsl_matrix_float* m, const size_t j);
void gsl_matrix_float_free (gsl_matrix_float* m);
_gsl_matrix_float_view gsl_matrix_float_submatrix (gsl_matrix_float* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_float_view gsl_matrix_float_row (gsl_matrix_float* m, const size_t i);
_gsl_vector_float_view gsl_matrix_float_column (gsl_matrix_float* m, const size_t j);
_gsl_vector_float_view gsl_matrix_float_diagonal (gsl_matrix_float* m);
_gsl_vector_float_view gsl_matrix_float_subdiagonal (gsl_matrix_float* m, const size_t k);
_gsl_vector_float_view gsl_matrix_float_superdiagonal (gsl_matrix_float* m, const size_t k);
_gsl_vector_float_view gsl_matrix_float_subrow (gsl_matrix_float* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_float_view gsl_matrix_float_subcolumn (gsl_matrix_float* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_float_view gsl_matrix_float_view_array (float* base, const size_t n1, const size_t n2);
_gsl_matrix_float_view gsl_matrix_float_view_array_with_tda (float* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_float_view gsl_matrix_float_view_vector (gsl_vector_float* v, const size_t n1, const size_t n2);
_gsl_matrix_float_view gsl_matrix_float_view_vector_with_tda (gsl_vector_float* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_float_const_view gsl_matrix_float_const_submatrix (const(gsl_matrix_float)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_float_const_view gsl_matrix_float_const_row (const(gsl_matrix_float)* m, const size_t i);
_gsl_vector_float_const_view gsl_matrix_float_const_column (const(gsl_matrix_float)* m, const size_t j);
_gsl_vector_float_const_view gsl_matrix_float_const_diagonal (const(gsl_matrix_float)* m);
_gsl_vector_float_const_view gsl_matrix_float_const_subdiagonal (const(gsl_matrix_float)* m, const size_t k);
_gsl_vector_float_const_view gsl_matrix_float_const_superdiagonal (const(gsl_matrix_float)* m, const size_t k);
_gsl_vector_float_const_view gsl_matrix_float_const_subrow (const(gsl_matrix_float)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_float_const_view gsl_matrix_float_const_subcolumn (const(gsl_matrix_float)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_float_const_view gsl_matrix_float_const_view_array (const(float)* base, const size_t n1, const size_t n2);
_gsl_matrix_float_const_view gsl_matrix_float_const_view_array_with_tda (const(float)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_float_const_view gsl_matrix_float_const_view_vector (const(gsl_vector_float)* v, const size_t n1, const size_t n2);
_gsl_matrix_float_const_view gsl_matrix_float_const_view_vector_with_tda (const(gsl_vector_float)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_float_set_zero (gsl_matrix_float* m);
void gsl_matrix_float_set_identity (gsl_matrix_float* m);
void gsl_matrix_float_set_all (gsl_matrix_float* m, float x);
int gsl_matrix_float_fread (FILE* stream, gsl_matrix_float* m);
int gsl_matrix_float_fwrite (FILE* stream, const(gsl_matrix_float)* m);
int gsl_matrix_float_fscanf (FILE* stream, gsl_matrix_float* m);
int gsl_matrix_float_fprintf (FILE* stream, const(gsl_matrix_float)* m, const(char)* format);
int gsl_matrix_float_memcpy (gsl_matrix_float* dest, const(gsl_matrix_float)* src);
int gsl_matrix_float_swap (gsl_matrix_float* m1, gsl_matrix_float* m2);
int gsl_matrix_float_swap_rows (gsl_matrix_float* m, const size_t i, const size_t j);
int gsl_matrix_float_swap_columns (gsl_matrix_float* m, const size_t i, const size_t j);
int gsl_matrix_float_swap_rowcol (gsl_matrix_float* m, const size_t i, const size_t j);
int gsl_matrix_float_transpose (gsl_matrix_float* m);
int gsl_matrix_float_transpose_memcpy (gsl_matrix_float* dest, const(gsl_matrix_float)* src);
float gsl_matrix_float_max (const(gsl_matrix_float)* m);
float gsl_matrix_float_min (const(gsl_matrix_float)* m);
void gsl_matrix_float_minmax (const(gsl_matrix_float)* m, float* min_out, float* max_out);
void gsl_matrix_float_max_index (const(gsl_matrix_float)* m, size_t* imax, size_t* jmax);
void gsl_matrix_float_min_index (const(gsl_matrix_float)* m, size_t* imin, size_t* jmin);
void gsl_matrix_float_minmax_index (const(gsl_matrix_float)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);
int gsl_matrix_float_equal (const(gsl_matrix_float)* a, const(gsl_matrix_float)* b);
int gsl_matrix_float_isnull (const(gsl_matrix_float)* m);
int gsl_matrix_float_ispos (const(gsl_matrix_float)* m);
int gsl_matrix_float_isneg (const(gsl_matrix_float)* m);
int gsl_matrix_float_isnonneg (const(gsl_matrix_float)* m);
int gsl_matrix_float_add (gsl_matrix_float* a, const(gsl_matrix_float)* b);
int gsl_matrix_float_sub (gsl_matrix_float* a, const(gsl_matrix_float)* b);
int gsl_matrix_float_mul_elements (gsl_matrix_float* a, const(gsl_matrix_float)* b);
int gsl_matrix_float_div_elements (gsl_matrix_float* a, const(gsl_matrix_float)* b);
int gsl_matrix_float_scale (gsl_matrix_float* a, const double x);
int gsl_matrix_float_add_constant (gsl_matrix_float* a, const double x);
int gsl_matrix_float_add_diagonal (gsl_matrix_float* a, const double x);
int gsl_matrix_float_get_row (gsl_vector_float* v, const(gsl_matrix_float)* m, const size_t i);
int gsl_matrix_float_get_col (gsl_vector_float* v, const(gsl_matrix_float)* m, const size_t j);
int gsl_matrix_float_set_row (gsl_matrix_float* m, const size_t i, const(gsl_vector_float)* v);
int gsl_matrix_float_set_col (gsl_matrix_float* m, const size_t j, const(gsl_vector_float)* v);
float gsl_matrix_float_get (const(gsl_matrix_float)* m, const size_t i, const size_t j);
void gsl_matrix_float_set (gsl_matrix_float* m, const size_t i, const size_t j, const float x);
float* gsl_matrix_float_ptr (gsl_matrix_float* m, const size_t i, const size_t j);
const(float)* gsl_matrix_float_const_ptr (const(gsl_matrix_float)* m, const size_t i, const size_t j);


//gsl_matrix_int
struct gsl_matrix_int
{
    size_t size1;
    size_t size2;
    size_t tda;
    int* data;
    gsl_block_int* block;
    int owner;
}

struct _gsl_matrix_int_view
{
    gsl_matrix_int matrix;
}

struct _gsl_matrix_int_const_view
{
    gsl_matrix_int matrix;
}

alias _gsl_matrix_int_view gsl_matrix_int_view;
alias const _gsl_matrix_int_const_view gsl_matrix_int_const_view;

gsl_matrix_int* gsl_matrix_int_alloc (const size_t n1, const size_t n2);
gsl_matrix_int* gsl_matrix_int_calloc (const size_t n1, const size_t n2);
gsl_matrix_int* gsl_matrix_int_alloc_from_block (gsl_block_int* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_int* gsl_matrix_int_alloc_from_matrix (gsl_matrix_int* m, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_int* gsl_vector_int_alloc_row_from_matrix (gsl_matrix_int* m, const size_t i);
gsl_vector_int* gsl_vector_int_alloc_col_from_matrix (gsl_matrix_int* m, const size_t j);
void gsl_matrix_int_free (gsl_matrix_int* m);
_gsl_matrix_int_view gsl_matrix_int_submatrix (gsl_matrix_int* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_int_view gsl_matrix_int_row (gsl_matrix_int* m, const size_t i);
_gsl_vector_int_view gsl_matrix_int_column (gsl_matrix_int* m, const size_t j);
_gsl_vector_int_view gsl_matrix_int_diagonal (gsl_matrix_int* m);
_gsl_vector_int_view gsl_matrix_int_subdiagonal (gsl_matrix_int* m, const size_t k);
_gsl_vector_int_view gsl_matrix_int_superdiagonal (gsl_matrix_int* m, const size_t k);
_gsl_vector_int_view gsl_matrix_int_subrow (gsl_matrix_int* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_int_view gsl_matrix_int_subcolumn (gsl_matrix_int* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_int_view gsl_matrix_int_view_array (int* base, const size_t n1, const size_t n2);
_gsl_matrix_int_view gsl_matrix_int_view_array_with_tda (int* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_int_view gsl_matrix_int_view_vector (gsl_vector_int* v, const size_t n1, const size_t n2);
_gsl_matrix_int_view gsl_matrix_int_view_vector_with_tda (gsl_vector_int* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_int_const_view gsl_matrix_int_const_submatrix (const(gsl_matrix_int)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_int_const_view gsl_matrix_int_const_row (const(gsl_matrix_int)* m, const size_t i);
_gsl_vector_int_const_view gsl_matrix_int_const_column (const(gsl_matrix_int)* m, const size_t j);
_gsl_vector_int_const_view gsl_matrix_int_const_diagonal (const(gsl_matrix_int)* m);
_gsl_vector_int_const_view gsl_matrix_int_const_subdiagonal (const(gsl_matrix_int)* m, const size_t k);
_gsl_vector_int_const_view gsl_matrix_int_const_superdiagonal (const(gsl_matrix_int)* m, const size_t k);
_gsl_vector_int_const_view gsl_matrix_int_const_subrow (const(gsl_matrix_int)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_int_const_view gsl_matrix_int_const_subcolumn (const(gsl_matrix_int)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_int_const_view gsl_matrix_int_const_view_array (const(int)* base, const size_t n1, const size_t n2);
_gsl_matrix_int_const_view gsl_matrix_int_const_view_array_with_tda (const(int)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_int_const_view gsl_matrix_int_const_view_vector (const(gsl_vector_int)* v, const size_t n1, const size_t n2);
_gsl_matrix_int_const_view gsl_matrix_int_const_view_vector_with_tda (const(gsl_vector_int)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_int_set_zero (gsl_matrix_int* m);
void gsl_matrix_int_set_identity (gsl_matrix_int* m);
void gsl_matrix_int_set_all (gsl_matrix_int* m, int x);
int gsl_matrix_int_fread (FILE* stream, gsl_matrix_int* m);
int gsl_matrix_int_fwrite (FILE* stream, const(gsl_matrix_int)* m);
int gsl_matrix_int_fscanf (FILE* stream, gsl_matrix_int* m);
int gsl_matrix_int_fprintf (FILE* stream, const(gsl_matrix_int)* m, const(char)* format);
int gsl_matrix_int_memcpy (gsl_matrix_int* dest, const(gsl_matrix_int)* src);
int gsl_matrix_int_swap (gsl_matrix_int* m1, gsl_matrix_int* m2);
int gsl_matrix_int_swap_rows (gsl_matrix_int* m, const size_t i, const size_t j);
int gsl_matrix_int_swap_columns (gsl_matrix_int* m, const size_t i, const size_t j);
int gsl_matrix_int_swap_rowcol (gsl_matrix_int* m, const size_t i, const size_t j);
int gsl_matrix_int_transpose (gsl_matrix_int* m);
int gsl_matrix_int_transpose_memcpy (gsl_matrix_int* dest, const(gsl_matrix_int)* src);
int gsl_matrix_int_max (const(gsl_matrix_int)* m);
int gsl_matrix_int_min (const(gsl_matrix_int)* m);
void gsl_matrix_int_minmax (const(gsl_matrix_int)* m, int* min_out, int* max_out);
void gsl_matrix_int_max_index (const(gsl_matrix_int)* m, size_t* imax, size_t* jmax);
void gsl_matrix_int_min_index (const(gsl_matrix_int)* m, size_t* imin, size_t* jmin);
void gsl_matrix_int_minmax_index (const(gsl_matrix_int)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);
int gsl_matrix_int_equal (const(gsl_matrix_int)* a, const(gsl_matrix_int)* b);
int gsl_matrix_int_isnull (const(gsl_matrix_int)* m);
int gsl_matrix_int_ispos (const(gsl_matrix_int)* m);
int gsl_matrix_int_isneg (const(gsl_matrix_int)* m);
int gsl_matrix_int_isnonneg (const(gsl_matrix_int)* m);
int gsl_matrix_int_add (gsl_matrix_int* a, const(gsl_matrix_int)* b);
int gsl_matrix_int_sub (gsl_matrix_int* a, const(gsl_matrix_int)* b);
int gsl_matrix_int_mul_elements (gsl_matrix_int* a, const(gsl_matrix_int)* b);
int gsl_matrix_int_div_elements (gsl_matrix_int* a, const(gsl_matrix_int)* b);
int gsl_matrix_int_scale (gsl_matrix_int* a, const double x);
int gsl_matrix_int_add_constant (gsl_matrix_int* a, const double x);
int gsl_matrix_int_add_diagonal (gsl_matrix_int* a, const double x);
int gsl_matrix_int_get_row (gsl_vector_int* v, const(gsl_matrix_int)* m, const size_t i);
int gsl_matrix_int_get_col (gsl_vector_int* v, const(gsl_matrix_int)* m, const size_t j);
int gsl_matrix_int_set_row (gsl_matrix_int* m, const size_t i, const(gsl_vector_int)* v);
int gsl_matrix_int_set_col (gsl_matrix_int* m, const size_t j, const(gsl_vector_int)* v);
int gsl_matrix_int_get (const(gsl_matrix_int)* m, const size_t i, const size_t j);
void gsl_matrix_int_set (gsl_matrix_int* m, const size_t i, const size_t j, const int x);
int* gsl_matrix_int_ptr (gsl_matrix_int* m, const size_t i, const size_t j);
const(int)* gsl_matrix_int_const_ptr (const(gsl_matrix_int)* m, const size_t i, const size_t j);


//gsl_matrix_long
struct gsl_matrix_long
{
    size_t size1;
    size_t size2;
    size_t tda;
    c_long* data;
    gsl_block_long* block;
    int owner;
}

struct _gsl_matrix_long_view
{
    gsl_matrix_long matrix;
}

struct _gsl_matrix_long_const_view
{
    gsl_matrix_long matrix;
}

alias _gsl_matrix_long_view gsl_matrix_long_view;
alias const _gsl_matrix_long_const_view gsl_matrix_long_const_view;

gsl_matrix_long* gsl_matrix_long_alloc (const size_t n1, const size_t n2);
gsl_matrix_long* gsl_matrix_long_calloc (const size_t n1, const size_t n2);
gsl_matrix_long* gsl_matrix_long_alloc_from_block (gsl_block_long* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_long* gsl_matrix_long_alloc_from_matrix (gsl_matrix_long* m, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_long* gsl_vector_long_alloc_row_from_matrix (gsl_matrix_long* m, const size_t i);
gsl_vector_long* gsl_vector_long_alloc_col_from_matrix (gsl_matrix_long* m, const size_t j);
void gsl_matrix_long_free (gsl_matrix_long* m);
_gsl_matrix_long_view gsl_matrix_long_submatrix (gsl_matrix_long* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_long_view gsl_matrix_long_row (gsl_matrix_long* m, const size_t i);
_gsl_vector_long_view gsl_matrix_long_column (gsl_matrix_long* m, const size_t j);
_gsl_vector_long_view gsl_matrix_long_diagonal (gsl_matrix_long* m);
_gsl_vector_long_view gsl_matrix_long_subdiagonal (gsl_matrix_long* m, const size_t k);
_gsl_vector_long_view gsl_matrix_long_superdiagonal (gsl_matrix_long* m, const size_t k);
_gsl_vector_long_view gsl_matrix_long_subrow (gsl_matrix_long* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_long_view gsl_matrix_long_subcolumn (gsl_matrix_long* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_long_view gsl_matrix_long_view_array (c_long* base, const size_t n1, const size_t n2);
_gsl_matrix_long_view gsl_matrix_long_view_array_with_tda (c_long* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_long_view gsl_matrix_long_view_vector (gsl_vector_long* v, const size_t n1, const size_t n2);
_gsl_matrix_long_view gsl_matrix_long_view_vector_with_tda (gsl_vector_long* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_long_const_view gsl_matrix_long_const_submatrix (const(gsl_matrix_long)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_long_const_view gsl_matrix_long_const_row (const(gsl_matrix_long)* m, const size_t i);
_gsl_vector_long_const_view gsl_matrix_long_const_column (const(gsl_matrix_long)* m, const size_t j);
_gsl_vector_long_const_view gsl_matrix_long_const_diagonal (const(gsl_matrix_long)* m);
_gsl_vector_long_const_view gsl_matrix_long_const_subdiagonal (const(gsl_matrix_long)* m, const size_t k);
_gsl_vector_long_const_view gsl_matrix_long_const_superdiagonal (const(gsl_matrix_long)* m, const size_t k);
_gsl_vector_long_const_view gsl_matrix_long_const_subrow (const(gsl_matrix_long)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_long_const_view gsl_matrix_long_const_subcolumn (const(gsl_matrix_long)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_long_const_view gsl_matrix_long_const_view_array (const(c_long)* base, const size_t n1, const size_t n2);
_gsl_matrix_long_const_view gsl_matrix_long_const_view_array_with_tda (const(c_long)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_long_const_view gsl_matrix_long_const_view_vector (const(gsl_vector_long)* v, const size_t n1, const size_t n2);
_gsl_matrix_long_const_view gsl_matrix_long_const_view_vector_with_tda (const(gsl_vector_long)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_long_set_zero (gsl_matrix_long* m);
void gsl_matrix_long_set_identity (gsl_matrix_long* m);
void gsl_matrix_long_set_all (gsl_matrix_long* m, c_long x);
int gsl_matrix_long_fread (FILE* stream, gsl_matrix_long* m);
int gsl_matrix_long_fwrite (FILE* stream, const(gsl_matrix_long)* m);
int gsl_matrix_long_fscanf (FILE* stream, gsl_matrix_long* m);
int gsl_matrix_long_fprintf (FILE* stream, const(gsl_matrix_long)* m, const(char)* format);
int gsl_matrix_long_memcpy (gsl_matrix_long* dest, const(gsl_matrix_long)* src);
int gsl_matrix_long_swap (gsl_matrix_long* m1, gsl_matrix_long* m2);
int gsl_matrix_long_swap_rows (gsl_matrix_long* m, const size_t i, const size_t j);
int gsl_matrix_long_swap_columns (gsl_matrix_long* m, const size_t i, const size_t j);
int gsl_matrix_long_swap_rowcol (gsl_matrix_long* m, const size_t i, const size_t j);
int gsl_matrix_long_transpose (gsl_matrix_long* m);
int gsl_matrix_long_transpose_memcpy (gsl_matrix_long* dest, const(gsl_matrix_long)* src);
c_long gsl_matrix_long_max (const(gsl_matrix_long)* m);
c_long gsl_matrix_long_min (const(gsl_matrix_long)* m);
void gsl_matrix_long_minmax (const(gsl_matrix_long)* m, c_long* min_out, c_long* max_out);
void gsl_matrix_long_max_index (const(gsl_matrix_long)* m, size_t* imax, size_t* jmax);
void gsl_matrix_long_min_index (const(gsl_matrix_long)* m, size_t* imin, size_t* jmin);
void gsl_matrix_long_minmax_index (const(gsl_matrix_long)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);
int gsl_matrix_long_equal (const(gsl_matrix_long)* a, const(gsl_matrix_long)* b);
int gsl_matrix_long_isnull (const(gsl_matrix_long)* m);
int gsl_matrix_long_ispos (const(gsl_matrix_long)* m);
int gsl_matrix_long_isneg (const(gsl_matrix_long)* m);
int gsl_matrix_long_isnonneg (const(gsl_matrix_long)* m);
int gsl_matrix_long_add (gsl_matrix_long* a, const(gsl_matrix_long)* b);
int gsl_matrix_long_sub (gsl_matrix_long* a, const(gsl_matrix_long)* b);
int gsl_matrix_long_mul_elements (gsl_matrix_long* a, const(gsl_matrix_long)* b);
int gsl_matrix_long_div_elements (gsl_matrix_long* a, const(gsl_matrix_long)* b);
int gsl_matrix_long_scale (gsl_matrix_long* a, const double x);
int gsl_matrix_long_add_constant (gsl_matrix_long* a, const double x);
int gsl_matrix_long_add_diagonal (gsl_matrix_long* a, const double x);
int gsl_matrix_long_get_row (gsl_vector_long* v, const(gsl_matrix_long)* m, const size_t i);
int gsl_matrix_long_get_col (gsl_vector_long* v, const(gsl_matrix_long)* m, const size_t j);
int gsl_matrix_long_set_row (gsl_matrix_long* m, const size_t i, const(gsl_vector_long)* v);
int gsl_matrix_long_set_col (gsl_matrix_long* m, const size_t j, const(gsl_vector_long)* v);
c_long gsl_matrix_long_get (const(gsl_matrix_long)* m, const size_t i, const size_t j);
void gsl_matrix_long_set (gsl_matrix_long* m, const size_t i, const size_t j, const c_long x);
c_long* gsl_matrix_long_ptr (gsl_matrix_long* m, const size_t i, const size_t j);
const(c_long)* gsl_matrix_long_const_ptr (const(gsl_matrix_long)* m, const size_t i, const size_t j);


//gsl_matrix_long_double
struct gsl_matrix_long_double
{
    size_t size1;
    size_t size2;
    size_t tda;
    real* data;
    gsl_block_long_double* block;
    int owner;
}

struct _gsl_matrix_long_double_view
{
    gsl_matrix_long_double matrix;
}

struct _gsl_matrix_long_double_const_view
{
    gsl_matrix_long_double matrix;
}

alias _gsl_matrix_long_double_view gsl_matrix_long_double_view;
alias const _gsl_matrix_long_double_const_view gsl_matrix_long_double_const_view;

gsl_matrix_long_double* gsl_matrix_long_double_alloc (const size_t n1, const size_t n2);
gsl_matrix_long_double* gsl_matrix_long_double_calloc (const size_t n1, const size_t n2);
gsl_matrix_long_double* gsl_matrix_long_double_alloc_from_block (gsl_block_long_double* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_long_double* gsl_matrix_long_double_alloc_from_matrix (gsl_matrix_long_double* m, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_long_double* gsl_vector_long_double_alloc_row_from_matrix (gsl_matrix_long_double* m, const size_t i);
gsl_vector_long_double* gsl_vector_long_double_alloc_col_from_matrix (gsl_matrix_long_double* m, const size_t j);
void gsl_matrix_long_double_free (gsl_matrix_long_double* m);
_gsl_matrix_long_double_view gsl_matrix_long_double_submatrix (gsl_matrix_long_double* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_long_double_view gsl_matrix_long_double_row (gsl_matrix_long_double* m, const size_t i);
_gsl_vector_long_double_view gsl_matrix_long_double_column (gsl_matrix_long_double* m, const size_t j);
_gsl_vector_long_double_view gsl_matrix_long_double_diagonal (gsl_matrix_long_double* m);
_gsl_vector_long_double_view gsl_matrix_long_double_subdiagonal (gsl_matrix_long_double* m, const size_t k);
_gsl_vector_long_double_view gsl_matrix_long_double_superdiagonal (gsl_matrix_long_double* m, const size_t k);
_gsl_vector_long_double_view gsl_matrix_long_double_subrow (gsl_matrix_long_double* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_long_double_view gsl_matrix_long_double_subcolumn (gsl_matrix_long_double* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_long_double_view gsl_matrix_long_double_view_array (real* base, const size_t n1, const size_t n2);
_gsl_matrix_long_double_view gsl_matrix_long_double_view_array_with_tda (real* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_long_double_view gsl_matrix_long_double_view_vector (gsl_vector_long_double* v, const size_t n1, const size_t n2);
_gsl_matrix_long_double_view gsl_matrix_long_double_view_vector_with_tda (gsl_vector_long_double* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_long_double_const_view gsl_matrix_long_double_const_submatrix (const(gsl_matrix_long_double)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_long_double_const_view gsl_matrix_long_double_const_row (const(gsl_matrix_long_double)* m, const size_t i);
_gsl_vector_long_double_const_view gsl_matrix_long_double_const_column (const(gsl_matrix_long_double)* m, const size_t j);
_gsl_vector_long_double_const_view gsl_matrix_long_double_const_diagonal (const(gsl_matrix_long_double)* m);
_gsl_vector_long_double_const_view gsl_matrix_long_double_const_subdiagonal (const(gsl_matrix_long_double)* m, const size_t k);
_gsl_vector_long_double_const_view gsl_matrix_long_double_const_superdiagonal (const(gsl_matrix_long_double)* m, const size_t k);
_gsl_vector_long_double_const_view gsl_matrix_long_double_const_subrow (const(gsl_matrix_long_double)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_long_double_const_view gsl_matrix_long_double_const_subcolumn (const(gsl_matrix_long_double)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_long_double_const_view gsl_matrix_long_double_const_view_array (const(real)* base, const size_t n1, const size_t n2);
_gsl_matrix_long_double_const_view gsl_matrix_long_double_const_view_array_with_tda (const(real)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_long_double_const_view gsl_matrix_long_double_const_view_vector (const(gsl_vector_long_double)* v, const size_t n1, const size_t n2);
_gsl_matrix_long_double_const_view gsl_matrix_long_double_const_view_vector_with_tda (const(gsl_vector_long_double)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_long_double_set_zero (gsl_matrix_long_double* m);
void gsl_matrix_long_double_set_identity (gsl_matrix_long_double* m);
void gsl_matrix_long_double_set_all (gsl_matrix_long_double* m, real x);
int gsl_matrix_long_double_fread (FILE* stream, gsl_matrix_long_double* m);
int gsl_matrix_long_double_fwrite (FILE* stream, const(gsl_matrix_long_double)* m);
int gsl_matrix_long_double_fscanf (FILE* stream, gsl_matrix_long_double* m);
int gsl_matrix_long_double_fprintf (FILE* stream, const(gsl_matrix_long_double)* m, const(char)* format);
int gsl_matrix_long_double_memcpy (gsl_matrix_long_double* dest, const(gsl_matrix_long_double)* src);
int gsl_matrix_long_double_swap (gsl_matrix_long_double* m1, gsl_matrix_long_double* m2);
int gsl_matrix_long_double_swap_rows (gsl_matrix_long_double* m, const size_t i, const size_t j);
int gsl_matrix_long_double_swap_columns (gsl_matrix_long_double* m, const size_t i, const size_t j);
int gsl_matrix_long_double_swap_rowcol (gsl_matrix_long_double* m, const size_t i, const size_t j);
int gsl_matrix_long_double_transpose (gsl_matrix_long_double* m);
int gsl_matrix_long_double_transpose_memcpy (gsl_matrix_long_double* dest, const(gsl_matrix_long_double)* src);
real gsl_matrix_long_double_max (const(gsl_matrix_long_double)* m);
real gsl_matrix_long_double_min (const(gsl_matrix_long_double)* m);
void gsl_matrix_long_double_minmax (const(gsl_matrix_long_double)* m, real* min_out, real* max_out);
void gsl_matrix_long_double_max_index (const(gsl_matrix_long_double)* m, size_t* imax, size_t* jmax);
void gsl_matrix_long_double_min_index (const(gsl_matrix_long_double)* m, size_t* imin, size_t* jmin);
void gsl_matrix_long_double_minmax_index (const(gsl_matrix_long_double)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);
int gsl_matrix_long_double_equal (const(gsl_matrix_long_double)* a, const(gsl_matrix_long_double)* b);
int gsl_matrix_long_double_isnull (const(gsl_matrix_long_double)* m);
int gsl_matrix_long_double_ispos (const(gsl_matrix_long_double)* m);
int gsl_matrix_long_double_isneg (const(gsl_matrix_long_double)* m);
int gsl_matrix_long_double_isnonneg (const(gsl_matrix_long_double)* m);
int gsl_matrix_long_double_add (gsl_matrix_long_double* a, const(gsl_matrix_long_double)* b);
int gsl_matrix_long_double_sub (gsl_matrix_long_double* a, const(gsl_matrix_long_double)* b);
int gsl_matrix_long_double_mul_elements (gsl_matrix_long_double* a, const(gsl_matrix_long_double)* b);
int gsl_matrix_long_double_div_elements (gsl_matrix_long_double* a, const(gsl_matrix_long_double)* b);
int gsl_matrix_long_double_scale (gsl_matrix_long_double* a, const double x);
int gsl_matrix_long_double_add_constant (gsl_matrix_long_double* a, const double x);
int gsl_matrix_long_double_add_diagonal (gsl_matrix_long_double* a, const double x);
int gsl_matrix_long_double_get_row (gsl_vector_long_double* v, const(gsl_matrix_long_double)* m, const size_t i);
int gsl_matrix_long_double_get_col (gsl_vector_long_double* v, const(gsl_matrix_long_double)* m, const size_t j);
int gsl_matrix_long_double_set_row (gsl_matrix_long_double* m, const size_t i, const(gsl_vector_long_double)* v);
int gsl_matrix_long_double_set_col (gsl_matrix_long_double* m, const size_t j, const(gsl_vector_long_double)* v);
real gsl_matrix_long_double_get (const(gsl_matrix_long_double)* m, const size_t i, const size_t j);
void gsl_matrix_long_double_set (gsl_matrix_long_double* m, const size_t i, const size_t j, const real x);
real* gsl_matrix_long_double_ptr (gsl_matrix_long_double* m, const size_t i, const size_t j);
const(real)* gsl_matrix_long_double_const_ptr (const(gsl_matrix_long_double)* m, const size_t i, const size_t j);


//gsl_matrix_short
struct gsl_matrix_short
{
    size_t size1;
    size_t size2;
    size_t tda;
    short* data;
    gsl_block_short* block;
    int owner;
}

struct _gsl_matrix_short_view
{
    gsl_matrix_short matrix;
}

struct _gsl_matrix_short_const_view
{
    gsl_matrix_short matrix;
}

alias _gsl_matrix_short_view gsl_matrix_short_view;
alias const _gsl_matrix_short_const_view gsl_matrix_short_const_view;

gsl_matrix_short* gsl_matrix_short_alloc (const size_t n1, const size_t n2);
gsl_matrix_short* gsl_matrix_short_calloc (const size_t n1, const size_t n2);
gsl_matrix_short* gsl_matrix_short_alloc_from_block (gsl_block_short* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_short* gsl_matrix_short_alloc_from_matrix (gsl_matrix_short* m, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_short* gsl_vector_short_alloc_row_from_matrix (gsl_matrix_short* m, const size_t i);
gsl_vector_short* gsl_vector_short_alloc_col_from_matrix (gsl_matrix_short* m, const size_t j);
void gsl_matrix_short_free (gsl_matrix_short* m);
_gsl_matrix_short_view gsl_matrix_short_submatrix (gsl_matrix_short* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_short_view gsl_matrix_short_row (gsl_matrix_short* m, const size_t i);
_gsl_vector_short_view gsl_matrix_short_column (gsl_matrix_short* m, const size_t j);
_gsl_vector_short_view gsl_matrix_short_diagonal (gsl_matrix_short* m);
_gsl_vector_short_view gsl_matrix_short_subdiagonal (gsl_matrix_short* m, const size_t k);
_gsl_vector_short_view gsl_matrix_short_superdiagonal (gsl_matrix_short* m, const size_t k);
_gsl_vector_short_view gsl_matrix_short_subrow (gsl_matrix_short* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_short_view gsl_matrix_short_subcolumn (gsl_matrix_short* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_short_view gsl_matrix_short_view_array (short* base, const size_t n1, const size_t n2);
_gsl_matrix_short_view gsl_matrix_short_view_array_with_tda (short* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_short_view gsl_matrix_short_view_vector (gsl_vector_short* v, const size_t n1, const size_t n2);
_gsl_matrix_short_view gsl_matrix_short_view_vector_with_tda (gsl_vector_short* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_short_const_view gsl_matrix_short_const_submatrix (const(gsl_matrix_short)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_short_const_view gsl_matrix_short_const_row (const(gsl_matrix_short)* m, const size_t i);
_gsl_vector_short_const_view gsl_matrix_short_const_column (const(gsl_matrix_short)* m, const size_t j);
_gsl_vector_short_const_view gsl_matrix_short_const_diagonal (const(gsl_matrix_short)* m);
_gsl_vector_short_const_view gsl_matrix_short_const_subdiagonal (const(gsl_matrix_short)* m, const size_t k);
_gsl_vector_short_const_view gsl_matrix_short_const_superdiagonal (const(gsl_matrix_short)* m, const size_t k);
_gsl_vector_short_const_view gsl_matrix_short_const_subrow (const(gsl_matrix_short)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_short_const_view gsl_matrix_short_const_subcolumn (const(gsl_matrix_short)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_short_const_view gsl_matrix_short_const_view_array (const(short)* base, const size_t n1, const size_t n2);
_gsl_matrix_short_const_view gsl_matrix_short_const_view_array_with_tda (const(short)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_short_const_view gsl_matrix_short_const_view_vector (const(gsl_vector_short)* v, const size_t n1, const size_t n2);
_gsl_matrix_short_const_view gsl_matrix_short_const_view_vector_with_tda (const(gsl_vector_short)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_short_set_zero (gsl_matrix_short* m);
void gsl_matrix_short_set_identity (gsl_matrix_short* m);
void gsl_matrix_short_set_all (gsl_matrix_short* m, short x);
int gsl_matrix_short_fread (FILE* stream, gsl_matrix_short* m);
int gsl_matrix_short_fwrite (FILE* stream, const(gsl_matrix_short)* m);
int gsl_matrix_short_fscanf (FILE* stream, gsl_matrix_short* m);
int gsl_matrix_short_fprintf (FILE* stream, const(gsl_matrix_short)* m, const(char)* format);
int gsl_matrix_short_memcpy (gsl_matrix_short* dest, const(gsl_matrix_short)* src);
int gsl_matrix_short_swap (gsl_matrix_short* m1, gsl_matrix_short* m2);
int gsl_matrix_short_swap_rows (gsl_matrix_short* m, const size_t i, const size_t j);
int gsl_matrix_short_swap_columns (gsl_matrix_short* m, const size_t i, const size_t j);
int gsl_matrix_short_swap_rowcol (gsl_matrix_short* m, const size_t i, const size_t j);
int gsl_matrix_short_transpose (gsl_matrix_short* m);
int gsl_matrix_short_transpose_memcpy (gsl_matrix_short* dest, const(gsl_matrix_short)* src);
short gsl_matrix_short_max (const(gsl_matrix_short)* m);
short gsl_matrix_short_min (const(gsl_matrix_short)* m);
void gsl_matrix_short_minmax (const(gsl_matrix_short)* m, short* min_out, short* max_out);
void gsl_matrix_short_max_index (const(gsl_matrix_short)* m, size_t* imax, size_t* jmax);
void gsl_matrix_short_min_index (const(gsl_matrix_short)* m, size_t* imin, size_t* jmin);
void gsl_matrix_short_minmax_index (const(gsl_matrix_short)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);
int gsl_matrix_short_equal (const(gsl_matrix_short)* a, const(gsl_matrix_short)* b);
int gsl_matrix_short_isnull (const(gsl_matrix_short)* m);
int gsl_matrix_short_ispos (const(gsl_matrix_short)* m);
int gsl_matrix_short_isneg (const(gsl_matrix_short)* m);
int gsl_matrix_short_isnonneg (const(gsl_matrix_short)* m);
int gsl_matrix_short_add (gsl_matrix_short* a, const(gsl_matrix_short)* b);
int gsl_matrix_short_sub (gsl_matrix_short* a, const(gsl_matrix_short)* b);
int gsl_matrix_short_mul_elements (gsl_matrix_short* a, const(gsl_matrix_short)* b);
int gsl_matrix_short_div_elements (gsl_matrix_short* a, const(gsl_matrix_short)* b);
int gsl_matrix_short_scale (gsl_matrix_short* a, const double x);
int gsl_matrix_short_add_constant (gsl_matrix_short* a, const double x);
int gsl_matrix_short_add_diagonal (gsl_matrix_short* a, const double x);
int gsl_matrix_short_get_row (gsl_vector_short* v, const(gsl_matrix_short)* m, const size_t i);
int gsl_matrix_short_get_col (gsl_vector_short* v, const(gsl_matrix_short)* m, const size_t j);
int gsl_matrix_short_set_row (gsl_matrix_short* m, const size_t i, const(gsl_vector_short)* v);
int gsl_matrix_short_set_col (gsl_matrix_short* m, const size_t j, const(gsl_vector_short)* v);
short gsl_matrix_short_get (const(gsl_matrix_short)* m, const size_t i, const size_t j);
void gsl_matrix_short_set (gsl_matrix_short* m, const size_t i, const size_t j, const short x);
short* gsl_matrix_short_ptr (gsl_matrix_short* m, const size_t i, const size_t j);
const(short)* gsl_matrix_short_const_ptr (const(gsl_matrix_short)* m, const size_t i, const size_t j);


//gsl_matrix_uchar
struct gsl_matrix_uchar
{
    size_t size1;
    size_t size2;
    size_t tda;
    ubyte* data;
    gsl_block_uchar* block;
    int owner;
}

struct _gsl_matrix_uchar_view
{
    gsl_matrix_uchar matrix;
}

struct _gsl_matrix_uchar_const_view
{
    gsl_matrix_uchar matrix;
}

alias _gsl_matrix_uchar_view gsl_matrix_uchar_view;
alias const _gsl_matrix_uchar_const_view gsl_matrix_uchar_const_view;

gsl_matrix_uchar* gsl_matrix_uchar_alloc (const size_t n1, const size_t n2);
gsl_matrix_uchar* gsl_matrix_uchar_calloc (const size_t n1, const size_t n2);
gsl_matrix_uchar* gsl_matrix_uchar_alloc_from_block (gsl_block_uchar* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_uchar* gsl_matrix_uchar_alloc_from_matrix (gsl_matrix_uchar* m, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_uchar* gsl_vector_uchar_alloc_row_from_matrix (gsl_matrix_uchar* m, const size_t i);
gsl_vector_uchar* gsl_vector_uchar_alloc_col_from_matrix (gsl_matrix_uchar* m, const size_t j);
void gsl_matrix_uchar_free (gsl_matrix_uchar* m);
_gsl_matrix_uchar_view gsl_matrix_uchar_submatrix (gsl_matrix_uchar* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_uchar_view gsl_matrix_uchar_row (gsl_matrix_uchar* m, const size_t i);
_gsl_vector_uchar_view gsl_matrix_uchar_column (gsl_matrix_uchar* m, const size_t j);
_gsl_vector_uchar_view gsl_matrix_uchar_diagonal (gsl_matrix_uchar* m);
_gsl_vector_uchar_view gsl_matrix_uchar_subdiagonal (gsl_matrix_uchar* m, const size_t k);
_gsl_vector_uchar_view gsl_matrix_uchar_superdiagonal (gsl_matrix_uchar* m, const size_t k);
_gsl_vector_uchar_view gsl_matrix_uchar_subrow (gsl_matrix_uchar* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_uchar_view gsl_matrix_uchar_subcolumn (gsl_matrix_uchar* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_uchar_view gsl_matrix_uchar_view_array (ubyte* base, const size_t n1, const size_t n2);
_gsl_matrix_uchar_view gsl_matrix_uchar_view_array_with_tda (ubyte* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_uchar_view gsl_matrix_uchar_view_vector (gsl_vector_uchar* v, const size_t n1, const size_t n2);
_gsl_matrix_uchar_view gsl_matrix_uchar_view_vector_with_tda (gsl_vector_uchar* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_uchar_const_view gsl_matrix_uchar_const_submatrix (const(gsl_matrix_uchar)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_uchar_const_view gsl_matrix_uchar_const_row (const(gsl_matrix_uchar)* m, const size_t i);
_gsl_vector_uchar_const_view gsl_matrix_uchar_const_column (const(gsl_matrix_uchar)* m, const size_t j);
_gsl_vector_uchar_const_view gsl_matrix_uchar_const_diagonal (const(gsl_matrix_uchar)* m);
_gsl_vector_uchar_const_view gsl_matrix_uchar_const_subdiagonal (const(gsl_matrix_uchar)* m, const size_t k);
_gsl_vector_uchar_const_view gsl_matrix_uchar_const_superdiagonal (const(gsl_matrix_uchar)* m, const size_t k);
_gsl_vector_uchar_const_view gsl_matrix_uchar_const_subrow (const(gsl_matrix_uchar)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_uchar_const_view gsl_matrix_uchar_const_subcolumn (const(gsl_matrix_uchar)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_uchar_const_view gsl_matrix_uchar_const_view_array (const(ubyte)* base, const size_t n1, const size_t n2);
_gsl_matrix_uchar_const_view gsl_matrix_uchar_const_view_array_with_tda (const(ubyte)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_uchar_const_view gsl_matrix_uchar_const_view_vector (const(gsl_vector_uchar)* v, const size_t n1, const size_t n2);
_gsl_matrix_uchar_const_view gsl_matrix_uchar_const_view_vector_with_tda (const(gsl_vector_uchar)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_uchar_set_zero (gsl_matrix_uchar* m);
void gsl_matrix_uchar_set_identity (gsl_matrix_uchar* m);
void gsl_matrix_uchar_set_all (gsl_matrix_uchar* m, ubyte x);
int gsl_matrix_uchar_fread (FILE* stream, gsl_matrix_uchar* m);
int gsl_matrix_uchar_fwrite (FILE* stream, const(gsl_matrix_uchar)* m);
int gsl_matrix_uchar_fscanf (FILE* stream, gsl_matrix_uchar* m);
int gsl_matrix_uchar_fprintf (FILE* stream, const(gsl_matrix_uchar)* m, const(char)* format);
int gsl_matrix_uchar_memcpy (gsl_matrix_uchar* dest, const(gsl_matrix_uchar)* src);
int gsl_matrix_uchar_swap (gsl_matrix_uchar* m1, gsl_matrix_uchar* m2);
int gsl_matrix_uchar_swap_rows (gsl_matrix_uchar* m, const size_t i, const size_t j);
int gsl_matrix_uchar_swap_columns (gsl_matrix_uchar* m, const size_t i, const size_t j);
int gsl_matrix_uchar_swap_rowcol (gsl_matrix_uchar* m, const size_t i, const size_t j);
int gsl_matrix_uchar_transpose (gsl_matrix_uchar* m);
int gsl_matrix_uchar_transpose_memcpy (gsl_matrix_uchar* dest, const(gsl_matrix_uchar)* src);
ubyte gsl_matrix_uchar_max (const(gsl_matrix_uchar)* m);
ubyte gsl_matrix_uchar_min (const(gsl_matrix_uchar)* m);
void gsl_matrix_uchar_minmax (const(gsl_matrix_uchar)* m, ubyte* min_out, ubyte* max_out);
void gsl_matrix_uchar_max_index (const(gsl_matrix_uchar)* m, size_t* imax, size_t* jmax);
void gsl_matrix_uchar_min_index (const(gsl_matrix_uchar)* m, size_t* imin, size_t* jmin);
void gsl_matrix_uchar_minmax_index (const(gsl_matrix_uchar)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);
int gsl_matrix_uchar_equal (const(gsl_matrix_uchar)* a, const(gsl_matrix_uchar)* b);
int gsl_matrix_uchar_isnull (const(gsl_matrix_uchar)* m);
int gsl_matrix_uchar_ispos (const(gsl_matrix_uchar)* m);
int gsl_matrix_uchar_isneg (const(gsl_matrix_uchar)* m);
int gsl_matrix_uchar_isnonneg (const(gsl_matrix_uchar)* m);
int gsl_matrix_uchar_add (gsl_matrix_uchar* a, const(gsl_matrix_uchar)* b);
int gsl_matrix_uchar_sub (gsl_matrix_uchar* a, const(gsl_matrix_uchar)* b);
int gsl_matrix_uchar_mul_elements (gsl_matrix_uchar* a, const(gsl_matrix_uchar)* b);
int gsl_matrix_uchar_div_elements (gsl_matrix_uchar* a, const(gsl_matrix_uchar)* b);
int gsl_matrix_uchar_scale (gsl_matrix_uchar* a, const double x);
int gsl_matrix_uchar_add_constant (gsl_matrix_uchar* a, const double x);
int gsl_matrix_uchar_add_diagonal (gsl_matrix_uchar* a, const double x);
int gsl_matrix_uchar_get_row (gsl_vector_uchar* v, const(gsl_matrix_uchar)* m, const size_t i);
int gsl_matrix_uchar_get_col (gsl_vector_uchar* v, const(gsl_matrix_uchar)* m, const size_t j);
int gsl_matrix_uchar_set_row (gsl_matrix_uchar* m, const size_t i, const(gsl_vector_uchar)* v);
int gsl_matrix_uchar_set_col (gsl_matrix_uchar* m, const size_t j, const(gsl_vector_uchar)* v);
ubyte gsl_matrix_uchar_get (const(gsl_matrix_uchar)* m, const size_t i, const size_t j);
void gsl_matrix_uchar_set (gsl_matrix_uchar* m, const size_t i, const size_t j, const ubyte x);
ubyte* gsl_matrix_uchar_ptr (gsl_matrix_uchar* m, const size_t i, const size_t j);
const(ubyte)* gsl_matrix_uchar_const_ptr (const(gsl_matrix_uchar)* m, const size_t i, const size_t j);


//gsl_matrix_uint
struct gsl_matrix_uint
{
    size_t size1;
    size_t size2;
    size_t tda;
    uint* data;
    gsl_block_uint* block;
    int owner;
}

struct _gsl_matrix_uint_view
{
    gsl_matrix_uint matrix;
}

struct _gsl_matrix_uint_const_view
{
    gsl_matrix_uint matrix;
}

alias _gsl_matrix_uint_view gsl_matrix_uint_view;
alias const _gsl_matrix_uint_const_view gsl_matrix_uint_const_view;

gsl_matrix_uint* gsl_matrix_uint_alloc (const size_t n1, const size_t n2);
gsl_matrix_uint* gsl_matrix_uint_calloc (const size_t n1, const size_t n2);
gsl_matrix_uint* gsl_matrix_uint_alloc_from_block (gsl_block_uint* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_uint* gsl_matrix_uint_alloc_from_matrix (gsl_matrix_uint* m, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_uint* gsl_vector_uint_alloc_row_from_matrix (gsl_matrix_uint* m, const size_t i);
gsl_vector_uint* gsl_vector_uint_alloc_col_from_matrix (gsl_matrix_uint* m, const size_t j);
void gsl_matrix_uint_free (gsl_matrix_uint* m);
_gsl_matrix_uint_view gsl_matrix_uint_submatrix (gsl_matrix_uint* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_uint_view gsl_matrix_uint_row (gsl_matrix_uint* m, const size_t i);
_gsl_vector_uint_view gsl_matrix_uint_column (gsl_matrix_uint* m, const size_t j);
_gsl_vector_uint_view gsl_matrix_uint_diagonal (gsl_matrix_uint* m);
_gsl_vector_uint_view gsl_matrix_uint_subdiagonal (gsl_matrix_uint* m, const size_t k);
_gsl_vector_uint_view gsl_matrix_uint_superdiagonal (gsl_matrix_uint* m, const size_t k);
_gsl_vector_uint_view gsl_matrix_uint_subrow (gsl_matrix_uint* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_uint_view gsl_matrix_uint_subcolumn (gsl_matrix_uint* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_uint_view gsl_matrix_uint_view_array (uint* base, const size_t n1, const size_t n2);
_gsl_matrix_uint_view gsl_matrix_uint_view_array_with_tda (uint* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_uint_view gsl_matrix_uint_view_vector (gsl_vector_uint* v, const size_t n1, const size_t n2);
_gsl_matrix_uint_view gsl_matrix_uint_view_vector_with_tda (gsl_vector_uint* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_uint_const_view gsl_matrix_uint_const_submatrix (const(gsl_matrix_uint)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_uint_const_view gsl_matrix_uint_const_row (const(gsl_matrix_uint)* m, const size_t i);
_gsl_vector_uint_const_view gsl_matrix_uint_const_column (const(gsl_matrix_uint)* m, const size_t j);
_gsl_vector_uint_const_view gsl_matrix_uint_const_diagonal (const(gsl_matrix_uint)* m);
_gsl_vector_uint_const_view gsl_matrix_uint_const_subdiagonal (const(gsl_matrix_uint)* m, const size_t k);
_gsl_vector_uint_const_view gsl_matrix_uint_const_superdiagonal (const(gsl_matrix_uint)* m, const size_t k);
_gsl_vector_uint_const_view gsl_matrix_uint_const_subrow (const(gsl_matrix_uint)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_uint_const_view gsl_matrix_uint_const_subcolumn (const(gsl_matrix_uint)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_uint_const_view gsl_matrix_uint_const_view_array (const(uint)* base, const size_t n1, const size_t n2);
_gsl_matrix_uint_const_view gsl_matrix_uint_const_view_array_with_tda (const(uint)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_uint_const_view gsl_matrix_uint_const_view_vector (const(gsl_vector_uint)* v, const size_t n1, const size_t n2);
_gsl_matrix_uint_const_view gsl_matrix_uint_const_view_vector_with_tda (const(gsl_vector_uint)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_uint_set_zero (gsl_matrix_uint* m);
void gsl_matrix_uint_set_identity (gsl_matrix_uint* m);
void gsl_matrix_uint_set_all (gsl_matrix_uint* m, uint x);
int gsl_matrix_uint_fread (FILE* stream, gsl_matrix_uint* m);
int gsl_matrix_uint_fwrite (FILE* stream, const(gsl_matrix_uint)* m);
int gsl_matrix_uint_fscanf (FILE* stream, gsl_matrix_uint* m);
int gsl_matrix_uint_fprintf (FILE* stream, const(gsl_matrix_uint)* m, const(char)* format);
int gsl_matrix_uint_memcpy (gsl_matrix_uint* dest, const(gsl_matrix_uint)* src);
int gsl_matrix_uint_swap (gsl_matrix_uint* m1, gsl_matrix_uint* m2);
int gsl_matrix_uint_swap_rows (gsl_matrix_uint* m, const size_t i, const size_t j);
int gsl_matrix_uint_swap_columns (gsl_matrix_uint* m, const size_t i, const size_t j);
int gsl_matrix_uint_swap_rowcol (gsl_matrix_uint* m, const size_t i, const size_t j);
int gsl_matrix_uint_transpose (gsl_matrix_uint* m);
int gsl_matrix_uint_transpose_memcpy (gsl_matrix_uint* dest, const(gsl_matrix_uint)* src);
uint gsl_matrix_uint_max (const(gsl_matrix_uint)* m);
uint gsl_matrix_uint_min (const(gsl_matrix_uint)* m);
void gsl_matrix_uint_minmax (const(gsl_matrix_uint)* m, uint* min_out, uint* max_out);
void gsl_matrix_uint_max_index (const(gsl_matrix_uint)* m, size_t* imax, size_t* jmax);
void gsl_matrix_uint_min_index (const(gsl_matrix_uint)* m, size_t* imin, size_t* jmin);
void gsl_matrix_uint_minmax_index (const(gsl_matrix_uint)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);
int gsl_matrix_uint_equal (const(gsl_matrix_uint)* a, const(gsl_matrix_uint)* b);
int gsl_matrix_uint_isnull (const(gsl_matrix_uint)* m);
int gsl_matrix_uint_ispos (const(gsl_matrix_uint)* m);
int gsl_matrix_uint_isneg (const(gsl_matrix_uint)* m);
int gsl_matrix_uint_isnonneg (const(gsl_matrix_uint)* m);
int gsl_matrix_uint_add (gsl_matrix_uint* a, const(gsl_matrix_uint)* b);
int gsl_matrix_uint_sub (gsl_matrix_uint* a, const(gsl_matrix_uint)* b);
int gsl_matrix_uint_mul_elements (gsl_matrix_uint* a, const(gsl_matrix_uint)* b);
int gsl_matrix_uint_div_elements (gsl_matrix_uint* a, const(gsl_matrix_uint)* b);
int gsl_matrix_uint_scale (gsl_matrix_uint* a, const double x);
int gsl_matrix_uint_add_constant (gsl_matrix_uint* a, const double x);
int gsl_matrix_uint_add_diagonal (gsl_matrix_uint* a, const double x);
int gsl_matrix_uint_get_row (gsl_vector_uint* v, const(gsl_matrix_uint)* m, const size_t i);
int gsl_matrix_uint_get_col (gsl_vector_uint* v, const(gsl_matrix_uint)* m, const size_t j);
int gsl_matrix_uint_set_row (gsl_matrix_uint* m, const size_t i, const(gsl_vector_uint)* v);
int gsl_matrix_uint_set_col (gsl_matrix_uint* m, const size_t j, const(gsl_vector_uint)* v);
uint gsl_matrix_uint_get (const(gsl_matrix_uint)* m, const size_t i, const size_t j);
void gsl_matrix_uint_set (gsl_matrix_uint* m, const size_t i, const size_t j, const uint x);
uint* gsl_matrix_uint_ptr (gsl_matrix_uint* m, const size_t i, const size_t j);
const(uint)* gsl_matrix_uint_const_ptr (const(gsl_matrix_uint)* m, const size_t i, const size_t j);


//gsl_matrix_ulong
struct gsl_matrix_ulong
{
    size_t size1;
    size_t size2;
    size_t tda;
    c_ulong* data;
    gsl_block_ulong* block;
    int owner;
}

struct _gsl_matrix_ulong_view
{
    gsl_matrix_ulong matrix;
}

struct _gsl_matrix_ulong_const_view
{
    gsl_matrix_ulong matrix;
}

alias _gsl_matrix_ulong_view gsl_matrix_ulong_view;
alias const _gsl_matrix_ulong_const_view gsl_matrix_ulong_const_view;

gsl_matrix_ulong* gsl_matrix_ulong_alloc (const size_t n1, const size_t n2);
gsl_matrix_ulong* gsl_matrix_ulong_calloc (const size_t n1, const size_t n2);
gsl_matrix_ulong* gsl_matrix_ulong_alloc_from_block (gsl_block_ulong* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_ulong* gsl_matrix_ulong_alloc_from_matrix (gsl_matrix_ulong* m, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_ulong* gsl_vector_ulong_alloc_row_from_matrix (gsl_matrix_ulong* m, const size_t i);
gsl_vector_ulong* gsl_vector_ulong_alloc_col_from_matrix (gsl_matrix_ulong* m, const size_t j);
void gsl_matrix_ulong_free (gsl_matrix_ulong* m);
_gsl_matrix_ulong_view gsl_matrix_ulong_submatrix (gsl_matrix_ulong* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_ulong_view gsl_matrix_ulong_row (gsl_matrix_ulong* m, const size_t i);
_gsl_vector_ulong_view gsl_matrix_ulong_column (gsl_matrix_ulong* m, const size_t j);
_gsl_vector_ulong_view gsl_matrix_ulong_diagonal (gsl_matrix_ulong* m);
_gsl_vector_ulong_view gsl_matrix_ulong_subdiagonal (gsl_matrix_ulong* m, const size_t k);
_gsl_vector_ulong_view gsl_matrix_ulong_superdiagonal (gsl_matrix_ulong* m, const size_t k);
_gsl_vector_ulong_view gsl_matrix_ulong_subrow (gsl_matrix_ulong* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_ulong_view gsl_matrix_ulong_subcolumn (gsl_matrix_ulong* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_ulong_view gsl_matrix_ulong_view_array (c_ulong* base, const size_t n1, const size_t n2);
_gsl_matrix_ulong_view gsl_matrix_ulong_view_array_with_tda (c_ulong* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_ulong_view gsl_matrix_ulong_view_vector (gsl_vector_ulong* v, const size_t n1, const size_t n2);
_gsl_matrix_ulong_view gsl_matrix_ulong_view_vector_with_tda (gsl_vector_ulong* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_ulong_const_view gsl_matrix_ulong_const_submatrix (const(gsl_matrix_ulong)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_ulong_const_view gsl_matrix_ulong_const_row (const(gsl_matrix_ulong)* m, const size_t i);
_gsl_vector_ulong_const_view gsl_matrix_ulong_const_column (const(gsl_matrix_ulong)* m, const size_t j);
_gsl_vector_ulong_const_view gsl_matrix_ulong_const_diagonal (const(gsl_matrix_ulong)* m);
_gsl_vector_ulong_const_view gsl_matrix_ulong_const_subdiagonal (const(gsl_matrix_ulong)* m, const size_t k);
_gsl_vector_ulong_const_view gsl_matrix_ulong_const_superdiagonal (const(gsl_matrix_ulong)* m, const size_t k);
_gsl_vector_ulong_const_view gsl_matrix_ulong_const_subrow (const(gsl_matrix_ulong)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_ulong_const_view gsl_matrix_ulong_const_subcolumn (const(gsl_matrix_ulong)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_ulong_const_view gsl_matrix_ulong_const_view_array (const(c_ulong)* base, const size_t n1, const size_t n2);
_gsl_matrix_ulong_const_view gsl_matrix_ulong_const_view_array_with_tda (const(c_ulong)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_ulong_const_view gsl_matrix_ulong_const_view_vector (const(gsl_vector_ulong)* v, const size_t n1, const size_t n2);
_gsl_matrix_ulong_const_view gsl_matrix_ulong_const_view_vector_with_tda (const(gsl_vector_ulong)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_ulong_set_zero (gsl_matrix_ulong* m);
void gsl_matrix_ulong_set_identity (gsl_matrix_ulong* m);
void gsl_matrix_ulong_set_all (gsl_matrix_ulong* m, c_ulong x);
int gsl_matrix_ulong_fread (FILE* stream, gsl_matrix_ulong* m);
int gsl_matrix_ulong_fwrite (FILE* stream, const(gsl_matrix_ulong)* m);
int gsl_matrix_ulong_fscanf (FILE* stream, gsl_matrix_ulong* m);
int gsl_matrix_ulong_fprintf (FILE* stream, const(gsl_matrix_ulong)* m, const(char)* format);
int gsl_matrix_ulong_memcpy (gsl_matrix_ulong* dest, const(gsl_matrix_ulong)* src);
int gsl_matrix_ulong_swap (gsl_matrix_ulong* m1, gsl_matrix_ulong* m2);
int gsl_matrix_ulong_swap_rows (gsl_matrix_ulong* m, const size_t i, const size_t j);
int gsl_matrix_ulong_swap_columns (gsl_matrix_ulong* m, const size_t i, const size_t j);
int gsl_matrix_ulong_swap_rowcol (gsl_matrix_ulong* m, const size_t i, const size_t j);
int gsl_matrix_ulong_transpose (gsl_matrix_ulong* m);
int gsl_matrix_ulong_transpose_memcpy (gsl_matrix_ulong* dest, const(gsl_matrix_ulong)* src);
c_ulong gsl_matrix_ulong_max (const(gsl_matrix_ulong)* m);
c_ulong gsl_matrix_ulong_min (const(gsl_matrix_ulong)* m);
void gsl_matrix_ulong_minmax (const(gsl_matrix_ulong)* m, c_ulong* min_out, c_ulong* max_out);
void gsl_matrix_ulong_max_index (const(gsl_matrix_ulong)* m, size_t* imax, size_t* jmax);
void gsl_matrix_ulong_min_index (const(gsl_matrix_ulong)* m, size_t* imin, size_t* jmin);
void gsl_matrix_ulong_minmax_index (const(gsl_matrix_ulong)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);
int gsl_matrix_ulong_equal (const(gsl_matrix_ulong)* a, const(gsl_matrix_ulong)* b);
int gsl_matrix_ulong_isnull (const(gsl_matrix_ulong)* m);
int gsl_matrix_ulong_ispos (const(gsl_matrix_ulong)* m);
int gsl_matrix_ulong_isneg (const(gsl_matrix_ulong)* m);
int gsl_matrix_ulong_isnonneg (const(gsl_matrix_ulong)* m);
int gsl_matrix_ulong_add (gsl_matrix_ulong* a, const(gsl_matrix_ulong)* b);
int gsl_matrix_ulong_sub (gsl_matrix_ulong* a, const(gsl_matrix_ulong)* b);
int gsl_matrix_ulong_mul_elements (gsl_matrix_ulong* a, const(gsl_matrix_ulong)* b);
int gsl_matrix_ulong_div_elements (gsl_matrix_ulong* a, const(gsl_matrix_ulong)* b);
int gsl_matrix_ulong_scale (gsl_matrix_ulong* a, const double x);
int gsl_matrix_ulong_add_constant (gsl_matrix_ulong* a, const double x);
int gsl_matrix_ulong_add_diagonal (gsl_matrix_ulong* a, const double x);
int gsl_matrix_ulong_get_row (gsl_vector_ulong* v, const(gsl_matrix_ulong)* m, const size_t i);
int gsl_matrix_ulong_get_col (gsl_vector_ulong* v, const(gsl_matrix_ulong)* m, const size_t j);
int gsl_matrix_ulong_set_row (gsl_matrix_ulong* m, const size_t i, const(gsl_vector_ulong)* v);
int gsl_matrix_ulong_set_col (gsl_matrix_ulong* m, const size_t j, const(gsl_vector_ulong)* v);
c_ulong gsl_matrix_ulong_get (const(gsl_matrix_ulong)* m, const size_t i, const size_t j);
void gsl_matrix_ulong_set (gsl_matrix_ulong* m, const size_t i, const size_t j, const c_ulong x);
c_ulong* gsl_matrix_ulong_ptr (gsl_matrix_ulong* m, const size_t i, const size_t j);
const(c_ulong)* gsl_matrix_ulong_const_ptr (const(gsl_matrix_ulong)* m, const size_t i, const size_t j);


//gsl_matrix_ushort
struct gsl_matrix_ushort
{
    size_t size1;
    size_t size2;
    size_t tda;
    ushort* data;
    gsl_block_ushort* block;
    int owner;
}

struct _gsl_matrix_ushort_view
{
    gsl_matrix_ushort matrix;
}

struct _gsl_matrix_ushort_const_view
{
    gsl_matrix_ushort matrix;
}

alias _gsl_matrix_ushort_view gsl_matrix_ushort_view;
alias const _gsl_matrix_ushort_const_view gsl_matrix_ushort_const_view;

gsl_matrix_ushort* gsl_matrix_ushort_alloc (const size_t n1, const size_t n2);
gsl_matrix_ushort* gsl_matrix_ushort_calloc (const size_t n1, const size_t n2);
gsl_matrix_ushort* gsl_matrix_ushort_alloc_from_block (gsl_block_ushort* b, const size_t offset, const size_t n1, const size_t n2, const size_t d2);
gsl_matrix_ushort* gsl_matrix_ushort_alloc_from_matrix (gsl_matrix_ushort* m, const size_t k1, const size_t k2, const size_t n1, const size_t n2);
gsl_vector_ushort* gsl_vector_ushort_alloc_row_from_matrix (gsl_matrix_ushort* m, const size_t i);
gsl_vector_ushort* gsl_vector_ushort_alloc_col_from_matrix (gsl_matrix_ushort* m, const size_t j);
void gsl_matrix_ushort_free (gsl_matrix_ushort* m);
_gsl_matrix_ushort_view gsl_matrix_ushort_submatrix (gsl_matrix_ushort* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_ushort_view gsl_matrix_ushort_row (gsl_matrix_ushort* m, const size_t i);
_gsl_vector_ushort_view gsl_matrix_ushort_column (gsl_matrix_ushort* m, const size_t j);
_gsl_vector_ushort_view gsl_matrix_ushort_diagonal (gsl_matrix_ushort* m);
_gsl_vector_ushort_view gsl_matrix_ushort_subdiagonal (gsl_matrix_ushort* m, const size_t k);
_gsl_vector_ushort_view gsl_matrix_ushort_superdiagonal (gsl_matrix_ushort* m, const size_t k);
_gsl_vector_ushort_view gsl_matrix_ushort_subrow (gsl_matrix_ushort* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_ushort_view gsl_matrix_ushort_subcolumn (gsl_matrix_ushort* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_ushort_view gsl_matrix_ushort_view_array (ushort* base, const size_t n1, const size_t n2);
_gsl_matrix_ushort_view gsl_matrix_ushort_view_array_with_tda (ushort* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_ushort_view gsl_matrix_ushort_view_vector (gsl_vector_ushort* v, const size_t n1, const size_t n2);
_gsl_matrix_ushort_view gsl_matrix_ushort_view_vector_with_tda (gsl_vector_ushort* v, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_ushort_const_view gsl_matrix_ushort_const_submatrix (const(gsl_matrix_ushort)* m, const size_t i, const size_t j, const size_t n1, const size_t n2);
_gsl_vector_ushort_const_view gsl_matrix_ushort_const_row (const(gsl_matrix_ushort)* m, const size_t i);
_gsl_vector_ushort_const_view gsl_matrix_ushort_const_column (const(gsl_matrix_ushort)* m, const size_t j);
_gsl_vector_ushort_const_view gsl_matrix_ushort_const_diagonal (const(gsl_matrix_ushort)* m);
_gsl_vector_ushort_const_view gsl_matrix_ushort_const_subdiagonal (const(gsl_matrix_ushort)* m, const size_t k);
_gsl_vector_ushort_const_view gsl_matrix_ushort_const_superdiagonal (const(gsl_matrix_ushort)* m, const size_t k);
_gsl_vector_ushort_const_view gsl_matrix_ushort_const_subrow (const(gsl_matrix_ushort)* m, const size_t i, const size_t offset, const size_t n);
_gsl_vector_ushort_const_view gsl_matrix_ushort_const_subcolumn (const(gsl_matrix_ushort)* m, const size_t j, const size_t offset, const size_t n);
_gsl_matrix_ushort_const_view gsl_matrix_ushort_const_view_array (const(ushort)* base, const size_t n1, const size_t n2);
_gsl_matrix_ushort_const_view gsl_matrix_ushort_const_view_array_with_tda (const(ushort)* base, const size_t n1, const size_t n2, const size_t tda);
_gsl_matrix_ushort_const_view gsl_matrix_ushort_const_view_vector (const(gsl_vector_ushort)* v, const size_t n1, const size_t n2);
_gsl_matrix_ushort_const_view gsl_matrix_ushort_const_view_vector_with_tda (const(gsl_vector_ushort)* v, const size_t n1, const size_t n2, const size_t tda);
void gsl_matrix_ushort_set_zero (gsl_matrix_ushort* m);
void gsl_matrix_ushort_set_identity (gsl_matrix_ushort* m);
void gsl_matrix_ushort_set_all (gsl_matrix_ushort* m, ushort x);
int gsl_matrix_ushort_fread (FILE* stream, gsl_matrix_ushort* m);
int gsl_matrix_ushort_fwrite (FILE* stream, const(gsl_matrix_ushort)* m);
int gsl_matrix_ushort_fscanf (FILE* stream, gsl_matrix_ushort* m);
int gsl_matrix_ushort_fprintf (FILE* stream, const(gsl_matrix_ushort)* m, const(char)* format);
int gsl_matrix_ushort_memcpy (gsl_matrix_ushort* dest, const(gsl_matrix_ushort)* src);
int gsl_matrix_ushort_swap (gsl_matrix_ushort* m1, gsl_matrix_ushort* m2);
int gsl_matrix_ushort_swap_rows (gsl_matrix_ushort* m, const size_t i, const size_t j);
int gsl_matrix_ushort_swap_columns (gsl_matrix_ushort* m, const size_t i, const size_t j);
int gsl_matrix_ushort_swap_rowcol (gsl_matrix_ushort* m, const size_t i, const size_t j);
int gsl_matrix_ushort_transpose (gsl_matrix_ushort* m);
int gsl_matrix_ushort_transpose_memcpy (gsl_matrix_ushort* dest, const(gsl_matrix_ushort)* src);
ushort gsl_matrix_ushort_max (const(gsl_matrix_ushort)* m);
ushort gsl_matrix_ushort_min (const(gsl_matrix_ushort)* m);
void gsl_matrix_ushort_minmax (const(gsl_matrix_ushort)* m, ushort* min_out, ushort* max_out);
void gsl_matrix_ushort_max_index (const(gsl_matrix_ushort)* m, size_t* imax, size_t* jmax);
void gsl_matrix_ushort_min_index (const(gsl_matrix_ushort)* m, size_t* imin, size_t* jmin);
void gsl_matrix_ushort_minmax_index (const(gsl_matrix_ushort)* m, size_t* imin, size_t* jmin, size_t* imax, size_t* jmax);
int gsl_matrix_ushort_equal (const(gsl_matrix_ushort)* a, const(gsl_matrix_ushort)* b);
int gsl_matrix_ushort_isnull (const(gsl_matrix_ushort)* m);
int gsl_matrix_ushort_ispos (const(gsl_matrix_ushort)* m);
int gsl_matrix_ushort_isneg (const(gsl_matrix_ushort)* m);
int gsl_matrix_ushort_isnonneg (const(gsl_matrix_ushort)* m);
int gsl_matrix_ushort_add (gsl_matrix_ushort* a, const(gsl_matrix_ushort)* b);
int gsl_matrix_ushort_sub (gsl_matrix_ushort* a, const(gsl_matrix_ushort)* b);
int gsl_matrix_ushort_mul_elements (gsl_matrix_ushort* a, const(gsl_matrix_ushort)* b);
int gsl_matrix_ushort_div_elements (gsl_matrix_ushort* a, const(gsl_matrix_ushort)* b);
int gsl_matrix_ushort_scale (gsl_matrix_ushort* a, const double x);
int gsl_matrix_ushort_add_constant (gsl_matrix_ushort* a, const double x);
int gsl_matrix_ushort_add_diagonal (gsl_matrix_ushort* a, const double x);
int gsl_matrix_ushort_get_row (gsl_vector_ushort* v, const(gsl_matrix_ushort)* m, const size_t i);
int gsl_matrix_ushort_get_col (gsl_vector_ushort* v, const(gsl_matrix_ushort)* m, const size_t j);
int gsl_matrix_ushort_set_row (gsl_matrix_ushort* m, const size_t i, const(gsl_vector_ushort)* v);
int gsl_matrix_ushort_set_col (gsl_matrix_ushort* m, const size_t j, const(gsl_vector_ushort)* v);
ushort gsl_matrix_ushort_get (const(gsl_matrix_ushort)* m, const size_t i, const size_t j);
void gsl_matrix_ushort_set (gsl_matrix_ushort* m, const size_t i, const size_t j, const ushort x);
ushort* gsl_matrix_ushort_ptr (gsl_matrix_ushort* m, const size_t i, const size_t j);
const(ushort)* gsl_matrix_ushort_const_ptr (const(gsl_matrix_ushort)* m, const size_t i, const size_t j);


































