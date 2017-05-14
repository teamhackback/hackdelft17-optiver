/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.randist;
import gsl.rng;

extern (C):

struct gsl_ran_discrete_t
{
    size_t K;
    size_t* A;
    double* F;
}

uint gsl_ran_bernoulli (const(gsl_rng)* r, double p);
double gsl_ran_bernoulli_pdf (const uint k, double p);
double gsl_ran_beta (const(gsl_rng)* r, const double a, const double b);
double gsl_ran_beta_pdf (const double x, const double a, const double b);
uint gsl_ran_binomial (const(gsl_rng)* r, double p, uint n);
uint gsl_ran_binomial_knuth (const(gsl_rng)* r, double p, uint n);
uint gsl_ran_binomial_tpe (const(gsl_rng)* r, double p, uint n);
double gsl_ran_binomial_pdf (const uint k, const double p, const uint n);
double gsl_ran_exponential (const(gsl_rng)* r, const double mu);
double gsl_ran_exponential_pdf (const double x, const double mu);
double gsl_ran_exppow (const(gsl_rng)* r, const double a, const double b);
double gsl_ran_exppow_pdf (const double x, const double a, const double b);
double gsl_ran_cauchy (const(gsl_rng)* r, const double a);
double gsl_ran_cauchy_pdf (const double x, const double a);
double gsl_ran_chisq (const(gsl_rng)* r, const double nu);
double gsl_ran_chisq_pdf (const double x, const double nu);
void gsl_ran_dirichlet (const(gsl_rng)* r, const size_t K, const(double)* alpha, double* theta);
double gsl_ran_dirichlet_pdf (const size_t K, const(double)* alpha, const(double)* theta);
double gsl_ran_dirichlet_lnpdf (const size_t K, const(double)* alpha, const(double)* theta);
double gsl_ran_erlang (const(gsl_rng)* r, const double a, const double n);
double gsl_ran_erlang_pdf (const double x, const double a, const double n);
double gsl_ran_fdist (const(gsl_rng)* r, const double nu1, const double nu2);
double gsl_ran_fdist_pdf (const double x, const double nu1, const double nu2);
double gsl_ran_flat (const(gsl_rng)* r, const double a, const double b);
double gsl_ran_flat_pdf (double x, const double a, const double b);
double gsl_ran_gamma (const(gsl_rng)* r, const double a, const double b);
double gsl_ran_gamma_int (const(gsl_rng)* r, const uint a);
double gsl_ran_gamma_pdf (const double x, const double a, const double b);
double gsl_ran_gamma_mt (const(gsl_rng)* r, const double a, const double b);
double gsl_ran_gamma_knuth (const(gsl_rng)* r, const double a, const double b);
double gsl_ran_gaussian (const(gsl_rng)* r, const double sigma);
double gsl_ran_gaussian_ratio_method (const(gsl_rng)* r, const double sigma);
double gsl_ran_gaussian_ziggurat (const(gsl_rng)* r, const double sigma);
double gsl_ran_gaussian_pdf (const double x, const double sigma);
double gsl_ran_ugaussian (const(gsl_rng)* r);
double gsl_ran_ugaussian_ratio_method (const(gsl_rng)* r);
double gsl_ran_ugaussian_pdf (const double x);
double gsl_ran_gaussian_tail (const(gsl_rng)* r, const double a, const double sigma);
double gsl_ran_gaussian_tail_pdf (const double x, const double a, const double sigma);
double gsl_ran_ugaussian_tail (const(gsl_rng)* r, const double a);
double gsl_ran_ugaussian_tail_pdf (const double x, const double a);
void gsl_ran_bivariate_gaussian (const(gsl_rng)* r, double sigma_x, double sigma_y, double rho, double* x, double* y);
double gsl_ran_bivariate_gaussian_pdf (const double x, const double y, const double sigma_x, const double sigma_y, const double rho);
double gsl_ran_landau (const(gsl_rng)* r);
double gsl_ran_landau_pdf (const double x);
uint gsl_ran_geometric (const(gsl_rng)* r, const double p);
double gsl_ran_geometric_pdf (const uint k, const double p);
uint gsl_ran_hypergeometric (const(gsl_rng)* r, uint n1, uint n2, uint t);
double gsl_ran_hypergeometric_pdf (const uint k, const uint n1, const uint n2, uint t);
double gsl_ran_gumbel1 (const(gsl_rng)* r, const double a, const double b);
double gsl_ran_gumbel1_pdf (const double x, const double a, const double b);
double gsl_ran_gumbel2 (const(gsl_rng)* r, const double a, const double b);
double gsl_ran_gumbel2_pdf (const double x, const double a, const double b);
double gsl_ran_logistic (const(gsl_rng)* r, const double a);
double gsl_ran_logistic_pdf (const double x, const double a);
double gsl_ran_lognormal (const(gsl_rng)* r, const double zeta, const double sigma);
double gsl_ran_lognormal_pdf (const double x, const double zeta, const double sigma);
uint gsl_ran_logarithmic (const(gsl_rng)* r, const double p);
double gsl_ran_logarithmic_pdf (const uint k, const double p);
void gsl_ran_multinomial (const(gsl_rng)* r, const size_t K, const uint N, const(double)* p, uint* n);
double gsl_ran_multinomial_pdf (const size_t K, const(double)* p, const(uint)* n);
double gsl_ran_multinomial_lnpdf (const size_t K, const(double)* p, const(uint)* n);
uint gsl_ran_negative_binomial (const(gsl_rng)* r, double p, double n);
double gsl_ran_negative_binomial_pdf (const uint k, const double p, double n);
uint gsl_ran_pascal (const(gsl_rng)* r, double p, uint n);
double gsl_ran_pascal_pdf (const uint k, const double p, uint n);
double gsl_ran_pareto (const(gsl_rng)* r, double a, const double b);
double gsl_ran_pareto_pdf (const double x, const double a, const double b);
uint gsl_ran_poisson (const(gsl_rng)* r, double mu);
void gsl_ran_poisson_array (const(gsl_rng)* r, size_t n, uint* array, double mu);
double gsl_ran_poisson_pdf (const uint k, const double mu);
double gsl_ran_rayleigh (const(gsl_rng)* r, const double sigma);
double gsl_ran_rayleigh_pdf (const double x, const double sigma);
double gsl_ran_rayleigh_tail (const(gsl_rng)* r, const double a, const double sigma);
double gsl_ran_rayleigh_tail_pdf (const double x, const double a, const double sigma);
double gsl_ran_tdist (const(gsl_rng)* r, const double nu);
double gsl_ran_tdist_pdf (const double x, const double nu);
double gsl_ran_laplace (const(gsl_rng)* r, const double a);
double gsl_ran_laplace_pdf (const double x, const double a);
double gsl_ran_levy (const(gsl_rng)* r, const double c, const double alpha);
double gsl_ran_levy_skew (const(gsl_rng)* r, const double c, const double alpha, const double beta);
double gsl_ran_weibull (const(gsl_rng)* r, const double a, const double b);
double gsl_ran_weibull_pdf (const double x, const double a, const double b);
void gsl_ran_dir_2d (const(gsl_rng)* r, double* x, double* y);
void gsl_ran_dir_2d_trig_method (const(gsl_rng)* r, double* x, double* y);
void gsl_ran_dir_3d (const(gsl_rng)* r, double* x, double* y, double* z);
void gsl_ran_dir_nd (const(gsl_rng)* r, size_t n, double* x);
void gsl_ran_shuffle (const(gsl_rng)* r, void* base, size_t nmembm, size_t size);
int gsl_ran_choose (const(gsl_rng)* r, void* dest, size_t k, void* src, size_t n, size_t size);
void gsl_ran_sample (const(gsl_rng)* r, void* dest, size_t k, void* src, size_t n, size_t size);
gsl_ran_discrete_t* gsl_ran_discrete_preproc (size_t K, const(double)* P);
void gsl_ran_discrete_free (gsl_ran_discrete_t* g);
size_t gsl_ran_discrete (const(gsl_rng)* r, const(gsl_ran_discrete_t)* g);
double gsl_ran_discrete_pdf (size_t k, const(gsl_ran_discrete_t)* g);