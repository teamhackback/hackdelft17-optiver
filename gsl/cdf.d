/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.cdf;

extern (C):

double gsl_cdf_ugaussian_P (const double x);
double gsl_cdf_ugaussian_Q (const double x);
double gsl_cdf_ugaussian_Pinv (const double P);
double gsl_cdf_ugaussian_Qinv (const double Q);
double gsl_cdf_gaussian_P (const double x, const double sigma);
double gsl_cdf_gaussian_Q (const double x, const double sigma);
double gsl_cdf_gaussian_Pinv (const double P, const double sigma);
double gsl_cdf_gaussian_Qinv (const double Q, const double sigma);
double gsl_cdf_gamma_P (const double x, const double a, const double b);
double gsl_cdf_gamma_Q (const double x, const double a, const double b);
double gsl_cdf_gamma_Pinv (const double P, const double a, const double b);
double gsl_cdf_gamma_Qinv (const double Q, const double a, const double b);
double gsl_cdf_cauchy_P (const double x, const double a);
double gsl_cdf_cauchy_Q (const double x, const double a);
double gsl_cdf_cauchy_Pinv (const double P, const double a);
double gsl_cdf_cauchy_Qinv (const double Q, const double a);
double gsl_cdf_laplace_P (const double x, const double a);
double gsl_cdf_laplace_Q (const double x, const double a);
double gsl_cdf_laplace_Pinv (const double P, const double a);
double gsl_cdf_laplace_Qinv (const double Q, const double a);
double gsl_cdf_rayleigh_P (const double x, const double sigma);
double gsl_cdf_rayleigh_Q (const double x, const double sigma);
double gsl_cdf_rayleigh_Pinv (const double P, const double sigma);
double gsl_cdf_rayleigh_Qinv (const double Q, const double sigma);
double gsl_cdf_chisq_P (const double x, const double nu);
double gsl_cdf_chisq_Q (const double x, const double nu);
double gsl_cdf_chisq_Pinv (const double P, const double nu);
double gsl_cdf_chisq_Qinv (const double Q, const double nu);
double gsl_cdf_exponential_P (const double x, const double mu);
double gsl_cdf_exponential_Q (const double x, const double mu);
double gsl_cdf_exponential_Pinv (const double P, const double mu);
double gsl_cdf_exponential_Qinv (const double Q, const double mu);
double gsl_cdf_exppow_P (const double x, const double a, const double b);
double gsl_cdf_exppow_Q (const double x, const double a, const double b);
double gsl_cdf_tdist_P (const double x, const double nu);
double gsl_cdf_tdist_Q (const double x, const double nu);
double gsl_cdf_tdist_Pinv (const double P, const double nu);
double gsl_cdf_tdist_Qinv (const double Q, const double nu);
double gsl_cdf_fdist_P (const double x, const double nu1, const double nu2);
double gsl_cdf_fdist_Q (const double x, const double nu1, const double nu2);
double gsl_cdf_fdist_Pinv (const double P, const double nu1, const double nu2);
double gsl_cdf_fdist_Qinv (const double Q, const double nu1, const double nu2);
double gsl_cdf_beta_P (const double x, const double a, const double b);
double gsl_cdf_beta_Q (const double x, const double a, const double b);
double gsl_cdf_beta_Pinv (const double P, const double a, const double b);
double gsl_cdf_beta_Qinv (const double Q, const double a, const double b);
double gsl_cdf_flat_P (const double x, const double a, const double b);
double gsl_cdf_flat_Q (const double x, const double a, const double b);
double gsl_cdf_flat_Pinv (const double P, const double a, const double b);
double gsl_cdf_flat_Qinv (const double Q, const double a, const double b);
double gsl_cdf_lognormal_P (const double x, const double zeta, const double sigma);
double gsl_cdf_lognormal_Q (const double x, const double zeta, const double sigma);
double gsl_cdf_lognormal_Pinv (const double P, const double zeta, const double sigma);
double gsl_cdf_lognormal_Qinv (const double Q, const double zeta, const double sigma);
double gsl_cdf_gumbel1_P (const double x, const double a, const double b);
double gsl_cdf_gumbel1_Q (const double x, const double a, const double b);
double gsl_cdf_gumbel1_Pinv (const double P, const double a, const double b);
double gsl_cdf_gumbel1_Qinv (const double Q, const double a, const double b);
double gsl_cdf_gumbel2_P (const double x, const double a, const double b);
double gsl_cdf_gumbel2_Q (const double x, const double a, const double b);
double gsl_cdf_gumbel2_Pinv (const double P, const double a, const double b);
double gsl_cdf_gumbel2_Qinv (const double Q, const double a, const double b);
double gsl_cdf_weibull_P (const double x, const double a, const double b);
double gsl_cdf_weibull_Q (const double x, const double a, const double b);
double gsl_cdf_weibull_Pinv (const double P, const double a, const double b);
double gsl_cdf_weibull_Qinv (const double Q, const double a, const double b);
double gsl_cdf_pareto_P (const double x, const double a, const double b);
double gsl_cdf_pareto_Q (const double x, const double a, const double b);
double gsl_cdf_pareto_Pinv (const double P, const double a, const double b);
double gsl_cdf_pareto_Qinv (const double Q, const double a, const double b);
double gsl_cdf_logistic_P (const double x, const double a);
double gsl_cdf_logistic_Q (const double x, const double a);
double gsl_cdf_logistic_Pinv (const double P, const double a);
double gsl_cdf_logistic_Qinv (const double Q, const double a);
double gsl_cdf_binomial_P (const uint k, const double p, const uint n);
double gsl_cdf_binomial_Q (const uint k, const double p, const uint n);
double gsl_cdf_poisson_P (const uint k, const double mu);
double gsl_cdf_poisson_Q (const uint k, const double mu);
double gsl_cdf_geometric_P (const uint k, const double p);
double gsl_cdf_geometric_Q (const uint k, const double p);
double gsl_cdf_negative_binomial_P (const uint k, const double p, const double n);
double gsl_cdf_negative_binomial_Q (const uint k, const double p, const double n);
double gsl_cdf_pascal_P (const uint k, const double p, const uint n);
double gsl_cdf_pascal_Q (const uint k, const double p, const uint n);
double gsl_cdf_hypergeometric_P (const uint k, const uint n1, const uint n2, const uint t);
double gsl_cdf_hypergeometric_Q (const uint k, const uint n1, const uint n2, const uint t);