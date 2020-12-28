from numpy.linalg import svd
import numpy as np

A = np.array ([[1,2,3],[3,4,5],[5,6,7]])
U, S, VT = svd(A)

print ("############# RANK ##############")
print(np.linalg.matrix_rank(A),"\n")

print ("############### U ###############")
print (U,"\n")

print ("############### Sigma ###############")
print (S,"\n")

print ("############### VT ###############")
print (VT,"\n")
