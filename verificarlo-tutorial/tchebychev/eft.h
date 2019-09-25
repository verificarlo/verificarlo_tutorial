/* Simple implementation of Error Free Transformations
 * TWOPROD(REAL a, REAL b, REAL *x, REAL *e);
 * TWOSUM(REAL a, REAL b, REAL *x, REAL *e);
 */

#ifndef __EFT_H__
#define __EFT_H__

#ifdef DOUBLE
#define TWOPROD my_twoprod_d
#define TWOSUM my_twosum_d
#else
#define TWOPROD my_twoprod_s
#define TWOSUM my_twosum_s
#endif

void my_twosum_s(float a, float b, float *x, float *e);
void my_twoprod_s(float a, float b, float *x, float *e);

void my_twosum_d(double a, double b, double *x, double *e);
void my_twoprod_d(double a, double b, double *x, double *e);

#endif
