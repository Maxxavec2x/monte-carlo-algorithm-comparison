/******************************************************
 *      Calcul Pi par la méthode de Monte-Carlo       *
 *                                                    *
 *      Clément LECOMTE -- Pascal BERTHOMÉ            *
 *                                                    *
 ******************************************************/

import java.util.Random;

public class MonteCarloPi {

    static Random random = new Random();

    /* Retourne true si le point (x, y) est dans le cercle unité */
    static boolean isInCircle(double x, double y) {
        return x * x + y * y <= 1.0;
    }

    /* Retourne un double aléatoire dans [-1, 1] */
    static double uniformNeg1To1() {
        return random.nextDouble() * 2.0 - 1.0;
    }

    /* Approxime Pi avec numberOfPoints points aléatoires */
    static double approxPI(int numberOfPoints) {
        int count = 0;
        for (int i = 0; i < numberOfPoints; i++) {
            double x = uniformNeg1To1();
            double y = uniformNeg1To1();
            if (isInCircle(x, y)) {
                count++;
            }
        }
        return 4.0 * count / numberOfPoints;
    }

    public static void main(String[] args) {
        int step = 100_000;

        System.out.println("hello");
        System.out.printf("%-5s\t%-20s\t%s%n", "i", "approx_pi", "time (s)");

        for (int i = 1; i < 10; i++) {
            long start = System.nanoTime();

            double presquePI = approxPI(i * step);

            long end = System.nanoTime();
            double elapsed = (end - start) / 1e9;

            System.out.printf("%d\t%.10f\t%.6f%n", i, presquePI, elapsed);
        }
    }
}
