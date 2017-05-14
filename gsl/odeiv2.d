/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.odeiv2;
import core.stdc.config : c_ulong;

extern (C):

alias gsl_odeiv2_step_struct gsl_odeiv2_step;
alias gsl_odeiv2_control_struct gsl_odeiv2_control;
alias gsl_odeiv2_evolve_struct gsl_odeiv2_evolve;
alias gsl_odeiv2_driver_struct gsl_odeiv2_driver;

extern __gshared const(gsl_odeiv2_step_type)* gsl_odeiv2_step_rk2;
extern __gshared const(gsl_odeiv2_step_type)* gsl_odeiv2_step_rk4;
extern __gshared const(gsl_odeiv2_step_type)* gsl_odeiv2_step_rkf45;
extern __gshared const(gsl_odeiv2_step_type)* gsl_odeiv2_step_rkck;
extern __gshared const(gsl_odeiv2_step_type)* gsl_odeiv2_step_rk8pd;
extern __gshared const(gsl_odeiv2_step_type)* gsl_odeiv2_step_rk2imp;
extern __gshared const(gsl_odeiv2_step_type)* gsl_odeiv2_step_rk4imp;
extern __gshared const(gsl_odeiv2_step_type)* gsl_odeiv2_step_bsimp;
extern __gshared const(gsl_odeiv2_step_type)* gsl_odeiv2_step_rk1imp;
extern __gshared const(gsl_odeiv2_step_type)* gsl_odeiv2_step_msadams;
extern __gshared const(gsl_odeiv2_step_type)* gsl_odeiv2_step_msbdf;

struct gsl_odeiv2_system
{
    int function (double, const(double)*, double*, void*) function_;
    int function (double, const(double)*, double*, double*, void*) jacobian;
    size_t dimension;
    void* params;
}

struct gsl_odeiv2_step_type
{
    const(char)* name;
    int can_use_dydt_in;
    int gives_exact_dydt_out;
    void* function (size_t) alloc;
    int function (void*, size_t, double, double, double*, double*, const(double)*, double*, const(gsl_odeiv2_system)*) apply;
    int function (void*, const(gsl_odeiv2_driver)*) set_driver;
    int function (void*, size_t) reset;
    uint function (void*) order;
    void function (void*) free;
}

struct gsl_odeiv2_step_struct
{
    const(gsl_odeiv2_step_type)* type;
    size_t dimension;
    void* state;
}

struct gsl_odeiv2_control_type
{
    const(char)* name;
    void* function () alloc;
    int function (void*, double, double, double, double) init;
    int function (void*, size_t, uint, const(double)*, const(double)*, const(double)*, double*) hadjust;
    int function (void*, const double, const double, const double, const size_t, double*) errlevel;
    int function (void*, const(gsl_odeiv2_driver)*) set_driver;
    void function (void*) free;
}

struct gsl_odeiv2_control_struct
{
    const(gsl_odeiv2_control_type)* type;
    void* state;
}

struct gsl_odeiv2_evolve_struct
{
    size_t dimension;
    double* y0;
    double* yerr;
    double* dydt_in;
    double* dydt_out;
    double last_step;
    c_ulong count;
    c_ulong failed_steps;
    const(gsl_odeiv2_driver)* driver;
}

struct gsl_odeiv2_driver_struct
{
    const(gsl_odeiv2_system)* sys;
    gsl_odeiv2_step* s;
    gsl_odeiv2_control* c;
    gsl_odeiv2_evolve* e;
    double h;
    double hmin;
    double hmax;
    c_ulong n;
    c_ulong nmax;
}

gsl_odeiv2_step* gsl_odeiv2_step_alloc (const(gsl_odeiv2_step_type)* T, size_t dim);
int gsl_odeiv2_step_reset (gsl_odeiv2_step* s);
void gsl_odeiv2_step_free (gsl_odeiv2_step* s);
const(char)* gsl_odeiv2_step_name (const(gsl_odeiv2_step)* s);
uint gsl_odeiv2_step_order (const(gsl_odeiv2_step)* s);
int gsl_odeiv2_step_apply (gsl_odeiv2_step* s, double t, double h, double* y, double* yerr, const(double)* dydt_in, double* dydt_out, const(gsl_odeiv2_system)* dydt);
int gsl_odeiv2_step_set_driver (gsl_odeiv2_step* s, const(gsl_odeiv2_driver)* d);
gsl_odeiv2_control* gsl_odeiv2_control_alloc (const(gsl_odeiv2_control_type)* T);
int gsl_odeiv2_control_init (gsl_odeiv2_control* c, double eps_abs, double eps_rel, double a_y, double a_dydt);
void gsl_odeiv2_control_free (gsl_odeiv2_control* c);
int gsl_odeiv2_control_hadjust (gsl_odeiv2_control* c, gsl_odeiv2_step* s, const(double)* y, const(double)* yerr, const(double)* dydt, double* h);
const(char)* gsl_odeiv2_control_name (const(gsl_odeiv2_control)* c);
int gsl_odeiv2_control_errlevel (gsl_odeiv2_control* c, const double y, const double dydt, const double h, const size_t ind, double* errlev);
int gsl_odeiv2_control_set_driver (gsl_odeiv2_control* c, const(gsl_odeiv2_driver)* d);
gsl_odeiv2_control* gsl_odeiv2_control_standard_new (double eps_abs, double eps_rel, double a_y, double a_dydt);
gsl_odeiv2_control* gsl_odeiv2_control_y_new (double eps_abs, double eps_rel);
gsl_odeiv2_control* gsl_odeiv2_control_yp_new (double eps_abs, double eps_rel);
gsl_odeiv2_control* gsl_odeiv2_control_scaled_new (double eps_abs, double eps_rel, double a_y, double a_dydt, const(double)* scale_abs, size_t dim);
gsl_odeiv2_evolve* gsl_odeiv2_evolve_alloc (size_t dim);
int gsl_odeiv2_evolve_apply (gsl_odeiv2_evolve* e, gsl_odeiv2_control* con, gsl_odeiv2_step* step, const(gsl_odeiv2_system)* dydt, double* t, double t1, double* h, double* y);
int gsl_odeiv2_evolve_apply_fixed_step (gsl_odeiv2_evolve* e, gsl_odeiv2_control* con, gsl_odeiv2_step* step, const(gsl_odeiv2_system)* dydt, double* t, const double h0, double* y);
int gsl_odeiv2_evolve_reset (gsl_odeiv2_evolve* e);
void gsl_odeiv2_evolve_free (gsl_odeiv2_evolve* e);
int gsl_odeiv2_evolve_set_driver (gsl_odeiv2_evolve* e, const(gsl_odeiv2_driver)* d);
gsl_odeiv2_driver* gsl_odeiv2_driver_alloc_y_new (const(gsl_odeiv2_system)* sys, const(gsl_odeiv2_step_type)* T, const double hstart, const double epsabs, const double epsrel);
gsl_odeiv2_driver* gsl_odeiv2_driver_alloc_yp_new (const(gsl_odeiv2_system)* sys, const(gsl_odeiv2_step_type)* T, const double hstart, const double epsabs, const double epsrel);
gsl_odeiv2_driver* gsl_odeiv2_driver_alloc_scaled_new (const(gsl_odeiv2_system)* sys, const(gsl_odeiv2_step_type)* T, const double hstart, const double epsabs, const double epsrel, const double a_y, const double a_dydt, const(double)* scale_abs);
gsl_odeiv2_driver* gsl_odeiv2_driver_alloc_standard_new (const(gsl_odeiv2_system)* sys, const(gsl_odeiv2_step_type)* T, const double hstart, const double epsabs, const double epsrel, const double a_y, const double a_dydt);
int gsl_odeiv2_driver_set_hmin (gsl_odeiv2_driver* d, const double hmin);
int gsl_odeiv2_driver_set_hmax (gsl_odeiv2_driver* d, const double hmax);
int gsl_odeiv2_driver_set_nmax (gsl_odeiv2_driver* d, const c_ulong nmax);
int gsl_odeiv2_driver_apply (gsl_odeiv2_driver* d, double* t, const double t1, double* y);
int gsl_odeiv2_driver_apply_fixed_step (gsl_odeiv2_driver* d, double* t, const double h, const c_ulong n, double* y);
int gsl_odeiv2_driver_reset (gsl_odeiv2_driver* d);
int gsl_odeiv2_driver_reset_hstart (gsl_odeiv2_driver* d, const double hstart);
void gsl_odeiv2_driver_free (gsl_odeiv2_driver* state);