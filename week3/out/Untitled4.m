
x = [-50:50]
t = [1:1000]
for i=-50:50
    for j=1:1000
        a(i+51,j) = (1/50)*i*cos(2*pi*j/100) + (1/500)*i*cos(2*pi*j/10);
    end
end

c = (1/1000)*a*a'
[v,d]=eig(c) %
z = v'*a %Z Uncorrelated Time Series

z_for_plot = z(1,:)
plot(t,z_for_plot,'r')