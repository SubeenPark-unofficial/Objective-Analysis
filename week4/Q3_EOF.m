eta = readtable('Eta.dat');
tau = readtable('Pair.dat');
eta_mat = eta{:,2:26}';
tau_mat = tau{:,2:35}';
x = eta_mat - mean(eta_mat,2);
y = tau_mat - mean(tau_mat,2);
M = 25;
L = 34;
N = 3423;

%%%%%%%%%%%%%%%% EOF: X %%%%%%%%%%%%%%%%%%%
c_x = (1/N)*x*x';
[v_x,d_x] = eig(c_x);
p_x = v_x'*x;
sigma_x = diag(d_x);

% sigma
yyaxis left
plot(1:M,sigma_x,'b--o');
title('Q3: EOF of X');

sum_l = sum(sigma_x);
cum_sum = (1/sum_l)*cumsum(sigma_x);

hold on
yyaxis right
plot(1:25,(1/sum_l)*sigma_x,'-+'); % Explained Variance
plot(1:25, cum_sum,'-*'); %Explained Variance_cumsum
legend('$\lambda$', 'Explained Variance', 'Cumulative Explained Variance', 'Interpreter', 'Latex')
hold off



%%%%%%%%%%%%%%%% EOF: Y %%%%%%%%%%%%%%%%%%%
c_y = (1/N)*y*y';
[v_y,d_y] = eig(c_y);
p_y = v_y'*y;
sigma_y = diag(d_y);

figure;
% sigma
yyaxis left
plot(1:L,sigma_y,'b--o');
title('Q3: EOF of Y');

sum_l = sum(sigma_y);
cum_sum = (1/sum_l)*cumsum(sigma_y);

hold on
yyaxis right
plot(1:L,(1/sum_l)*sigma_y,'-+'); % Explained Variance
plot(1:L, cum_sum,'-*'); %Explained Variance_cumsum
legend('$\lambda$', 'Explained Variance', 'Cumulative Explained Variance', 'Interpreter', 'Latex')
hold off
