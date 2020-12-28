% 4번. (red noise)
% x(i+1) = a x(i) + ((1-a^2)^1/2) epsilon for 0<=i<=1000
% where a = 0.5, x(0) = 0, and epsilon is white noise

n = 0:999;
a = 0.5
x = zeros(1000);
e = randn(size(n));

for i=2:1000
    x(i) = a*x(i-1) + ((1-a.^2)^0.5)*e(i);
end
x = x(:,1)
N = length(x);
xdft = fft(x);
xdft = xdft(1:N/2+1);
psdx = (1/(2*pi*N)) * abs(xdft).^2;
psdx(2:end-1) = 2*psdx(2:end-1);
freq = 0:(2*pi)/N:pi;

figure;
tiledlayout(1,3);
nexttile;
plot(1:1000,x)
title('Q4: Time Series', 'Interpreter','latex')

nexttile;
%%% Auto Covariance of x
phi = xcorr(x,25,'normalized')
plot(-25:25,phi);
title('Q4: $\phi (\tau)$', 'Interpreter', 'latex')


nexttile;
plot(freq/pi,psdx)
title('Q4: $\Phi (\omega)$', 'Interpreter', 'latex')