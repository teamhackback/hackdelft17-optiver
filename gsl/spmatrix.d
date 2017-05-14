/** D bindings for GSL.
    Authors:    Chibisi Chima-Okereke
    Copyright:  Copyright (c) 2016, Chibisi Chima-Okereke. All rights reserved.
    License:    Boost License 1.0
*/

module gsl.spmatrix;
import gsl.math;
import gsl.vector;
import gsl.matrix;

extern (C):

struct gsl_spmatrix_tree
{
    void* tree;
    void* node_array;
    size_t n;
}

struct gsl_spmatrix
{
    size_t size1;
    size_t size2;
    size_t* i;
    double* data;
    size_t* p;
    size_t nzmax;
    size_t nz;
    gsl_spmatrix_tree* tree_data;
    void* work;
    size_t sptype;
}

gsl_spmatrix* gsl_spmatrix_alloc (const size_t n1, const size_t n2);
gsl_spmatrix* gsl_spmatrix_alloc_nzmax (const size_t n1, const size_t n2, const size_t nzmax, const size_t flags);
void gsl_spmatrix_free (gsl_spmatrix* m);
int gsl_spmatrix_realloc (const size_t nzmax, gsl_spmatrix* m);
int gsl_spmatrix_set_zero (gsl_spmatrix* m);
size_t gsl_spmatrix_nnz (const(gsl_spmatrix)* m);
int gsl_spmatrix_compare_idx (const size_t ia, const size_t ja, const size_t ib, const size_t jb);
int gsl_spmatrix_memcpy (gsl_spmatrix* dest, const(gsl_spmatrix)* src);
double gsl_spmatrix_get (const(gsl_spmatrix)* m, const size_t i, const size_t j);
int gsl_spmatrix_set (gsl_spmatrix* m, const size_t i, const size_t j, const double x);
gsl_spmatrix* gsl_spmatrix_compcol (const(gsl_spmatrix)* T);
void gsl_spmatrix_cumsum (const size_t n, size_t* c);
int gsl_spmatrix_scale (gsl_spmatrix* m, const double x);
int gsl_spmatrix_minmax (const(gsl_spmatrix)* m, double* min_out, double* max_out);
int gsl_spmatrix_add (gsl_spmatrix* c, const(gsl_spmatrix)* a, const(gsl_spmatrix)* b);
int gsl_spmatrix_d2sp (gsl_spmatrix* S, const(gsl_matrix)* A);
int gsl_spmatrix_sp2d (gsl_matrix* A, const(gsl_spmatrix)* S);
int gsl_spmatrix_equal (const(gsl_spmatrix)* a, const(gsl_spmatrix)* b);
int gsl_spmatrix_transpose_memcpy (gsl_spmatrix* dest, const(gsl_spmatrix)* src);