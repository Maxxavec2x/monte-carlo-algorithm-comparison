#######################################################
#      Calcul Pi par la méthode de Monte-Carlo        #
#                                                     #
#      Clément LECOMTE -- Pascal BERTHOMÉ             #
#                                                     #
#######################################################

import numpy as np   # pour la partie random
import matplotlib.pyplot as plt #pour visualiser
import sys


import psutil
# import time
#import pandas as pd

######################################################
# Fonction qui détermine si le point de coordonnées  #
#  (x,y) est dans le cercle unitaire (centre Origine #
#  et rayon 1.                                       #
######################################################
def is_in_circle(x,y):
    if x**2 + y**2 <= 1 :  # A COMPLETER
        return True
    else:
        return False


NUMBER_OF_POINTS = int(sys.argv[1])
X = [np.random.uniform(-1,1) for _ in range(NUMBER_OF_POINTS)]
Y = [np.random.uniform(-1,1) for _ in range(NUMBER_OF_POINTS)]

# Pour tous nos points, regardons s'ils sont dans ou en dehors du cercle
Label = [is_in_circle(X[i],Y[i]) for i in range(NUMBER_OF_POINTS) ]
number_of_true = Label.count(True)
approx_pi = 4 * number_of_true/NUMBER_OF_POINTS 
print(f"approx_pi: {approx_pi}")
figure, axes = plt.subplots()
cc = plt.Circle((0,0),1, fill=False)
axes.set_aspect(1)
axes.add_artist(cc)
plt.scatter(X,Y, c= Label)
plt.xlim(-1,1)
plt.ylim(-1,1)
plt.show()


