#!/usr/bin/env perl

######################################################
#      Calcul Pi par la méthode de Monte-Carlo       #
#                                                    #
#      Clément LECOMTE -- Pascal BERTHOMÉ            #
#                                                    #
######################################################

use strict;
use warnings;
use Time::HiRes qw(time);  # pour un timing précis (sub-seconde)

# Retourne 1 si le point (x, y) est dans le cercle unité
sub is_in_circle {
    my ($x, $y) = @_;
    return $x * $x + $y * $y <= 1.0;
}

# Retourne un flottant aléatoire dans [-1, 1]
sub uniform_neg1_1 {
    return rand() * 2.0 - 1.0;
}

# Approxime Pi avec $n points aléatoires
sub approxPI {
    my ($n) = @_;
    my $count = 0;
    for my $i (1 .. $n) {
        my $x = uniform_neg1_1();
        my $y = uniform_neg1_1();
        $count++ if is_in_circle($x, $y);
    }
    return 4.0 * $count / $n;
}

# Seed aléatoire
srand(time);

my $step = 100_000;

print "hello\n";
printf("%-5s\t%-20s\t%s\n", "i", "approx_pi", "time (s)");

for my $i (1 .. 9) {
    my $n = $i * $step;

    my $start    = time();
    my $presquePI = approxPI($n);
    my $end      = time();

    my $elapsed = $end - $start;

    printf("%d\t%.10f\t%.6f\n", $i, $presquePI, $elapsed);
}
