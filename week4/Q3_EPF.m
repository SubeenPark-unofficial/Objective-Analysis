eta = readtable('Eta.dat');
tau = readtable('Pair.dat');
eta_mat = eta{:,2:26}';
tau_mat = tau{:,2:35}';
x = eta_mat - mean(eta_mat,2);
y = tau_mat - mean(tau_mat,2);
M = 25
L = 34
N = 3423

%%%%%%%%%%%%%%%% EOF: X %%%%%%%%%%%%%%%%%%%
c_x = (1/N)*x*x';
[v_x,d_x] = eig(c_x);