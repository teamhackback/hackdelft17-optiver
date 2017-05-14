/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.histogram;
import core.stdc.stdio : FILE;

extern (C):

//gsl_histogram
struct gsl_histogram
{
    size_t n;
    double* range;
    double* bin;
}

struct gsl_histogram_pdf
{
    size_t n;
    double* range;
    double* sum;
}

gsl_histogram* gsl_histogram_alloc (size_t n);
gsl_histogram* gsl_histogram_calloc (size_t n);
gsl_histogram* gsl_histogram_calloc_uniform (const size_t n, const double xmin, const double xmax);
void gsl_histogram_free (gsl_histogram* h);
int gsl_histogram_increment (gsl_histogram* h, double x);
int gsl_histogram_accumulate (gsl_histogram* h, double x, double weight);
int gsl_histogram_find (const(gsl_histogram)* h, const double x, size_t* i);
double gsl_histogram_get (const(gsl_histogram)* h, size_t i);
int gsl_histogram_get_range (const(gsl_histogram)* h, size_t i, double* lower, double* upper);
double gsl_histogram_max (const(gsl_histogram)* h);
double gsl_histogram_min (const(gsl_histogram)* h);
size_t gsl_histogram_bins (const(gsl_histogram)* h);
void gsl_histogram_reset (gsl_histogram* h);
gsl_histogram* gsl_histogram_calloc_range (size_t n, double* range);
int gsl_histogram_set_ranges (gsl_histogram* h, const(double)* range, size_t size);
int gsl_histogram_set_ranges_uniform (gsl_histogram* h, double xmin, double xmax);
int gsl_histogram_memcpy (gsl_histogram* dest, const(gsl_histogram)* source);
gsl_histogram* gsl_histogram_clone (const(gsl_histogram)* source);
double gsl_histogram_max_val (const(gsl_histogram)* h);
size_t gsl_histogram_max_bin (const(gsl_histogram)* h);
double gsl_histogram_min_val (const(gsl_histogram)* h);
size_t gsl_histogram_min_bin (const(gsl_histogram)* h);
int gsl_histogram_equal_bins_p (const(gsl_histogram)* h1, const(gsl_histogram)* h2);
int gsl_histogram_add (gsl_histogram* h1, const(gsl_histogram)* h2);
int gsl_histogram_sub (gsl_histogram* h1, const(gsl_histogram)* h2);
int gsl_histogram_mul (gsl_histogram* h1, const(gsl_histogram)* h2);
int gsl_histogram_div (gsl_histogram* h1, const(gsl_histogram)* h2);
int gsl_histogram_scale (gsl_histogram* h, double scale);
int gsl_histogram_shift (gsl_histogram* h, double shift);
double gsl_histogram_sigma (const(gsl_histogram)* h);
double gsl_histogram_mean (const(gsl_histogram)* h);
double gsl_histogram_sum (const(gsl_histogram)* h);
int gsl_histogram_fwrite (FILE* stream, const(gsl_histogram)* h);
int gsl_histogram_fread (FILE* stream, gsl_histogram* h);
int gsl_histogram_fprintf (FILE* stream, const(gsl_histogram)* h, const(char)* range_format, const(char)* bin_format);
int gsl_histogram_fscanf (FILE* stream, gsl_histogram* h);
gsl_histogram_pdf* gsl_histogram_pdf_alloc (const size_t n);
int gsl_histogram_pdf_init (gsl_histogram_pdf* p, const(gsl_histogram)* h);
void gsl_histogram_pdf_free (gsl_histogram_pdf* p);
double gsl_histogram_pdf_sample (const(gsl_histogram_pdf)* p, double r);


//gsl_histogram2d
struct gsl_histogram2d
{
    size_t nx;
    size_t ny;
    double* xrange;
    double* yrange;
    double* bin;
}

struct gsl_histogram2d_pdf
{
    size_t nx;
    size_t ny;
    double* xrange;
    double* yrange;
    double* sum;
}

gsl_histogram2d* gsl_histogram2d_alloc (const size_t nx, const size_t ny);
gsl_histogram2d* gsl_histogram2d_calloc (const size_t nx, const size_t ny);
gsl_histogram2d* gsl_histogram2d_calloc_uniform (const size_t nx, const size_t ny, const double xmin, const double xmax, const double ymin, const double ymax);
void gsl_histogram2d_free (gsl_histogram2d* h);
int gsl_histogram2d_increment (gsl_histogram2d* h, double x, double y);
int gsl_histogram2d_accumulate (gsl_histogram2d* h, double x, double y, double weight);
int gsl_histogram2d_find (const(gsl_histogram2d)* h, const double x, const double y, size_t* i, size_t* j);
double gsl_histogram2d_get (const(gsl_histogram2d)* h, const size_t i, const size_t j);
int gsl_histogram2d_get_xrange (const(gsl_histogram2d)* h, const size_t i, double* xlower, double* xupper);
int gsl_histogram2d_get_yrange (const(gsl_histogram2d)* h, const size_t j, double* ylower, double* yupper);
double gsl_histogram2d_xmax (const(gsl_histogram2d)* h);
double gsl_histogram2d_xmin (const(gsl_histogram2d)* h);
size_t gsl_histogram2d_nx (const(gsl_histogram2d)* h);
double gsl_histogram2d_ymax (const(gsl_histogram2d)* h);
double gsl_histogram2d_ymin (const(gsl_histogram2d)* h);
size_t gsl_histogram2d_ny (const(gsl_histogram2d)* h);
void gsl_histogram2d_reset (gsl_histogram2d* h);
gsl_histogram2d* gsl_histogram2d_calloc_range (size_t nx, size_t ny, double* xrange, double* yrange);
int gsl_histogram2d_set_ranges_uniform (gsl_histogram2d* h, double xmin, double xmax, double ymin, double ymax);
int gsl_histogram2d_set_ranges (gsl_histogram2d* h, const(double)* xrange, size_t xsize, const(double)* yrange, size_t ysize);
int gsl_histogram2d_memcpy (gsl_histogram2d* dest, const(gsl_histogram2d)* source);
gsl_histogram2d* gsl_histogram2d_clone (const(gsl_histogram2d)* source);
double gsl_histogram2d_max_val (const(gsl_histogram2d)* h);
void gsl_histogram2d_max_bin (const(gsl_histogram2d)* h, size_t* i, size_t* j);
double gsl_histogram2d_min_val (const(gsl_histogram2d)* h);
void gsl_histogram2d_min_bin (const(gsl_histogram2d)* h, size_t* i, size_t* j);
double gsl_histogram2d_xmean (const(gsl_histogram2d)* h);
double gsl_histogram2d_ymean (const(gsl_histogram2d)* h);
double gsl_histogram2d_xsigma (const(gsl_histogram2d)* h);
double gsl_histogram2d_ysigma (const(gsl_histogram2d)* h);
double gsl_histogram2d_cov (const(gsl_histogram2d)* h);
double gsl_histogram2d_sum (const(gsl_histogram2d)* h);
int gsl_histogram2d_equal_bins_p (const(gsl_histogram2d)* h1, const(gsl_histogram2d)* h2);
int gsl_histogram2d_add (gsl_histogram2d* h1, const(gsl_histogram2d)* h2);
int gsl_histogram2d_sub (gsl_histogram2d* h1, const(gsl_histogram2d)* h2);
int gsl_histogram2d_mul (gsl_histogram2d* h1, const(gsl_histogram2d)* h2);
int gsl_histogram2d_div (gsl_histogram2d* h1, const(gsl_histogram2d)* h2);
int gsl_histogram2d_scale (gsl_histogram2d* h, double scale);
int gsl_histogram2d_shift (gsl_histogram2d* h, double shift);
int gsl_histogram2d_fwrite (FILE* stream, const(gsl_histogram2d)* h);
int gsl_histogram2d_fread (FILE* stream, gsl_histogram2d* h);
int gsl_histogram2d_fprintf (FILE* stream, const(gsl_histogram2d)* h, const(char)* range_format, const(char)* bin_format);
int gsl_histogram2d_fscanf (FILE* stream, gsl_histogram2d* h);
gsl_histogram2d_pdf* gsl_histogram2d_pdf_alloc (const size_t nx, const size_t ny);
int gsl_histogram2d_pdf_init (gsl_histogram2d_pdf* p, const(gsl_histogram2d)* h);
void gsl_histogram2d_pdf_free (gsl_histogram2d_pdf* p);
int gsl_histogram2d_pdf_sample (const(gsl_histogram2d_pdf)* p, double r1, double r2, double* x, double* y);