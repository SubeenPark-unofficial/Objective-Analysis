% 2번. (two sinusoidal waves)
% x(t) = sin(2pi t/10) + 1/2 sin(2pi t/5) for 1<=t<=1000, delta t = 1 
% time series(x(t)), auto covariance(phi(tau)) and auto spectrum(PHI(omega))를 구하고 그래프로 표현하고 해석하기


Fs = 1;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector
S = sin(2*pi*t/10) + (1/2)*sin(2*pi*t/5);

figure;
tiledlayout(1,3);


nexttile;
plot(t,S)
title('Q2: Time Series', 'Interpreter','latex')

nexttile;
%%% Auto Covariance of x
phi = xcorr(x,25,'normalized')
plot(-25:25,phi);
title('Q2: $\phi (\tau)$', 'Interpreter', 'latex')


nexttile;
f = Fs*(0:(L/2))/L;
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
plot(f,P1) 
title('Q2: $\Phi (\omega)$', 'Interpreter', 'latex')