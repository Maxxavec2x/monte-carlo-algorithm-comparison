/*****************************************************
 *      Calcul Pi par la méthode de Monte-Carlo      *
 *                                                   *
 *      Clément LECOMTE -- Pascal BERTHOMÉ           *
 *                                                   *
 *****************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int is_in_circle(double x, double y) {
    return x * x + y * y <= 1.0;
}

double uniform_neg1_1(void) {
    return (double)rand() / RAND_MAX * 2.0 - 1.0;
}

double approxPI(int number_of_points) {
    int count = 0;
    for (int i = 0; i < number_of_points; i++) {
        double x = uniform_neg1_1();
        double y = uniform_neg1_1();
        if (is_in_circle(x, y)) {
            count++;
        }
    }
    return 4.0 * count / number_of_points;
}

int main(void) {
    srand((unsigned int)time(NULL));  /* seed the RNG */

    int step = 100000;

    printf("hello\n");
    printf("%-5s\t%-20s\t%s\n", "i", "approx_pi", "time (s)");

    for (int i = 1; i < 10; i++) {
        struct timespec start, end;
        clock_gettime(CLOCK_MONOTONIC, &start);

        double presquePI = approxPI(i * step);

        clock_gettime(CLOCK_MONOTONIC, &end);
        double elapsed = (end.tv_sec - start.tv_sec)
                       + (end.tv_nsec - start.tv_nsec) / 1e9;

        printf("%d\t%.10f\t%.6f\n", i, presquePI, elapsed);
    }

    return 0;
}
