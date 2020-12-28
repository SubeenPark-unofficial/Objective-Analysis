% 3번. (white noise) random number generator로 정규분포를 이루는 1000개의 sample 생성
% x(t) = N(0,1)
% time series(x(t)), auto covariance(phi(tau)) and auto spectrum(PHI(omega))를 구하고 그래프로 표현하고 해석하기

n = 0:999;
x = randn(size(n));

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
title('Q3: Time Series', 'Interpreter','latex')

nexttile;
%%% Auto Covariance of x
phi = xcorr(x,25,'normalized')
plot(-25:25,phi);
title('Q3: $\phi (\tau)$', 'Interpreter', 'latex')


nexttile;
plot(freq/pi,psdx)
title('Q3: $\Phi (\omega)$', 'Interpreter', 'latex')