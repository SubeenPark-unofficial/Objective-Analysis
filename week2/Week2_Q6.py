import numpy as np

# Matrix input
M = np.array([1,2,3,3,4,5,5,6,7]).reshape((3,3))
print ("="*15 + " INPUT MATRIX " + "="*15)
print (M,"\n")

# Rank 
print ("="*15 + " RANK OF THE MATRIX " + "="*15)
print (np.linalg.matrix_rank(M),"\n")

# Submatrices
print ("="*15 + " SUBMATRICES " + "="*15)


def extractSubMatrix(mtx, r_start, r_end, c_start, c_end):
    result = mtx[r_start:r_end+1, c_start:c_end+1]
    return result 

subs = []

#Consequtive Submatrices
for k in range(3):
    for l in range(k, 3):
        for i in range(3):
            for j in range(i, 3):
                subs.append(extractSubMatrix(M, i , j , k ,l).tolist())

#Non-consequtive Submatrices
M1 = np.array([1,3,3,5,5,7]).reshape((3,2))
M2 = np.array([1,2,3,5,6,7]).reshape((2,3))
M3 = np.array([1,3,5,6]).reshape((2,2))

for m in range(3):
    for n in range(m, 3):
        subs.append(M1[m:n+1,:].tolist())

for m in range(3):
    for n in range(m,3):
        subs.append(M2[:,m:n+1].tolist())

subs.append(M3.tolist())
print (len(subs))
print (subs)


# Remove redundant submatrices
sub_res = []
for sub in subs:
    if sub not in sub_res:
        sub_res.append(sub)


print ("Number of Submatrices(Excluding redundant ones): ",len(sub_res))
print ("")
print (sub_res)



