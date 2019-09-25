/* Simple implementation of Error Free Transformations
 * TWOPROD(REAL a, REAL b, REAL *x, REAL *e);
 * TWOSUM(REAL a, REAL b, REAL *x, REAL *e);
 */

#ifndef __EFT_H__
#define __EFT_H__

#ifdef DOUBLE
#define TWOPROD twoprod_d
#define TWOSUM twosum_d
#else
#define TWOPROD twoprod_s
#define TWOSUM twosum_s
#endif

void twosum_s(float a, float b, float *x, float *e);
void twoprod_s(float a, float b, float *x, float *e);

void twosum_d(double a, double b, double *x, double *e);
void twoprod_d(double a, double b, double *x, double *e);

#endif
