import sys
import numpy as np
from eofs.standard import Eof
import matplotlib.pyplot as plt



np.set_printoptions(formatter = {'float_kind':lambda x: "{0:0.3f}".format(x)},threshold=20000000)

# Q1
########################### INPUT DATA ################################
x = np.arange(-50,51,1)
t = np.arange(1,1001,1)
eta_coord = []
eta_2D = [0 for i in range(len(x))]

for i in range(len(x)):
    stat = [0 for i in range(len(t))]
    for j in range(len(t)):
            X = x[i]
            T = t[j]
            # eta(x, t) = (1 / 50)xcos(2pit / 100) + (1 / 500)xcos(2pit / 10)
            eta_ij = (1/50) * X * np.cos((2 * np.pi * T)/100) + (1/500) * X* np.cos((2 * np.pi * T)/10)
            stat[j] = eta_ij
    eta_2D[i]= stat

eta = np.array(eta_2D)
"""print ("+" * 20 + " GIVEN MATRIX " + "+"*20)"""

sys.stdout = open('eta.txt','w')
print (eta)
#print ("+" * 20 + " MATRIX DIMENSION" + "+"*20)

#print (np.shape(eta))
#print (np.ndim(eta))




########################### EOF ANALYSIS ################################
solver = Eof(eta)
pcs = solver.pcs()
eofs = solver.eofs()
eigenvalues = solver.eigenvalues()
#sys.stdout = open('output.txt','w')
print ("+" * 20 + " PCS " + "+"*20)
print (pcs)
print (np.size(pcs))
print ("+" * 20 + " EOFS " + "+"*20)
print (eofs)
print ("+" * 20 + " Eigenvalues " + "+"*20)
print (eigenvalues)


pcs_1D = []
for i in range(101):
    pcs_1D.append(pcs[i][0])
u#print (pcs_1D)
#print (len(pcs_1D))


U, S, V = np.linalg.svd(eta)

Vt = np.transpose(V)
sv = np.matmul(S,Vt)
Ut = np.tranpose(U)
A = np.matmup(U)
eta_t = np.transpose(eta)
covar = np.matmul(eta,eta_t)
eval , evec = np.linalg.eigh(covar)
evec_t = np.transpose(evec)
pc = np.matmul(evec_t,eta)

print(pc)

print ("+" * 20 + " U: Spatial Singular Vectors " + "+"*20)
print (U)


print ("+" * 20 + " V: Singular Value Matrix " + "+"*20)
