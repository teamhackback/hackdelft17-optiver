/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.rstat;

extern (C):

struct gsl_rstat_quantile_workspace
{
    double p;
    double[5] q;
    int[5] npos;
    double[5] np;
    double[5] dnp;
    size_t n;
}

struct gsl_rstat_workspace
{
    double min;
    double max;
    double mean;
    double M2;
    double M3;
    double M4;
    size_t n;
    gsl_rstat_quantile_workspace* median_workspace_p;
}

gsl_rstat_quantile_workspace* gsl_rstat_quantile_alloc (const double p);
void gsl_rstat_quantile_free (gsl_rstat_quantile_workspace* w);
int gsl_rstat_quantile_add (const double x, gsl_rstat_quantile_workspace* w);
double gsl_rstat_quantile_get (gsl_rstat_quantile_workspace* w);
gsl_rstat_workspace* gsl_rstat_alloc ();
void gsl_rstat_free (gsl_rstat_workspace* w);
size_t gsl_rstat_n (gsl_rstat_workspace* w);
int gsl_rstat_add (const double x, gsl_rstat_workspace* w);
double gsl_rstat_min (gsl_rstat_workspace* w);
double gsl_rstat_max (gsl_rstat_workspace* w);
double gsl_rstat_mean (gsl_rstat_workspace* w);
double gsl_rstat_variance (gsl_rstat_workspace* w);
double gsl_rstat_sd (gsl_rstat_workspace* w);
double gsl_rstat_sd_mean (gsl_rstat_workspace* w);
double gsl_rstat_median (gsl_rstat_workspace* w);
double gsl_rstat_skew (gsl_rstat_workspace* w);
double gsl_rstat_kurtosis (gsl_rstat_workspace* w);
int gsl_rstat_reset (gsl_rstat_workspace* w);