/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.interpolation;

extern (C):

//gsl_interp
extern __gshared const(gsl_interp_type)* gsl_interp_linear;
extern __gshared const(gsl_interp_type)* gsl_interp_polynomial;
extern __gshared const(gsl_interp_type)* gsl_interp_cspline;
extern __gshared const(gsl_interp_type)* gsl_interp_cspline_periodic;
extern __gshared const(gsl_interp_type)* gsl_interp_akima;
extern __gshared const(gsl_interp_type)* gsl_interp_akima_periodic;
extern __gshared const(gsl_interp_type)* gsl_interp_steffen;

struct gsl_interp_accel
{
    size_t cache;
    size_t miss_count;
    size_t hit_count;
}

struct gsl_interp_type
{
    const(char)* name;
    uint min_size;
    void* function (size_t) alloc;
    int function (void*, const(double)*, const(double)*, size_t) init;
    int function (const(void)*, const(double)*, const(double)*, size_t, double, gsl_interp_accel*, double*) eval;
    int function (const(void)*, const(double)*, const(double)*, size_t, double, gsl_interp_accel*, double*) eval_deriv;
    int function (const(void)*, const(double)*, const(double)*, size_t, double, gsl_interp_accel*, double*) eval_deriv2;
    int function (const(void)*, const(double)*, const(double)*, size_t, gsl_interp_accel*, double, double, double*) eval_integ;
    void function (void*) free;
}

struct gsl_interp
{
    const(gsl_interp_type)* type;
    double xmin;
    double xmax;
    size_t size;
    void* state;
}

gsl_interp_accel* gsl_interp_accel_alloc ();
int gsl_interp_accel_reset (gsl_interp_accel* a);
void gsl_interp_accel_free (gsl_interp_accel* a);
gsl_interp* gsl_interp_alloc (const(gsl_interp_type)* T, size_t n);
int gsl_interp_init (gsl_interp* obj, const(double)* xa, const(double)* ya, size_t size);
const(char)* gsl_interp_name (const(gsl_interp)* interp);
uint gsl_interp_min_size (const(gsl_interp)* interp);
uint gsl_interp_type_min_size (const(gsl_interp_type)* T);
int gsl_interp_eval_e (const(gsl_interp)* obj, const(double)* xa, const(double)* ya, double x, gsl_interp_accel* a, double* y);
double gsl_interp_eval (const(gsl_interp)* obj, const(double)* xa, const(double)* ya, double x, gsl_interp_accel* a);
int gsl_interp_eval_deriv_e (const(gsl_interp)* obj, const(double)* xa, const(double)* ya, double x, gsl_interp_accel* a, double* d);
double gsl_interp_eval_deriv (const(gsl_interp)* obj, const(double)* xa, const(double)* ya, double x, gsl_interp_accel* a);
int gsl_interp_eval_deriv2_e (const(gsl_interp)* obj, const(double)* xa, const(double)* ya, double x, gsl_interp_accel* a, double* d2);
double gsl_interp_eval_deriv2 (const(gsl_interp)* obj, const(double)* xa, const(double)* ya, double x, gsl_interp_accel* a);
int gsl_interp_eval_integ_e (const(gsl_interp)* obj, const(double)* xa, const(double)* ya, double a, double b, gsl_interp_accel* acc, double* result);
double gsl_interp_eval_integ (const(gsl_interp)* obj, const(double)* xa, const(double)* ya, double a, double b, gsl_interp_accel* acc);
void gsl_interp_free (gsl_interp* interp);
size_t gsl_interp_bsearch (const(double)* x_array, double x, size_t index_lo, size_t index_hi);
size_t gsl_interp_accel_find (gsl_interp_accel* a, const(double)* x_array, size_t size, double x);


//gsl_interp2d
extern __gshared const(gsl_interp2d_type)* gsl_interp2d_bilinear;
extern __gshared const(gsl_interp2d_type)* gsl_interp2d_bicubic;

struct gsl_interp2d_type
{
    const(char)* name;
    uint min_size;
    void* function (size_t, size_t) alloc;
    int function (void*, const(double)*, const(double)*, const(double)*, size_t, size_t) init;
    int function (const(void)*, const(double)*, const(double)*, const(double)*, size_t, size_t, double, double, gsl_interp_accel*, gsl_interp_accel*, double*) eval;
    int function (const(void)*, const(double)*, const(double)*, const(double)*, size_t, size_t, double, double, gsl_interp_accel*, gsl_interp_accel*, double*) eval_deriv_x;
    int function (const(void)*, const(double)*, const(double)*, const(double)*, size_t, size_t, double, double, gsl_interp_accel*, gsl_interp_accel*, double*) eval_deriv_y;
    int function (const(void)*, const(double)*, const(double)*, const(double)*, size_t, size_t, double, double, gsl_interp_accel*, gsl_interp_accel*, double*) eval_deriv_xx;
    int function (const(void)*, const(double)*, const(double)*, const(double)*, size_t, size_t, double, double, gsl_interp_accel*, gsl_interp_accel*, double*) eval_deriv_xy;
    int function (const(void)*, const(double)*, const(double)*, const(double)*, size_t, size_t, double, double, gsl_interp_accel*, gsl_interp_accel*, double*) eval_deriv_yy;
    void function (void*) free;
}

struct gsl_interp2d
{
    const(gsl_interp2d_type)* type;
    double xmin;
    double xmax;
    double ymin;
    double ymax;
    size_t xsize;
    size_t ysize;
    void* state;
}

gsl_interp2d* gsl_interp2d_alloc (const(gsl_interp2d_type)* T, const size_t xsize, const size_t ysize);
const(char)* gsl_interp2d_name (const(gsl_interp2d)* interp);
size_t gsl_interp2d_min_size (const(gsl_interp2d)* interp);
size_t gsl_interp2d_type_min_size (const(gsl_interp2d_type)* T);
int gsl_interp2d_set (const(gsl_interp2d)* interp, double* zarr, const size_t i, const size_t j, const double z);
double gsl_interp2d_get (const(gsl_interp2d)* interp, const(double)* zarr, const size_t i, const size_t j);
size_t gsl_interp2d_idx (const(gsl_interp2d)* interp, const size_t i, const size_t j);
int gsl_interp2d_init (gsl_interp2d* interp, const(double)* xa, const(double)* ya, const(double)* za, const size_t xsize, const size_t ysize);
void gsl_interp2d_free (gsl_interp2d* interp);
double gsl_interp2d_eval (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
double gsl_interp2d_eval_extrap (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
int gsl_interp2d_eval_e (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);
int gsl_interp2d_eval_e_extrap (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);
double gsl_interp2d_eval_deriv_x (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
int gsl_interp2d_eval_deriv_x_e (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);
double gsl_interp2d_eval_deriv_y (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
int gsl_interp2d_eval_deriv_y_e (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);
double gsl_interp2d_eval_deriv_xx (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
int gsl_interp2d_eval_deriv_xx_e (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);
double gsl_interp2d_eval_deriv_yy (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
int gsl_interp2d_eval_deriv_yy_e (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);
double gsl_interp2d_eval_deriv_xy (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
int gsl_interp2d_eval_deriv_xy_e (const(gsl_interp2d)* interp, const(double)* xarr, const(double)* yarr, const(double)* zarr, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);


//gsl_spline
struct gsl_spline
{
    gsl_interp* interp;
    double* x;
    double* y;
    size_t size;
}

gsl_spline* gsl_spline_alloc (const(gsl_interp_type)* T, size_t size);
int gsl_spline_init (gsl_spline* spline, const(double)* xa, const(double)* ya, size_t size);
const(char)* gsl_spline_name (const(gsl_spline)* spline);
uint gsl_spline_min_size (const(gsl_spline)* spline);
int gsl_spline_eval_e (const(gsl_spline)* spline, double x, gsl_interp_accel* a, double* y);
double gsl_spline_eval (const(gsl_spline)* spline, double x, gsl_interp_accel* a);
int gsl_spline_eval_deriv_e (const(gsl_spline)* spline, double x, gsl_interp_accel* a, double* y);
double gsl_spline_eval_deriv (const(gsl_spline)* spline, double x, gsl_interp_accel* a);
int gsl_spline_eval_deriv2_e (const(gsl_spline)* spline, double x, gsl_interp_accel* a, double* y);
double gsl_spline_eval_deriv2 (const(gsl_spline)* spline, double x, gsl_interp_accel* a);
int gsl_spline_eval_integ_e (const(gsl_spline)* spline, double a, double b, gsl_interp_accel* acc, double* y);
double gsl_spline_eval_integ (const(gsl_spline)* spline, double a, double b, gsl_interp_accel* acc);
void gsl_spline_free (gsl_spline* spline);


//gsl_spline2d
struct gsl_spline2d
{
    gsl_interp2d interp_object;
    double* xarr;
    double* yarr;
    double* zarr;
}

gsl_spline2d* gsl_spline2d_alloc (const(gsl_interp2d_type)* T, size_t xsize, size_t ysize);
int gsl_spline2d_init (gsl_spline2d* interp, const(double)* xa, const(double)* ya, const(double)* za, size_t xsize, size_t ysize);
void gsl_spline2d_free (gsl_spline2d* interp);
double gsl_spline2d_eval (const(gsl_spline2d)* interp, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
int gsl_spline2d_eval_e (const(gsl_spline2d)* interp, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);
double gsl_spline2d_eval_deriv_x (const(gsl_spline2d)* interp, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
int gsl_spline2d_eval_deriv_x_e (const(gsl_spline2d)* interp, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);
double gsl_spline2d_eval_deriv_y (const(gsl_spline2d)* interp, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
int gsl_spline2d_eval_deriv_y_e (const(gsl_spline2d)* interp, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);
double gsl_spline2d_eval_deriv_xx (const(gsl_spline2d)* interp, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
int gsl_spline2d_eval_deriv_xx_e (const(gsl_spline2d)* interp, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);
double gsl_spline2d_eval_deriv_yy (const(gsl_spline2d)* interp, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
int gsl_spline2d_eval_deriv_yy_e (const(gsl_spline2d)* interp, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);
double gsl_spline2d_eval_deriv_xy (const(gsl_spline2d)* interp, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya);
int gsl_spline2d_eval_deriv_xy_e (const(gsl_spline2d)* interp, const double x, const double y, gsl_interp_accel* xa, gsl_interp_accel* ya, double* z);
size_t gsl_spline2d_min_size (const(gsl_spline2d)* interp);
const(char)* gsl_spline2d_name (const(gsl_spline2d)* interp);
int gsl_spline2d_set (const(gsl_spline2d)* interp, double* zarr, const size_t i, const size_t j, const double z);
double gsl_spline2d_get (const(gsl_spline2d)* interp, const(double)* zarr, const size_t i, const size_t j);
