import numpy as np
import statsmodels.api as sms
import pandas as pd



print("##################### Q7 #####################\n")

field  = list(map(lambda a:a*0.1, range(101))) 
x1 = np.array(field)
y1 = x1**2
df1 = pd.DataFrame(data = {'X':x1, 'Y':y1}, columns = ['X','Y'])

reg1 = sms.OLS.from_formula("X~Y", df1).fit()

print(reg1.summary(),"\n")

print("="*8 + " Confidence Interval of True Correlation Coefficient"+"="*8+"\n")
r = df1['X'].corr(df1['Y'])
size = len(field)

print ("Correlation Coefficient(r):", r,"\n")

def calculate_rho(r, n):
    Z = 0.5*np.log((1+r)/(1-r))
    sigma = 1/np.sqrt(n-3)
    mu_lower = Z - 1.96*sigma
    mu_upper = Z + 1.96*sigma
    rho_lower = (np.exp(2*mu_lower)-1)/(np.exp(2*mu_lower)+1)
    rho_upper = (np.exp(2*mu_upper)-1)/(np.exp(2*mu_upper)+1)
    return rho_lower,rho_upper

print ("Confience interval for true correlation coefficient: ",calculate_rho(r, size),"\n")

#True Correlation 

print("##################### Q8 #####################\n")

t = np.array(list(range(101)))
x2 = np.sin(2*np.pi*t/10)
y2 = np.cos(2*np.pi*t/10)
df2 = pd.DataFrame(data = {'X':x2, 'Y':y2})
reg2 = sms.OLS.from_formula("X~Y",df2).fit()
print(reg2.summary())

