/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.dht;

extern (C):

alias gsl_dht_struct gsl_dht;

struct gsl_dht_struct
{
    size_t size;
    double nu;
    double xmax;
    double kmax;
    double* j;
    double* Jjj;
    double* J2;
}

gsl_dht* gsl_dht_alloc (size_t size);
gsl_dht* gsl_dht_new (size_t size, double nu, double xmax);
int gsl_dht_init (gsl_dht* t, double nu, double xmax);
double gsl_dht_x_sample (const(gsl_dht)* t, int n);
double gsl_dht_k_sample (const(gsl_dht)* t, int n);
void gsl_dht_free (gsl_dht* t);
int gsl_dht_apply (const(gsl_dht)* t, double* f_in, double* f_out);