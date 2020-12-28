
for i=-50:50
    for j=1:1000
        e = cos(2*pi*i/10 - 2*pi*j/10);
        a(i+51,j) = e;
    end
end

c = (1/1000)*a*a'
[v,d]=eig(c) %
z = v'*a %Z Uncorrelated Time Series


z_for_plot = z(1,:)
plot(t,z_for_plot,'r')


d_for_plot = diag(d)
plot(-50:50,d_for_plot,'b--o')

plot(-50:50,v(:,1),'g',-50:50,v(:,2),'b')
legend('Mode 1','Mode 2')