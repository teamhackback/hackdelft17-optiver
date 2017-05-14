/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.sort;
import gsl.vector;
import gsl.errno;
import gsl.permutation;
import core.stdc.config : c_long, c_ulong;
//import core.stdc.float;


//gsl_heapsort
alias int function (const(void)*, const(void)*) gsl_comparison_fn_t;

void gsl_heapsort (void* array, size_t count, size_t size, gsl_comparison_fn_t compare);
int gsl_heapsort_index (size_t* p, const(void)* array, size_t count, size_t size, gsl_comparison_fn_t compare);

//gsl_sort_char
void gsl_sort_char (char* data, const size_t stride, const size_t n);
void gsl_sort2_char (char* data1, const size_t stride1, char* data2, const size_t stride2, const size_t n);
void gsl_sort_char_index (size_t* p, const(char)* data, const size_t stride, const size_t n);
int gsl_sort_char_smallest (char* dest, const size_t k, const(char)* src, const size_t stride, const size_t n);
int gsl_sort_char_smallest_index (size_t* p, const size_t k, const(char)* src, const size_t stride, const size_t n);
int gsl_sort_char_largest (char* dest, const size_t k, const(char)* src, const size_t stride, const size_t n);
int gsl_sort_char_largest_index (size_t* p, const size_t k, const(char)* src, const size_t stride, const size_t n);

//gsl_sort_double
void gsl_sort (double* data, const size_t stride, const size_t n);
void gsl_sort2 (double* data1, const size_t stride1, double* data2, const size_t stride2, const size_t n);
void gsl_sort_index (size_t* p, const(double)* data, const size_t stride, const size_t n);
int gsl_sort_smallest (double* dest, const size_t k, const(double)* src, const size_t stride, const size_t n);
int gsl_sort_smallest_index (size_t* p, const size_t k, const(double)* src, const size_t stride, const size_t n);
int gsl_sort_largest (double* dest, const size_t k, const(double)* src, const size_t stride, const size_t n);
int gsl_sort_largest_index (size_t* p, const size_t k, const(double)* src, const size_t stride, const size_t n);

//gsl_sort_float
void gsl_sort_float (float* data, const size_t stride, const size_t n);
void gsl_sort2_float (float* data1, const size_t stride1, float* data2, const size_t stride2, const size_t n);
void gsl_sort_float_index (size_t* p, const(float)* data, const size_t stride, const size_t n);
int gsl_sort_float_smallest (float* dest, const size_t k, const(float)* src, const size_t stride, const size_t n);
int gsl_sort_float_smallest_index (size_t* p, const size_t k, const(float)* src, const size_t stride, const size_t n);
int gsl_sort_float_largest (float* dest, const size_t k, const(float)* src, const size_t stride, const size_t n);
int gsl_sort_float_largest_index (size_t* p, const size_t k, const(float)* src, const size_t stride, const size_t n);

//gsl_sort_int
void gsl_sort_int (int* data, const size_t stride, const size_t n);
void gsl_sort2_int (int* data1, const size_t stride1, int* data2, const size_t stride2, const size_t n);
void gsl_sort_int_index (size_t* p, const(int)* data, const size_t stride, const size_t n);
int gsl_sort_int_smallest (int* dest, const size_t k, const(int)* src, const size_t stride, const size_t n);
int gsl_sort_int_smallest_index (size_t* p, const size_t k, const(int)* src, const size_t stride, const size_t n);
int gsl_sort_int_largest (int* dest, const size_t k, const(int)* src, const size_t stride, const size_t n);
int gsl_sort_int_largest_index (size_t* p, const size_t k, const(int)* src, const size_t stride, const size_t n);

//gsl_sort_long
void gsl_sort_long (c_long* data, const size_t stride, const size_t n);
void gsl_sort2_long (c_long* data1, const size_t stride1, c_long* data2, const size_t stride2, const size_t n);
void gsl_sort_long_index (size_t* p, const(c_long)* data, const size_t stride, const size_t n);
int gsl_sort_long_smallest (c_long* dest, const size_t k, const(c_long)* src, const size_t stride, const size_t n);
int gsl_sort_long_smallest_index (size_t* p, const size_t k, const(c_long)* src, const size_t stride, const size_t n);
int gsl_sort_long_largest (c_long* dest, const size_t k, const(c_long)* src, const size_t stride, const size_t n);
int gsl_sort_long_largest_index (size_t* p, const size_t k, const(c_long)* src, const size_t stride, const size_t n);

//gsl_sort_long_double
void gsl_sort_long_double (real* data, const size_t stride, const size_t n);
void gsl_sort2_long_double (real* data1, const size_t stride1, real* data2, const size_t stride2, const size_t n);
void gsl_sort_long_double_index (size_t* p, const(real)* data, const size_t stride, const size_t n);
int gsl_sort_long_double_smallest (real* dest, const size_t k, const(real)* src, const size_t stride, const size_t n);
int gsl_sort_long_double_smallest_index (size_t* p, const size_t k, const(real)* src, const size_t stride, const size_t n);
int gsl_sort_long_double_largest (real* dest, const size_t k, const(real)* src, const size_t stride, const size_t n);
int gsl_sort_long_double_largest_index (size_t* p, const size_t k, const(real)* src, const size_t stride, const size_t n);

//gsl_sort_short
void gsl_sort_short (short* data, const size_t stride, const size_t n);
void gsl_sort2_short (short* data1, const size_t stride1, short* data2, const size_t stride2, const size_t n);
void gsl_sort_short_index (size_t* p, const(short)* data, const size_t stride, const size_t n);
int gsl_sort_short_smallest (short* dest, const size_t k, const(short)* src, const size_t stride, const size_t n);
int gsl_sort_short_smallest_index (size_t* p, const size_t k, const(short)* src, const size_t stride, const size_t n);
int gsl_sort_short_largest (short* dest, const size_t k, const(short)* src, const size_t stride, const size_t n);
int gsl_sort_short_largest_index (size_t* p, const size_t k, const(short)* src, const size_t stride, const size_t n);

//gsl_sort_uchar
void gsl_sort_uchar (ubyte* data, const size_t stride, const size_t n);
void gsl_sort2_uchar (ubyte* data1, const size_t stride1, ubyte* data2, const size_t stride2, const size_t n);
void gsl_sort_uchar_index (size_t* p, const(ubyte)* data, const size_t stride, const size_t n);
int gsl_sort_uchar_smallest (ubyte* dest, const size_t k, const(ubyte)* src, const size_t stride, const size_t n);
int gsl_sort_uchar_smallest_index (size_t* p, const size_t k, const(ubyte)* src, const size_t stride, const size_t n);
int gsl_sort_uchar_largest (ubyte* dest, const size_t k, const(ubyte)* src, const size_t stride, const size_t n);
int gsl_sort_uchar_largest_index (size_t* p, const size_t k, const(ubyte)* src, const size_t stride, const size_t n);

//gsl_sort_uint
void gsl_sort_uint (uint* data, const size_t stride, const size_t n);
void gsl_sort2_uint (uint* data1, const size_t stride1, uint* data2, const size_t stride2, const size_t n);
void gsl_sort_uint_index (size_t* p, const(uint)* data, const size_t stride, const size_t n);
int gsl_sort_uint_smallest (uint* dest, const size_t k, const(uint)* src, const size_t stride, const size_t n);
int gsl_sort_uint_smallest_index (size_t* p, const size_t k, const(uint)* src, const size_t stride, const size_t n);
int gsl_sort_uint_largest (uint* dest, const size_t k, const(uint)* src, const size_t stride, const size_t n);
int gsl_sort_uint_largest_index (size_t* p, const size_t k, const(uint)* src, const size_t stride, const size_t n);

//gsl_sort_ulong
void gsl_sort_ulong (c_ulong* data, const size_t stride, const size_t n);
void gsl_sort2_ulong (c_ulong* data1, const size_t stride1, c_ulong* data2, const size_t stride2, const size_t n);
void gsl_sort_ulong_index (size_t* p, const(c_ulong)* data, const size_t stride, const size_t n);
int gsl_sort_ulong_smallest (c_ulong* dest, const size_t k, const(c_ulong)* src, const size_t stride, const size_t n);
int gsl_sort_ulong_smallest_index (size_t* p, const size_t k, const(c_ulong)* src, const size_t stride, const size_t n);
int gsl_sort_ulong_largest (c_ulong* dest, const size_t k, const(c_ulong)* src, const size_t stride, const size_t n);
int gsl_sort_ulong_largest_index (size_t* p, const size_t k, const(c_ulong)* src, const size_t stride, const size_t n);

//gsl_sort_ushort
void gsl_sort_ushort (ushort* data, const size_t stride, const size_t n);
void gsl_sort2_ushort (ushort* data1, const size_t stride1, ushort* data2, const size_t stride2, const size_t n);
void gsl_sort_ushort_index (size_t* p, const(ushort)* data, const size_t stride, const size_t n);
int gsl_sort_ushort_smallest (ushort* dest, const size_t k, const(ushort)* src, const size_t stride, const size_t n);
int gsl_sort_ushort_smallest_index (size_t* p, const size_t k, const(ushort)* src, const size_t stride, const size_t n);
int gsl_sort_ushort_largest (ushort* dest, const size_t k, const(ushort)* src, const size_t stride, const size_t n);
int gsl_sort_ushort_largest_index (size_t* p, const size_t k, const(ushort)* src, const size_t stride, const size_t n);

//gsl_sort_vector_char
void gsl_sort_vector_char (gsl_vector_char* v);
void gsl_sort_vector2_char (gsl_vector_char* v1, gsl_vector_char* v2);
int gsl_sort_vector_char_index (gsl_permutation* p, const(gsl_vector_char)* v);
int gsl_sort_vector_char_smallest (char* dest, const size_t k, const(gsl_vector_char)* v);
int gsl_sort_vector_char_largest (char* dest, const size_t k, const(gsl_vector_char)* v);
int gsl_sort_vector_char_smallest_index (size_t* p, const size_t k, const(gsl_vector_char)* v);
int gsl_sort_vector_char_largest_index (size_t* p, const size_t k, const(gsl_vector_char)* v);

//gsl_sort_vector
void gsl_sort_vector (gsl_vector* v);
void gsl_sort_vector2 (gsl_vector* v1, gsl_vector* v2);
int gsl_sort_vector_index (gsl_permutation* p, const(gsl_vector)* v);
int gsl_sort_vector_smallest (double* dest, const size_t k, const(gsl_vector)* v);
int gsl_sort_vector_largest (double* dest, const size_t k, const(gsl_vector)* v);
int gsl_sort_vector_smallest_index (size_t* p, const size_t k, const(gsl_vector)* v);
int gsl_sort_vector_largest_index (size_t* p, const size_t k, const(gsl_vector)* v);

//gsl_sort_vector_float
void gsl_sort_vector_float (gsl_vector_float* v);
void gsl_sort_vector2_float (gsl_vector_float* v1, gsl_vector_float* v2);
int gsl_sort_vector_float_index (gsl_permutation* p, const(gsl_vector_float)* v);
int gsl_sort_vector_float_smallest (float* dest, const size_t k, const(gsl_vector_float)* v);
int gsl_sort_vector_float_largest (float* dest, const size_t k, const(gsl_vector_float)* v);
int gsl_sort_vector_float_smallest_index (size_t* p, const size_t k, const(gsl_vector_float)* v);
int gsl_sort_vector_float_largest_index (size_t* p, const size_t k, const(gsl_vector_float)* v);

//gsl_sort_vector_int
void gsl_sort_vector_int (gsl_vector_int* v);
void gsl_sort_vector2_int (gsl_vector_int* v1, gsl_vector_int* v2);
int gsl_sort_vector_int_index (gsl_permutation* p, const(gsl_vector_int)* v);
int gsl_sort_vector_int_smallest (int* dest, const size_t k, const(gsl_vector_int)* v);
int gsl_sort_vector_int_largest (int* dest, const size_t k, const(gsl_vector_int)* v);
int gsl_sort_vector_int_smallest_index (size_t* p, const size_t k, const(gsl_vector_int)* v);
int gsl_sort_vector_int_largest_index (size_t* p, const size_t k, const(gsl_vector_int)* v);

//gsl_sort_vector_long
void gsl_sort_vector_long (gsl_vector_long* v);
void gsl_sort_vector2_long (gsl_vector_long* v1, gsl_vector_long* v2);
int gsl_sort_vector_long_index (gsl_permutation* p, const(gsl_vector_long)* v);
int gsl_sort_vector_long_smallest (c_long* dest, const size_t k, const(gsl_vector_long)* v);
int gsl_sort_vector_long_largest (c_long* dest, const size_t k, const(gsl_vector_long)* v);
int gsl_sort_vector_long_smallest_index (size_t* p, const size_t k, const(gsl_vector_long)* v);
int gsl_sort_vector_long_largest_index (size_t* p, const size_t k, const(gsl_vector_long)* v);

//gsl_sort_vector_long_double
void gsl_sort_vector_long_double (gsl_vector_long_double* v);
void gsl_sort_vector2_long_double (gsl_vector_long_double* v1, gsl_vector_long_double* v2);
int gsl_sort_vector_long_double_index (gsl_permutation* p, const(gsl_vector_long_double)* v);
int gsl_sort_vector_long_double_smallest (real* dest, const size_t k, const(gsl_vector_long_double)* v);
int gsl_sort_vector_long_double_largest (real* dest, const size_t k, const(gsl_vector_long_double)* v);
int gsl_sort_vector_long_double_smallest_index (size_t* p, const size_t k, const(gsl_vector_long_double)* v);
int gsl_sort_vector_long_double_largest_index (size_t* p, const size_t k, const(gsl_vector_long_double)* v);

//gsl_sort_vector_short
void gsl_sort_vector_short (gsl_vector_short* v);
void gsl_sort_vector2_short (gsl_vector_short* v1, gsl_vector_short* v2);
int gsl_sort_vector_short_index (gsl_permutation* p, const(gsl_vector_short)* v);
int gsl_sort_vector_short_smallest (short* dest, const size_t k, const(gsl_vector_short)* v);
int gsl_sort_vector_short_largest (short* dest, const size_t k, const(gsl_vector_short)* v);
int gsl_sort_vector_short_smallest_index (size_t* p, const size_t k, const(gsl_vector_short)* v);
int gsl_sort_vector_short_largest_index (size_t* p, const size_t k, const(gsl_vector_short)* v);

//gsl_sort_vector_uchar
void gsl_sort_vector_uchar (gsl_vector_uchar* v);
void gsl_sort_vector2_uchar (gsl_vector_uchar* v1, gsl_vector_uchar* v2);
int gsl_sort_vector_uchar_index (gsl_permutation* p, const(gsl_vector_uchar)* v);
int gsl_sort_vector_uchar_smallest (ubyte* dest, const size_t k, const(gsl_vector_uchar)* v);
int gsl_sort_vector_uchar_largest (ubyte* dest, const size_t k, const(gsl_vector_uchar)* v);
int gsl_sort_vector_uchar_smallest_index (size_t* p, const size_t k, const(gsl_vector_uchar)* v);
int gsl_sort_vector_uchar_largest_index (size_t* p, const size_t k, const(gsl_vector_uchar)* v);

//gsl_sort_vector_uint
void gsl_sort_vector_uint (gsl_vector_uint* v);
void gsl_sort_vector2_uint (gsl_vector_uint* v1, gsl_vector_uint* v2);
int gsl_sort_vector_uint_index (gsl_permutation* p, const(gsl_vector_uint)* v);
int gsl_sort_vector_uint_smallest (uint* dest, const size_t k, const(gsl_vector_uint)* v);
int gsl_sort_vector_uint_largest (uint* dest, const size_t k, const(gsl_vector_uint)* v);
int gsl_sort_vector_uint_smallest_index (size_t* p, const size_t k, const(gsl_vector_uint)* v);
int gsl_sort_vector_uint_largest_index (size_t* p, const size_t k, const(gsl_vector_uint)* v);

//gsl_sort_vector_ulong
void gsl_sort_vector_ulong (gsl_vector_ulong* v);
void gsl_sort_vector2_ulong (gsl_vector_ulong* v1, gsl_vector_ulong* v2);
int gsl_sort_vector_ulong_index (gsl_permutation* p, const(gsl_vector_ulong)* v);
int gsl_sort_vector_ulong_smallest (c_ulong* dest, const size_t k, const(gsl_vector_ulong)* v);
int gsl_sort_vector_ulong_largest (c_ulong* dest, const size_t k, const(gsl_vector_ulong)* v);
int gsl_sort_vector_ulong_smallest_index (size_t* p, const size_t k, const(gsl_vector_ulong)* v);
int gsl_sort_vector_ulong_largest_index (size_t* p, const size_t k, const(gsl_vector_ulong)* v);

//gsl_sort_vector_ushort
void gsl_sort_vector_ushort (gsl_vector_ushort* v);
void gsl_sort_vector2_ushort (gsl_vector_ushort* v1, gsl_vector_ushort* v2);
int gsl_sort_vector_ushort_index (gsl_permutation* p, const(gsl_vector_ushort)* v);
int gsl_sort_vector_ushort_smallest (ushort* dest, const size_t k, const(gsl_vector_ushort)* v);
int gsl_sort_vector_ushort_largest (ushort* dest, const size_t k, const(gsl_vector_ushort)* v);
int gsl_sort_vector_ushort_smallest_index (size_t* p, const size_t k, const(gsl_vector_ushort)* v);
int gsl_sort_vector_ushort_largest_index (size_t* p, const size_t k, const(gsl_vector_ushort)* v);
