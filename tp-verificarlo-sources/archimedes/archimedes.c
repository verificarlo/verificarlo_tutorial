#include <stdio.h>
#include <math.h>
#include <time.h>

/* Archimedes method for computing PI using circumscribed polygons */
double archimedes(int N) {
	double ti, tii, fact, res;
	int i;

  /* Print header */
  printf(" i Ai+1                  Ti+1\n");

	ti = 1./sqrt(3.);
	fact = 1;
	for(i=1; i<=N; i++){
    double s = sqrt(ti * ti + 1);
    tii = (s - 1)/ti;
    //tii = ti/(s + 1);
		ti = tii;

		fact *= 2;
		res = 6 * fact * tii;
		printf("%2d %.15e %.15e\n", i, res, tii);
	}
  return res;
}

int main(void){
  const int N = 25;
  double pi = archimedes(N);
  printf("pi ~ %.15e\n", pi);
	return 0;
}
