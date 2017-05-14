/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.odeiv;
import core.stdc.config : c_ulong;

extern (C):

extern __gshared const(gsl_odeiv_step_type)* gsl_odeiv_step_rk2;
extern __gshared const(gsl_odeiv_step_type)* gsl_odeiv_step_rk4;
extern __gshared const(gsl_odeiv_step_type)* gsl_odeiv_step_rkf45;
extern __gshared const(gsl_odeiv_step_type)* gsl_odeiv_step_rkck;
extern __gshared const(gsl_odeiv_step_type)* gsl_odeiv_step_rk8pd;
extern __gshared const(gsl_odeiv_step_type)* gsl_odeiv_step_rk2imp;
extern __gshared const(gsl_odeiv_step_type)* gsl_odeiv_step_rk2simp;
extern __gshared const(gsl_odeiv_step_type)* gsl_odeiv_step_rk4imp;
extern __gshared const(gsl_odeiv_step_type)* gsl_odeiv_step_bsimp;
extern __gshared const(gsl_odeiv_step_type)* gsl_odeiv_step_gear1;
extern __gshared const(gsl_odeiv_step_type)* gsl_odeiv_step_gear2;

struct gsl_odeiv_system
{
    int function (double, const(double)*, double*, void*) function_;
    int function (double, const(double)*, double*, double*, void*) jacobian;
    size_t dimension;
    void* params;
}

struct gsl_odeiv_step_type
{
    const(char)* name;
    int can_use_dydt_in;
    int gives_exact_dydt_out;
    void* function (size_t) alloc;
    int function (void*, size_t, double, double, double*, double*, const(double)*, double*, const(gsl_odeiv_system)*) apply;
    int function (void*, size_t) reset;
    uint function (void*) order;
    void function (void*) free;
}

struct gsl_odeiv_step
{
    const(gsl_odeiv_step_type)* type;
    size_t dimension;
    void* state;
}

struct gsl_odeiv_control_type
{
    const(char)* name;
    void* function () alloc;
    int function (void*, double, double, double, double) init;
    int function (void*, size_t, uint, const(double)*, const(double)*, const(double)*, double*) hadjust;
    void function (void*) free;
}

struct gsl_odeiv_control
{
    const(gsl_odeiv_control_type)* type;
    void* state;
}

struct gsl_odeiv_evolve
{
    size_t dimension;
    double* y0;
    double* yerr;
    double* dydt_in;
    double* dydt_out;
    double last_step;
    c_ulong count;
    c_ulong failed_steps;
}

gsl_odeiv_step* gsl_odeiv_step_alloc (const(gsl_odeiv_step_type)* T, size_t dim);
int gsl_odeiv_step_reset (gsl_odeiv_step* s);
void gsl_odeiv_step_free (gsl_odeiv_step* s);
const(char)* gsl_odeiv_step_name (const(gsl_odeiv_step)* s);
uint gsl_odeiv_step_order (const(gsl_odeiv_step)* s);
int gsl_odeiv_step_apply (gsl_odeiv_step* s, double t, double h, double* y, double* yerr, const(double)* dydt_in, double* dydt_out, const(gsl_odeiv_system)* dydt);
gsl_odeiv_control* gsl_odeiv_control_alloc (const(gsl_odeiv_control_type)* T);
int gsl_odeiv_control_init (gsl_odeiv_control* c, double eps_abs, double eps_rel, double a_y, double a_dydt);
void gsl_odeiv_control_free (gsl_odeiv_control* c);
int gsl_odeiv_control_hadjust (gsl_odeiv_control* c, gsl_odeiv_step* s, const(double)* y, const(double)* yerr, const(double)* dydt, double* h);
const(char)* gsl_odeiv_control_name (const(gsl_odeiv_control)* c);
gsl_odeiv_control* gsl_odeiv_control_standard_new (double eps_abs, double eps_rel, double a_y, double a_dydt);
gsl_odeiv_control* gsl_odeiv_control_y_new (double eps_abs, double eps_rel);
gsl_odeiv_control* gsl_odeiv_control_yp_new (double eps_abs, double eps_rel);
gsl_odeiv_control* gsl_odeiv_control_scaled_new (double eps_abs, double eps_rel, double a_y, double a_dydt, const(double)* scale_abs, size_t dim);
gsl_odeiv_evolve* gsl_odeiv_evolve_alloc (size_t dim);
int gsl_odeiv_evolve_apply (gsl_odeiv_evolve* e, gsl_odeiv_control* con, gsl_odeiv_step* step, const(gsl_odeiv_system)* dydt, double* t, double t1, double* h, double* y);
int gsl_odeiv_evolve_reset (gsl_odeiv_evolve* e);
void gsl_odeiv_evolve_free (gsl_odeiv_evolve* e);