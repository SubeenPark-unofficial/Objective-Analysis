% 1번. (one sinusoidal wave)
% x(t) = sin(2pi t/10) for 1<=t<=1000, delta t = 1 
%  time series(x(t)), auto covariance(phi(tau)) and auto spectrum(PHI(omega))를 구하고 그래프로 표현하고 해석하기

t = 1:1000;
w0 = 2*pi/10
x = sin(w0*t);
tau = -20:20

figure;
tiledlayout(1,3);

nexttile;
%%% Time series of x
plot(t,x)
title('Q1: Time Series', 'Interpreter','latex')

nexttile;
%%% Auto Covariance of x
phi = 0.5*cos(w0*tau)
plot(tau,phi);
title('Q1: $\phi (\tau)$', 'Interpreter', 'latex')

nexttile;
%%% Autospectrum(phi)
k = 1:500 ;
w = 2*pi*k/1000 ;
PHI = zeros(500) ;
PHI(10) = 0.5*pi ;
plot(w, PHI);
title('Q1: $\Phi (\omega)$', 'Interpreter', 'latex')

