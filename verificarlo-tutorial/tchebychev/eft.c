#include "libeft.h"

void my_split_s(float a, float *x, float *y){
  const float c = 4097 * a;
  (*x) = c - (c-a);
  (*y) = a - (*x);
}

void my_twosum_s (float a, float b,
                float *x, float *e) {
  (*x) = a + b;
  const float z = (*x) - a;
  (*e) = (a - ((*x)-z)) + (b-z);
}

void my_twoprod_s (float a, float b,
                 float *x, float *e) {
  (*x) = a * b;

  float a1, a2, b1, b2;
  my_split_s (a, &a1, &a2);
  my_split_s (b, &b1, &b2);

  const float tmp = (a1*b1-(*x)) + a1*b2 + a2*b1;
  (*e) = tmp + a2*b2;
}

void my_split_d(double a, double *x, double *y){
  const double c = 134217729 * a;
  (*x) = c - (c-a);
  (*y) = a - (*x);
}

void my_twosum_d (double a, double b,
                double *x, double *e) {
  (*x) = a + b;
  const double z = (*x) - a;
  (*e) = (a - ((*x)-z)) + (b-z);
}

void my_twoprod_d (double a, double b,
                 double *x, double *e) {
  (*x) = a * b;

  double a1, a2, b1, b2;
  my_split_d (a, &a1, &a2);
  my_split_d (b, &b1, &b2);

  const double tmp = (a1*b1-(*x)) + a1*b2 + a2*b1;
  (*e) = tmp + a2*b2;
}
