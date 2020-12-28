rng('shuffle')
n = 1000
a = [randn(1,n);randn(1,n);randn(1,n)]
a

c = (1/1000)*a*a'
[v,d]=eig(c) %
z = v'*a %Z Uncorrelated Time Series
z

z_for_plot = z(1,:)
plot(1:n,z_for_plot,'r')

d_for_plot = diag(d)
d_for_plot
plot(1:3,d_for_plot,'b--o')

plot(1:3,v(:,1),'g',1:3,v(:,2),'r',1:3,v(:,3),'b')
legend('Mode 1', 'Mode 2', 'Mode3')