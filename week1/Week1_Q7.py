import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import scipy.stats as stats


plt.figure(figsize = (10,5))
x = np.array(list(range(1,101,1)))
y = np.sin(2*np.pi*x/10)
df = pd.Series(y)


# PLOTS
plt.subplot(121)
df.hist()
plt.xlabel("Value of y")
plt.ylabel("Frequency of y")

plt.subplot(122)
df.hist(density=True)
plt.xlabel("Value of y")
plt.ylabel("Density of y")

plt.show()

# STATISTICS

print ("#"*15 + " STATISTICS " + "#"*15)
print ("")
mean = 1.0*np.mean(y)
print (f"MEAN : {mean:.5f}")
print ("")

var = 1.0*np.var(y)
print (f"VAR : {var:.5f}")
print ("")

skew = 1.0*stats.skew(y)
print (f"SKEWNESS : {skew:.5f}")
print ("")

kurtosis = 1.0*stats.kurtosis(y)
print (f"KURTOSIS : {kurtosis:.5f}")
print ("")





