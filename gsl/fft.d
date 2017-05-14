/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.fft;
import gsl.complex;

extern (C):


//gsl_fft
enum gsl_fft_direction
{
    gsl_fft_forward = -1,
    gsl_fft_backward = 1
}

//gsl_dft_complex
int gsl_dft_complex_forward (const(double)* data, const size_t stride, const size_t n, double* result);
int gsl_dft_complex_backward (const(double)* data, const size_t stride, const size_t n, double* result);
int gsl_dft_complex_inverse (const(double)* data, const size_t stride, const size_t n, double* result);
int gsl_dft_complex_transform (const(double)* data, const size_t stride, const size_t n, double* result, const gsl_fft_direction sign);

//gsl_dft_complex_float
int gsl_dft_complex_float_forward (const(float)* data, const size_t stride, const size_t n, float* result);
int gsl_dft_complex_float_backward (const(float)* data, const size_t stride, const size_t n, float* result);
int gsl_dft_complex_float_inverse (const(float)* data, const size_t stride, const size_t n, float* result);
int gsl_dft_complex_float_transform (const(float)* data, const size_t stride, const size_t n, float* result, const gsl_fft_direction sign);

//gsl_fft_complex
struct gsl_fft_complex_wavetable
{
    size_t n;
    size_t nf;
    size_t[64] factor;
    gsl_complex*[64] twiddle;
    gsl_complex* trig;
}

struct gsl_fft_complex_workspace
{
    size_t n;
    double* scratch;
}

int gsl_fft_complex_radix2_forward (gsl_complex_packed_array data, const size_t stride, const size_t n);
int gsl_fft_complex_radix2_backward (gsl_complex_packed_array data, const size_t stride, const size_t n);
int gsl_fft_complex_radix2_inverse (gsl_complex_packed_array data, const size_t stride, const size_t n);
int gsl_fft_complex_radix2_transform (gsl_complex_packed_array data, const size_t stride, const size_t n, const gsl_fft_direction sign);
int gsl_fft_complex_radix2_dif_forward (gsl_complex_packed_array data, const size_t stride, const size_t n);
int gsl_fft_complex_radix2_dif_backward (gsl_complex_packed_array data, const size_t stride, const size_t n);
int gsl_fft_complex_radix2_dif_inverse (gsl_complex_packed_array data, const size_t stride, const size_t n);
int gsl_fft_complex_radix2_dif_transform (gsl_complex_packed_array data, const size_t stride, const size_t n, const gsl_fft_direction sign);
gsl_fft_complex_wavetable* gsl_fft_complex_wavetable_alloc (size_t n);
void gsl_fft_complex_wavetable_free (gsl_fft_complex_wavetable* wavetable);
gsl_fft_complex_workspace* gsl_fft_complex_workspace_alloc (size_t n);
void gsl_fft_complex_workspace_free (gsl_fft_complex_workspace* workspace);
int gsl_fft_complex_memcpy (gsl_fft_complex_wavetable* dest, gsl_fft_complex_wavetable* src);
int gsl_fft_complex_forward (gsl_complex_packed_array data, const size_t stride, const size_t n, const(gsl_fft_complex_wavetable)* wavetable, gsl_fft_complex_workspace* work);
int gsl_fft_complex_backward (gsl_complex_packed_array data, const size_t stride, const size_t n, const(gsl_fft_complex_wavetable)* wavetable, gsl_fft_complex_workspace* work);
int gsl_fft_complex_inverse (gsl_complex_packed_array data, const size_t stride, const size_t n, const(gsl_fft_complex_wavetable)* wavetable, gsl_fft_complex_workspace* work);
int gsl_fft_complex_transform (gsl_complex_packed_array data, const size_t stride, const size_t n, const(gsl_fft_complex_wavetable)* wavetable, gsl_fft_complex_workspace* work, const gsl_fft_direction sign);


//gsl_fft_complex_float
struct gsl_fft_complex_wavetable_float
{
    size_t n;
    size_t nf;
    size_t[64] factor;
    gsl_complex_float*[64] twiddle;
    gsl_complex_float* trig;
}

struct gsl_fft_complex_workspace_float
{
    size_t n;
    float* scratch;
}

int gsl_fft_complex_float_radix2_forward (gsl_complex_packed_array_float data, const size_t stride, const size_t n);
int gsl_fft_complex_float_radix2_backward (gsl_complex_packed_array_float data, const size_t stride, const size_t n);
int gsl_fft_complex_float_radix2_inverse (gsl_complex_packed_array_float data, const size_t stride, const size_t n);
int gsl_fft_complex_float_radix2_transform (gsl_complex_packed_array_float data, const size_t stride, const size_t n, const gsl_fft_direction sign);
int gsl_fft_complex_float_radix2_dif_forward (gsl_complex_packed_array_float data, const size_t stride, const size_t n);
int gsl_fft_complex_float_radix2_dif_backward (gsl_complex_packed_array_float data, const size_t stride, const size_t n);
int gsl_fft_complex_float_radix2_dif_inverse (gsl_complex_packed_array_float data, const size_t stride, const size_t n);
int gsl_fft_complex_float_radix2_dif_transform (gsl_complex_packed_array_float data, const size_t stride, const size_t n, const gsl_fft_direction sign);
gsl_fft_complex_wavetable_float* gsl_fft_complex_wavetable_float_alloc (size_t n);
void gsl_fft_complex_wavetable_float_free (gsl_fft_complex_wavetable_float* wavetable);
gsl_fft_complex_workspace_float* gsl_fft_complex_workspace_float_alloc (size_t n);
void gsl_fft_complex_workspace_float_free (gsl_fft_complex_workspace_float* workspace);
int gsl_fft_complex_float_memcpy (gsl_fft_complex_wavetable_float* dest, gsl_fft_complex_wavetable_float* src);
int gsl_fft_complex_float_forward (gsl_complex_packed_array_float data, const size_t stride, const size_t n, const(gsl_fft_complex_wavetable_float)* wavetable, gsl_fft_complex_workspace_float* work);
int gsl_fft_complex_float_backward (gsl_complex_packed_array_float data, const size_t stride, const size_t n, const(gsl_fft_complex_wavetable_float)* wavetable, gsl_fft_complex_workspace_float* work);
int gsl_fft_complex_float_inverse (gsl_complex_packed_array_float data, const size_t stride, const size_t n, const(gsl_fft_complex_wavetable_float)* wavetable, gsl_fft_complex_workspace_float* work);
int gsl_fft_complex_float_transform (gsl_complex_packed_array_float data, const size_t stride, const size_t n, const(gsl_fft_complex_wavetable_float)* wavetable, gsl_fft_complex_workspace_float* work, const gsl_fft_direction sign);


//gsl_fft_halfcomplex
struct gsl_fft_halfcomplex_wavetable
{
    size_t n;
    size_t nf;
    size_t[64] factor;
    gsl_complex*[64] twiddle;
    gsl_complex* trig;
}

int gsl_fft_halfcomplex_radix2_backward (double* data, const size_t stride, const size_t n);
int gsl_fft_halfcomplex_radix2_inverse (double* data, const size_t stride, const size_t n);
int gsl_fft_halfcomplex_radix2_transform (double* data, const size_t stride, const size_t n);
gsl_fft_halfcomplex_wavetable* gsl_fft_halfcomplex_wavetable_alloc (size_t n);
void gsl_fft_halfcomplex_wavetable_free (gsl_fft_halfcomplex_wavetable* wavetable);
int gsl_fft_halfcomplex_backward (double* data, const size_t stride, const size_t n, const(gsl_fft_halfcomplex_wavetable)* wavetable, gsl_fft_real_workspace* work);
int gsl_fft_halfcomplex_inverse (double* data, const size_t stride, const size_t n, const(gsl_fft_halfcomplex_wavetable)* wavetable, gsl_fft_real_workspace* work);
int gsl_fft_halfcomplex_transform (double* data, const size_t stride, const size_t n, const(gsl_fft_halfcomplex_wavetable)* wavetable, gsl_fft_real_workspace* work);
int gsl_fft_halfcomplex_unpack (const(double)* halfcomplex_coefficient, double* complex_coefficient, const size_t stride, const size_t n);
int gsl_fft_halfcomplex_radix2_unpack (const(double)* halfcomplex_coefficient, double* complex_coefficient, const size_t stride, const size_t n);


//gsl_fft_halfcomplex_float
struct gsl_fft_halfcomplex_wavetable_float
{
    size_t n;
    size_t nf;
    size_t[64] factor;
    gsl_complex_float*[64] twiddle;
    gsl_complex_float* trig;
}

int gsl_fft_halfcomplex_float_radix2_backward (float* data, const size_t stride, const size_t n);
int gsl_fft_halfcomplex_float_radix2_inverse (float* data, const size_t stride, const size_t n);
int gsl_fft_halfcomplex_float_radix2_transform (float* data, const size_t stride, const size_t n);
gsl_fft_halfcomplex_wavetable_float* gsl_fft_halfcomplex_wavetable_float_alloc (size_t n);
void gsl_fft_halfcomplex_wavetable_float_free (gsl_fft_halfcomplex_wavetable_float* wavetable);
int gsl_fft_halfcomplex_float_backward (float* data, const size_t stride, const size_t n, const(gsl_fft_halfcomplex_wavetable_float)* wavetable, gsl_fft_real_workspace_float* work);
int gsl_fft_halfcomplex_float_inverse (float* data, const size_t stride, const size_t n, const(gsl_fft_halfcomplex_wavetable_float)* wavetable, gsl_fft_real_workspace_float* work);
int gsl_fft_halfcomplex_float_transform (float* data, const size_t stride, const size_t n, const(gsl_fft_halfcomplex_wavetable_float)* wavetable, gsl_fft_real_workspace_float* work);
int gsl_fft_halfcomplex_float_unpack (const(float)* halfcomplex_coefficient, float* complex_coefficient, const size_t stride, const size_t n);
int gsl_fft_halfcomplex_float_radix2_unpack (const(float)* halfcomplex_coefficient, float* complex_coefficient, const size_t stride, const size_t n);


//gsl_fft_real
struct gsl_fft_real_wavetable
{
    size_t n;
    size_t nf;
    size_t[64] factor;
    gsl_complex*[64] twiddle;
    gsl_complex* trig;
}

struct gsl_fft_real_workspace
{
    size_t n;
    double* scratch;
}

int gsl_fft_real_radix2_transform (double* data, const size_t stride, const size_t n);
gsl_fft_real_wavetable* gsl_fft_real_wavetable_alloc (size_t n);
void gsl_fft_real_wavetable_free (gsl_fft_real_wavetable* wavetable);
gsl_fft_real_workspace* gsl_fft_real_workspace_alloc (size_t n);
void gsl_fft_real_workspace_free (gsl_fft_real_workspace* workspace);
int gsl_fft_real_transform (double* data, const size_t stride, const size_t n, const(gsl_fft_real_wavetable)* wavetable, gsl_fft_real_workspace* work);
int gsl_fft_real_unpack (const(double)* real_coefficient, double* complex_coefficient, const size_t stride, const size_t n);


//gsl_fft_real_float
struct gsl_fft_real_wavetable_float
{
    size_t n;
    size_t nf;
    size_t[64] factor;
    gsl_complex_float*[64] twiddle;
    gsl_complex_float* trig;
}

struct gsl_fft_real_workspace_float
{
    size_t n;
    float* scratch;
}

int gsl_fft_real_float_radix2_transform (float* data, const size_t stride, const size_t n);
gsl_fft_real_wavetable_float* gsl_fft_real_wavetable_float_alloc (size_t n);
void gsl_fft_real_wavetable_float_free (gsl_fft_real_wavetable_float* wavetable);
gsl_fft_real_workspace_float* gsl_fft_real_workspace_float_alloc (size_t n);
void gsl_fft_real_workspace_float_free (gsl_fft_real_workspace_float* workspace);
int gsl_fft_real_float_transform (float* data, const size_t stride, const size_t n, const(gsl_fft_real_wavetable_float)* wavetable, gsl_fft_real_workspace_float* work);
int gsl_fft_real_float_unpack (const(float)* real_float_coefficient, float* complex_coefficient, const size_t stride, const size_t n);
