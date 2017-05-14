/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.wavelet;
import gsl.errno;
import gsl.vector;
import gsl.matrix;
import gsl.wavelet;

extern (C):

//gsl_wavelet
extern __gshared const(gsl_wavelet_type)* gsl_wavelet_daubechies;
extern __gshared const(gsl_wavelet_type)* gsl_wavelet_daubechies_centered;
extern __gshared const(gsl_wavelet_type)* gsl_wavelet_haar;
extern __gshared const(gsl_wavelet_type)* gsl_wavelet_haar_centered;
extern __gshared const(gsl_wavelet_type)* gsl_wavelet_bspline;
extern __gshared const(gsl_wavelet_type)* gsl_wavelet_bspline_centered;

enum gsl_wavelet_direction
{
    gsl_wavelet_forward = 1,
    gsl_wavelet_backward = -1
}

struct gsl_wavelet_type
{
    const(char)* name;
    int function (const(double*)*, const(double*)*, const(double*)*, const(double*)*, size_t*, size_t*, size_t) init;
}

struct gsl_wavelet
{
    const(gsl_wavelet_type)* type;
    const(double)* h1;
    const(double)* g1;
    const(double)* h2;
    const(double)* g2;
    size_t nc;
    size_t offset;
}

struct gsl_wavelet_workspace
{
    double* scratch;
    size_t n;
}

gsl_wavelet* gsl_wavelet_alloc (const(gsl_wavelet_type)* T, size_t k);
void gsl_wavelet_free (gsl_wavelet* w);
const(char)* gsl_wavelet_name (const(gsl_wavelet)* w);
gsl_wavelet_workspace* gsl_wavelet_workspace_alloc (size_t n);
void gsl_wavelet_workspace_free (gsl_wavelet_workspace* work);
int gsl_wavelet_transform (const(gsl_wavelet)* w, double* data, size_t stride, size_t n, gsl_wavelet_direction dir, gsl_wavelet_workspace* work);
int gsl_wavelet_transform_forward (const(gsl_wavelet)* w, double* data, size_t stride, size_t n, gsl_wavelet_workspace* work);
int gsl_wavelet_transform_inverse (const(gsl_wavelet)* w, double* data, size_t stride, size_t n, gsl_wavelet_workspace* work);

//gsl_wavelet2d
int gsl_wavelet2d_transform (const(gsl_wavelet)* w, double* data, size_t tda, size_t size1, size_t size2, gsl_wavelet_direction dir, gsl_wavelet_workspace* work);
int gsl_wavelet2d_transform_forward (const(gsl_wavelet)* w, double* data, size_t tda, size_t size1, size_t size2, gsl_wavelet_workspace* work);
int gsl_wavelet2d_transform_inverse (const(gsl_wavelet)* w, double* data, size_t tda, size_t size1, size_t size2, gsl_wavelet_workspace* work);
int gsl_wavelet2d_nstransform (const(gsl_wavelet)* w, double* data, size_t tda, size_t size1, size_t size2, gsl_wavelet_direction dir, gsl_wavelet_workspace* work);
int gsl_wavelet2d_nstransform_forward (const(gsl_wavelet)* w, double* data, size_t tda, size_t size1, size_t size2, gsl_wavelet_workspace* work);
int gsl_wavelet2d_nstransform_inverse (const(gsl_wavelet)* w, double* data, size_t tda, size_t size1, size_t size2, gsl_wavelet_workspace* work);
int gsl_wavelet2d_transform_matrix (const(gsl_wavelet)* w, gsl_matrix* a, gsl_wavelet_direction dir, gsl_wavelet_workspace* work);
int gsl_wavelet2d_transform_matrix_forward (const(gsl_wavelet)* w, gsl_matrix* a, gsl_wavelet_workspace* work);
int gsl_wavelet2d_transform_matrix_inverse (const(gsl_wavelet)* w, gsl_matrix* a, gsl_wavelet_workspace* work);
int gsl_wavelet2d_nstransform_matrix (const(gsl_wavelet)* w, gsl_matrix* a, gsl_wavelet_direction dir, gsl_wavelet_workspace* work);
int gsl_wavelet2d_nstransform_matrix_forward (const(gsl_wavelet)* w, gsl_matrix* a, gsl_wavelet_workspace* work);
int gsl_wavelet2d_nstransform_matrix_inverse (const(gsl_wavelet)* w, gsl_matrix* a, gsl_wavelet_workspace* work);