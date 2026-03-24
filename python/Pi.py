######################################################
#      Calcul Pi par la méthode de Monte-Carlo        #
#                                                     #
#      Clément LECOMTE -- Pascal BERTHOMÉ             #
#                                                     #
#######################################################

import random
import time
import numpy as np
#import pandas as pd

def is_in_circle(x,y):
    return x*x+y*y<= 1

def approxPI(NUMBER_OF_POINTS):
    Label = []
    for i in range(NUMBER_OF_POINTS):
        Label.append(is_in_circle(random.uniform(-1,1),random.uniform(-1,1)))

    approx_pi = 4*sum(Label)/NUMBER_OF_POINTS
    return approx_pi



step=100_000

print("hello")



for i in range(1,10):
    start = time.time()
    presquePI = approxPI(i*step)
    fin = time.time()
    print(str(i) + "\t" + str(presquePI) + "\t" + str(fin - start))


