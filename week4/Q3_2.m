WITH EOF
%%%%%%%%%%%%%%% EOF of X %%%%%%%%%%%%%%%%%%
c_x = (1/x*x';
[v_x,d_x] = eig(c_x);
c_x_1 = d_x*v_x
p_x = v_x'*x;



figure;
tiledlayout(3,1);

X: Sigma
nexttile
l_x = flipud((diag(d_x))
sum_x = sum(l_x);
cum_sum_x = (1/sum_x)*cumsum(l_x);

yyaxis left
plot (1:25, l_x, '-o'); % Lambda
hold on
title('EOF of X: Eigenvalues')
yyaxis right
plot(1:25,(1/sum_x)*l_x,'-+'); % Explained Variance
plot(1:25, cum_sum_x,'-*'); %Explained Variance_cumsum
legend('$\lambda$', 'Explained Variance', 'Cumulative Explained Variance', 'Interpreter', 'Latex')
hold off

X: Eigenvector
nexttile
hold on
title('EOF of X: Eigenvectors')
plot(1:25, v_x(:,25))
plot(1:25, v_x(:,24))
plot(1:25, v_x(:,23))
plot(1:25, v_x(:,22))
plot(1:25, v_x(:,21))
legend('Mode 1', 'Mode 2', 'Mode 3', 'Mode 4', 'Mode 5')
hold off

X: PC
nexttile
hold on
title('EOF of X: PCs')
plot(1:3423, p_x(1,:))
plot(1:3423, p_x(2,:))
plot(1:3423, p_x(3,:))
plot(1:3423, p_x(4,:))
plot(1:3423, p_x(5,:))
legend('Mode 1', 'Mode 2', 'Mode 3', 'Mode 4', 'Mode 5')
hold off

%%%%%%%%%%%%%%% EOF of Y %%%%%%%%%%%%
c_y = y*y';
[v_y,d_y] = eig(c_y);
v_y = 
p_y = v_y'*y


figure;
tiledlayout(3,1);

Y: Sigma
nexttile
lambda_y = diag(d_y)
l_y = flipud(lambda_y);
sum_y = sum(l_y);
cum_sum_y = (1/sum_y)*cumsum(l_y);

yyaxis left
plot (1:34, l_y, '-o'); % Lambda
hold on
title('EOF of Y: Eigenvalues')
yyaxis right
plot(1:34,(1/sum_y)*l_y,'-+'); % Explained Variance
plot(1:34, cum_sum_y,'-*'); %Explained Variance_cumsum
legend('$\lambda$', 'Explained Variance', 'Cumulative Explained Variance', 'Interpreter', 'Latex')
hold off

Y: Eigenvector
nexttile
hold on
title('EOF of Y: Eigenvectors')
plot(1:34, v_y(:,1))
plot(1:34, v_y(:,2))
plot(1:34, v_y(:,3))
plot(1:34, v_y(:,4))
plot(1:34, v_y(:,5))
legend('Mode 1', 'Mode 2', 'Mode 3', 'Mode 4', 'Mode 5')
hold off

Y: PC
nexttile
hold on
title('EOF of Y: PCs')
plot(1:3423, p_y(1,:))
plot(1:3423, p_y(2,:))
plot(1:3423, p_y(3,:))
plot(1:3423, p_y(4,:))
plot(1:3423, p_y(5,:))
legend('Mode 1', 'Mode 2', 'Mode 3', 'Mode 4', 'Mode 5')
hold off