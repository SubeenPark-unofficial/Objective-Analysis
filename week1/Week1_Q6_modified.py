import scipy.stats as stats
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
import statsmodels.stats.api as sms
import pandas as pd

#Initial Condition
MU = 0
SIGMA = 1
sample_number = [10, 30, 100]
rv = stats.norm(loc = MU, scale = SIGMA)

plt.figure(figsize = (18,12))

np.set_printoptions(precision=5)


#Confidence Level
def mean_confidence_interval(data, confidence = 0.95):
    a = 1.0*np.array(data)
    n = len(a)
    if n <= 30 :
        return sms.DescrStatsW(a).tconfint_mean()
    else : 
        return sms.DescrStatsW(a).zconfint_mean()
    
def var_confidence_interval(data, alpha = 0.05):
    n = len(data)
    s = np.var(data, ddof = 1)
    df = n - 1
    upper = (n - 1) * s / stats.chi2.ppf(alpha / 2, df)
    lower = (n - 1) * s / stats.chi2.ppf(1 - alpha / 2, df)
    return (lower, upper)


for i in range (3):

    # PLOTS
    plt.subplot(2,3,i+1)
    rand_sample = np.random.normal(0,1, size = sample_number[i])
    df = pd.Series(rand_sample)
    df.hist()
    plt.title(f"N = {sample_number[i]}")
    plt.xlim(-4,4)
    plt.xlabel("Sample Value")
    plt.ylabel("Frequency")
    
    plt.subplot(2,3,i+4)
    rand_sample = np.random.normal(0,1, size = sample_number[i])
    df = pd.Series(rand_sample)
    df.hist(density = True)
    plt.xlim(-4,4)
    plt.xlabel("Sample Value")
    plt.ylabel("Density")




    # STATISTICS

    print ("#"*15 + f" N = {sample_number[i]} " + "#"*15)

    print ("")

    #Mean
    mean = 1.0*np.mean(rand_sample)
    print(f"MEAN : {mean:.5f}")
    print("")

    #Variance
    variance = 1.0*np.var(rand_sample)
    print(f"VARIANCE : {variance:.5f}")
    print("")

    #Skewness
    skew = 1.0*stats.skew(rand_sample)
    print (f"SKEWNESS : {skew:.5f}")
    print ("")

    #Kurtosis
    kurtosis = 1.0*stats.kurtosis(rand_sample)
    print(f"KURTOSIS : {kurtosis:.5f}")
    print ("")

    # Confidential Intervals

    # Mean
    print ("Confidence Interval for Mean : ", mean_confidence_interval(rand_sample))
    print ("")

    # Variance
    print ("Confidence Interval for Variance: ", var_confidence_interval(rand_sample))
    print ("")
    
    print (f"N = {sample_number[i]} : Random Numbers")
    print (rand_sample)

plt.show()
