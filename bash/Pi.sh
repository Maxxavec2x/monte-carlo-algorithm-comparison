#!/usr/bin/env bash

######################################################
#      Calcul Pi par la méthode de Monte-Carlo       #
#                                                    #
#      Clément LECOMTE -- Pascal BERTHOMÉ            #
#                                                    #
######################################################

# Retourne 1 si le point (x, y) est dans le cercle unité
# Utilise awk pour les calculs flottants (bash ne gère pas les flottants)
is_in_circle() {
  local x=$1
  local y=$2
  awk -v x="$x" -v y="$y" 'BEGIN { print (x*x + y*y <= 1.0) ? 1 : 0 }'
}

# Génère un flottant aléatoire dans [-1, 1]
uniform_neg1_1() {
  awk -v seed="$RANDOM$RANDOM" 'BEGIN { srand(seed); printf "%.10f", rand() * 2.0 - 1.0 }'
}

# Approxime Pi avec n points aléatoires
approxPI() {
  local n=$1
  local count=0

  # On fait tout dans un seul appel awk pour ne pas mourir de vieillesse
  awk -v n="$n" -v seed="$RANDOM$RANDOM$RANDOM" '
    BEGIN {
        srand(seed)
        count = 0
        for (i = 0; i < n; i++) {
            x = rand() * 2.0 - 1.0
            y = rand() * 2.0 - 1.0
            if (x*x + y*y <= 1.0) count++
        }
        printf "%.10f\n", 4.0 * count / n
    }'
}

# Temps en secondes avec décimales (via date +%s%N ou awk fallback)
get_time() {
  echo "$(date +%s%N)"
}

STEP=100000

echo "hello"
printf "%-5s\t%-20s\t%s\n" "i" "approx_pi" "time (s)"

for i in $(seq 1 9); do
  n=$((i * STEP))

  start=$(date +%s%N)
  presquePI=$(approxPI "$n")
  end=$(date +%s%N)

  elapsed=$(awk -v s="$start" -v e="$end" 'BEGIN { printf "%.6f", (e - s) / 1e9 }')

  printf "%d\t%s\t%s\n" "$i" "$presquePI" "$elapsed"
done
