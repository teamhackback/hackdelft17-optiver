/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.block;
import core.stdc.stdio : FILE;
import core.stdc.config : c_long, c_ulong;
import gsl.errno;


extern (C):

extern __gshared int gsl_check_range;

// gsl_block_char
alias gsl_block_char_struct gsl_block_char;

struct gsl_block_char_struct
{
    size_t size;
    char* data;
}

gsl_block_char* gsl_block_char_alloc (const size_t n);
gsl_block_char* gsl_block_char_calloc (const size_t n);
void gsl_block_char_free (gsl_block_char* b);
int gsl_block_char_fread (FILE* stream, gsl_block_char* b);
int gsl_block_char_fwrite (FILE* stream, const(gsl_block_char)* b);
int gsl_block_char_fscanf (FILE* stream, gsl_block_char* b);
int gsl_block_char_fprintf (FILE* stream, const(gsl_block_char)* b, const(char)* format);
int gsl_block_char_raw_fread (FILE* stream, char* b, const size_t n, const size_t stride);
int gsl_block_char_raw_fwrite (FILE* stream, const(char)* b, const size_t n, const size_t stride);
int gsl_block_char_raw_fscanf (FILE* stream, char* b, const size_t n, const size_t stride);
int gsl_block_char_raw_fprintf (FILE* stream, const(char)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_char_size (const(gsl_block_char)* b);
char* gsl_block_char_data (const(gsl_block_char)* b);

// gsl_block_complex_float
alias gsl_block_complex_float_struct gsl_block_complex_float;

struct gsl_block_complex_float_struct
{
    size_t size;
    float* data;
}

gsl_block_complex_float* gsl_block_complex_float_alloc (const size_t n);
gsl_block_complex_float* gsl_block_complex_float_calloc (const size_t n);
void gsl_block_complex_float_free (gsl_block_complex_float* b);
int gsl_block_complex_float_fread (FILE* stream, gsl_block_complex_float* b);
int gsl_block_complex_float_fwrite (FILE* stream, const(gsl_block_complex_float)* b);
int gsl_block_complex_float_fscanf (FILE* stream, gsl_block_complex_float* b);
int gsl_block_complex_float_fprintf (FILE* stream, const(gsl_block_complex_float)* b, const(char)* format);
int gsl_block_complex_float_raw_fread (FILE* stream, float* b, const size_t n, const size_t stride);
int gsl_block_complex_float_raw_fwrite (FILE* stream, const(float)* b, const size_t n, const size_t stride);
int gsl_block_complex_float_raw_fscanf (FILE* stream, float* b, const size_t n, const size_t stride);
int gsl_block_complex_float_raw_fprintf (FILE* stream, const(float)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_complex_float_size (const(gsl_block_complex_float)* b);
float* gsl_block_complex_float_data (const(gsl_block_complex_float)* b);


//gsl_block_complex
alias gsl_block_complex_struct gsl_block_complex;

struct gsl_block_complex_struct
{
    size_t size;
    double* data;
}

gsl_block_complex* gsl_block_complex_alloc (const size_t n);
gsl_block_complex* gsl_block_complex_calloc (const size_t n);
void gsl_block_complex_free (gsl_block_complex* b);
int gsl_block_complex_fread (FILE* stream, gsl_block_complex* b);
int gsl_block_complex_fwrite (FILE* stream, const(gsl_block_complex)* b);
int gsl_block_complex_fscanf (FILE* stream, gsl_block_complex* b);
int gsl_block_complex_fprintf (FILE* stream, const(gsl_block_complex)* b, const(char)* format);
int gsl_block_complex_raw_fread (FILE* stream, double* b, const size_t n, const size_t stride);
int gsl_block_complex_raw_fwrite (FILE* stream, const(double)* b, const size_t n, const size_t stride);
int gsl_block_complex_raw_fscanf (FILE* stream, double* b, const size_t n, const size_t stride);
int gsl_block_complex_raw_fprintf (FILE* stream, const(double)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_complex_size (const(gsl_block_complex)* b);
double* gsl_block_complex_data (const(gsl_block_complex)* b);


// gsl_block_complex_long_double
alias gsl_block_complex_long_double_struct gsl_block_complex_long_double;

struct gsl_block_complex_long_double_struct
{
    size_t size;
    real* data;
}

gsl_block_complex_long_double* gsl_block_complex_long_double_alloc (const size_t n);
gsl_block_complex_long_double* gsl_block_complex_long_double_calloc (const size_t n);
void gsl_block_complex_long_double_free (gsl_block_complex_long_double* b);
int gsl_block_complex_long_double_fread (FILE* stream, gsl_block_complex_long_double* b);
int gsl_block_complex_long_double_fwrite (FILE* stream, const(gsl_block_complex_long_double)* b);
int gsl_block_complex_long_double_fscanf (FILE* stream, gsl_block_complex_long_double* b);
int gsl_block_complex_long_double_fprintf (FILE* stream, const(gsl_block_complex_long_double)* b, const(char)* format);
int gsl_block_complex_long_double_raw_fread (FILE* stream, real* b, const size_t n, const size_t stride);
int gsl_block_complex_long_double_raw_fwrite (FILE* stream, const(real)* b, const size_t n, const size_t stride);
int gsl_block_complex_long_double_raw_fscanf (FILE* stream, real* b, const size_t n, const size_t stride);
int gsl_block_complex_long_double_raw_fprintf (FILE* stream, const(real)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_complex_long_double_size (const(gsl_block_complex_long_double)* b);
real* gsl_block_complex_long_double_data (const(gsl_block_complex_long_double)* b);


// gsl_block_double
alias gsl_block_struct gsl_block;

struct gsl_block_struct
{
    size_t size;
    double* data;
}

gsl_block* gsl_block_alloc (const size_t n);
gsl_block* gsl_block_calloc (const size_t n);
void gsl_block_free (gsl_block* b);
int gsl_block_fread (FILE* stream, gsl_block* b);
int gsl_block_fwrite (FILE* stream, const(gsl_block)* b);
int gsl_block_fscanf (FILE* stream, gsl_block* b);
int gsl_block_fprintf (FILE* stream, const(gsl_block)* b, const(char)* format);
int gsl_block_raw_fread (FILE* stream, double* b, const size_t n, const size_t stride);
int gsl_block_raw_fwrite (FILE* stream, const(double)* b, const size_t n, const size_t stride);
int gsl_block_raw_fscanf (FILE* stream, double* b, const size_t n, const size_t stride);
int gsl_block_raw_fprintf (FILE* stream, const(double)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_size (const(gsl_block)* b);
double* gsl_block_data (const(gsl_block)* b);


// gsl_block_float
alias gsl_block_float_struct gsl_block_float;

struct gsl_block_float_struct
{
    size_t size;
    float* data;
}

gsl_block_float* gsl_block_float_alloc (const size_t n);
gsl_block_float* gsl_block_float_calloc (const size_t n);
void gsl_block_float_free (gsl_block_float* b);
int gsl_block_float_fread (FILE* stream, gsl_block_float* b);
int gsl_block_float_fwrite (FILE* stream, const(gsl_block_float)* b);
int gsl_block_float_fscanf (FILE* stream, gsl_block_float* b);
int gsl_block_float_fprintf (FILE* stream, const(gsl_block_float)* b, const(char)* format);
int gsl_block_float_raw_fread (FILE* stream, float* b, const size_t n, const size_t stride);
int gsl_block_float_raw_fwrite (FILE* stream, const(float)* b, const size_t n, const size_t stride);
int gsl_block_float_raw_fscanf (FILE* stream, float* b, const size_t n, const size_t stride);
int gsl_block_float_raw_fprintf (FILE* stream, const(float)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_float_size (const(gsl_block_float)* b);
float* gsl_block_float_data (const(gsl_block_float)* b);

// gsl_block_int
alias gsl_block_int_struct gsl_block_int;

struct gsl_block_int_struct
{
    size_t size;
    int* data;
}

gsl_block_int* gsl_block_int_alloc (const size_t n);
gsl_block_int* gsl_block_int_calloc (const size_t n);
void gsl_block_int_free (gsl_block_int* b);
int gsl_block_int_fread (FILE* stream, gsl_block_int* b);
int gsl_block_int_fwrite (FILE* stream, const(gsl_block_int)* b);
int gsl_block_int_fscanf (FILE* stream, gsl_block_int* b);
int gsl_block_int_fprintf (FILE* stream, const(gsl_block_int)* b, const(char)* format);
int gsl_block_int_raw_fread (FILE* stream, int* b, const size_t n, const size_t stride);
int gsl_block_int_raw_fwrite (FILE* stream, const(int)* b, const size_t n, const size_t stride);
int gsl_block_int_raw_fscanf (FILE* stream, int* b, const size_t n, const size_t stride);
int gsl_block_int_raw_fprintf (FILE* stream, const(int)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_int_size (const(gsl_block_int)* b);
int* gsl_block_int_data (const(gsl_block_int)* b);


// gsl_block_long
alias gsl_block_long_struct gsl_block_long;

struct gsl_block_long_struct
{
    size_t size;
    c_long* data;
}

gsl_block_long* gsl_block_long_alloc (const size_t n);
gsl_block_long* gsl_block_long_calloc (const size_t n);
void gsl_block_long_free (gsl_block_long* b);
int gsl_block_long_fread (FILE* stream, gsl_block_long* b);
int gsl_block_long_fwrite (FILE* stream, const(gsl_block_long)* b);
int gsl_block_long_fscanf (FILE* stream, gsl_block_long* b);
int gsl_block_long_fprintf (FILE* stream, const(gsl_block_long)* b, const(char)* format);
int gsl_block_long_raw_fread (FILE* stream, c_long* b, const size_t n, const size_t stride);
int gsl_block_long_raw_fwrite (FILE* stream, const(c_long)* b, const size_t n, const size_t stride);
int gsl_block_long_raw_fscanf (FILE* stream, c_long* b, const size_t n, const size_t stride);
int gsl_block_long_raw_fprintf (FILE* stream, const(c_long)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_long_size (const(gsl_block_long)* b);
c_long* gsl_block_long_data (const(gsl_block_long)* b);


// gsl_block_long_double
alias gsl_block_long_double_struct gsl_block_long_double;

struct gsl_block_long_double_struct
{
    size_t size;
    real* data;
}

gsl_block_long_double* gsl_block_long_double_alloc (const size_t n);
gsl_block_long_double* gsl_block_long_double_calloc (const size_t n);
void gsl_block_long_double_free (gsl_block_long_double* b);
int gsl_block_long_double_fread (FILE* stream, gsl_block_long_double* b);
int gsl_block_long_double_fwrite (FILE* stream, const(gsl_block_long_double)* b);
int gsl_block_long_double_fscanf (FILE* stream, gsl_block_long_double* b);
int gsl_block_long_double_fprintf (FILE* stream, const(gsl_block_long_double)* b, const(char)* format);
int gsl_block_long_double_raw_fread (FILE* stream, real* b, const size_t n, const size_t stride);
int gsl_block_long_double_raw_fwrite (FILE* stream, const(real)* b, const size_t n, const size_t stride);
int gsl_block_long_double_raw_fscanf (FILE* stream, real* b, const size_t n, const size_t stride);
int gsl_block_long_double_raw_fprintf (FILE* stream, const(real)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_long_double_size (const(gsl_block_long_double)* b);
real* gsl_block_long_double_data (const(gsl_block_long_double)* b);


// gsl_block_short
alias gsl_block_short_struct gsl_block_short;

struct gsl_block_short_struct
{
    size_t size;
    short* data;
}

gsl_block_short* gsl_block_short_alloc (const size_t n);
gsl_block_short* gsl_block_short_calloc (const size_t n);
void gsl_block_short_free (gsl_block_short* b);
int gsl_block_short_fread (FILE* stream, gsl_block_short* b);
int gsl_block_short_fwrite (FILE* stream, const(gsl_block_short)* b);
int gsl_block_short_fscanf (FILE* stream, gsl_block_short* b);
int gsl_block_short_fprintf (FILE* stream, const(gsl_block_short)* b, const(char)* format);
int gsl_block_short_raw_fread (FILE* stream, short* b, const size_t n, const size_t stride);
int gsl_block_short_raw_fwrite (FILE* stream, const(short)* b, const size_t n, const size_t stride);
int gsl_block_short_raw_fscanf (FILE* stream, short* b, const size_t n, const size_t stride);
int gsl_block_short_raw_fprintf (FILE* stream, const(short)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_short_size (const(gsl_block_short)* b);
short* gsl_block_short_data (const(gsl_block_short)* b);


// gsl_block_uchar
alias gsl_block_uchar_struct gsl_block_uchar;

struct gsl_block_uchar_struct
{
    size_t size;
    ubyte* data;
}

gsl_block_uchar* gsl_block_uchar_alloc (const size_t n);
gsl_block_uchar* gsl_block_uchar_calloc (const size_t n);
void gsl_block_uchar_free (gsl_block_uchar* b);
int gsl_block_uchar_fread (FILE* stream, gsl_block_uchar* b);
int gsl_block_uchar_fwrite (FILE* stream, const(gsl_block_uchar)* b);
int gsl_block_uchar_fscanf (FILE* stream, gsl_block_uchar* b);
int gsl_block_uchar_fprintf (FILE* stream, const(gsl_block_uchar)* b, const(char)* format);
int gsl_block_uchar_raw_fread (FILE* stream, ubyte* b, const size_t n, const size_t stride);
int gsl_block_uchar_raw_fwrite (FILE* stream, const(ubyte)* b, const size_t n, const size_t stride);
int gsl_block_uchar_raw_fscanf (FILE* stream, ubyte* b, const size_t n, const size_t stride);
int gsl_block_uchar_raw_fprintf (FILE* stream, const(ubyte)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_uchar_size (const(gsl_block_uchar)* b);
ubyte* gsl_block_uchar_data (const(gsl_block_uchar)* b);


// gsl_block_uint
alias gsl_block_uint_struct gsl_block_uint;

struct gsl_block_uint_struct
{
    size_t size;
    uint* data;
}

gsl_block_uint* gsl_block_uint_alloc (const size_t n);
gsl_block_uint* gsl_block_uint_calloc (const size_t n);
void gsl_block_uint_free (gsl_block_uint* b);
int gsl_block_uint_fread (FILE* stream, gsl_block_uint* b);
int gsl_block_uint_fwrite (FILE* stream, const(gsl_block_uint)* b);
int gsl_block_uint_fscanf (FILE* stream, gsl_block_uint* b);
int gsl_block_uint_fprintf (FILE* stream, const(gsl_block_uint)* b, const(char)* format);
int gsl_block_uint_raw_fread (FILE* stream, uint* b, const size_t n, const size_t stride);
int gsl_block_uint_raw_fwrite (FILE* stream, const(uint)* b, const size_t n, const size_t stride);
int gsl_block_uint_raw_fscanf (FILE* stream, uint* b, const size_t n, const size_t stride);
int gsl_block_uint_raw_fprintf (FILE* stream, const(uint)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_uint_size (const(gsl_block_uint)* b);
uint* gsl_block_uint_data (const(gsl_block_uint)* b);


// gsl_block_ulong
alias gsl_block_ulong_struct gsl_block_ulong;

struct gsl_block_ulong_struct
{
    size_t size;
    c_ulong* data;
}

gsl_block_ulong* gsl_block_ulong_alloc (const size_t n);
gsl_block_ulong* gsl_block_ulong_calloc (const size_t n);
void gsl_block_ulong_free (gsl_block_ulong* b);
int gsl_block_ulong_fread (FILE* stream, gsl_block_ulong* b);
int gsl_block_ulong_fwrite (FILE* stream, const(gsl_block_ulong)* b);
int gsl_block_ulong_fscanf (FILE* stream, gsl_block_ulong* b);
int gsl_block_ulong_fprintf (FILE* stream, const(gsl_block_ulong)* b, const(char)* format);
int gsl_block_ulong_raw_fread (FILE* stream, c_ulong* b, const size_t n, const size_t stride);
int gsl_block_ulong_raw_fwrite (FILE* stream, const(c_ulong)* b, const size_t n, const size_t stride);
int gsl_block_ulong_raw_fscanf (FILE* stream, c_ulong* b, const size_t n, const size_t stride);
int gsl_block_ulong_raw_fprintf (FILE* stream, const(c_ulong)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_ulong_size (const(gsl_block_ulong)* b);
c_ulong* gsl_block_ulong_data (const(gsl_block_ulong)* b);


// gsl_block_ushort
alias gsl_block_ushort_struct gsl_block_ushort;

struct gsl_block_ushort_struct
{
    size_t size;
    ushort* data;
}

gsl_block_ushort* gsl_block_ushort_alloc (const size_t n);
gsl_block_ushort* gsl_block_ushort_calloc (const size_t n);
void gsl_block_ushort_free (gsl_block_ushort* b);
int gsl_block_ushort_fread (FILE* stream, gsl_block_ushort* b);
int gsl_block_ushort_fwrite (FILE* stream, const(gsl_block_ushort)* b);
int gsl_block_ushort_fscanf (FILE* stream, gsl_block_ushort* b);
int gsl_block_ushort_fprintf (FILE* stream, const(gsl_block_ushort)* b, const(char)* format);
int gsl_block_ushort_raw_fread (FILE* stream, ushort* b, const size_t n, const size_t stride);
int gsl_block_ushort_raw_fwrite (FILE* stream, const(ushort)* b, const size_t n, const size_t stride);
int gsl_block_ushort_raw_fscanf (FILE* stream, ushort* b, const size_t n, const size_t stride);
int gsl_block_ushort_raw_fprintf (FILE* stream, const(ushort)* b, const size_t n, const size_t stride, const(char)* format);
size_t gsl_block_ushort_size (const(gsl_block_ushort)* b);
ushort* gsl_block_ushort_data (const(gsl_block_ushort)* b);

