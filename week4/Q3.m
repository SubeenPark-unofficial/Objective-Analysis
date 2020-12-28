eta = readtable('Eta.dat');
tau = readtable('Pair.dat');
eta_mat = eta{:,2:26}';
tau_mat = tau{:,2:35}';
x = normalize(eta_mat,2);
y = normalize(tau_mat,2);
M = 25;
L = 34;
N = 3423;


%################################## SVD ###########################
c = (1/3423)*x*y' ;
[U, S, V] = svd(c);
X = U'*x;
Y = V'*y;

%sigma
figure;
sigma = diag(S);

yyaxis left
plot(1:25,sigma,'b--o');
title('Q3: SVD Method');

sum_l = sum(sigma);
cum_sum = (1/sum_l)*cumsum(sigma);

hold on
yyaxis right
plot(1:25,(1/sum_l)*sigma,'-+'); % Explained Variance
plot(1:25, cum_sum,'-*'); %Explained Variance_cumsum
legend('$\lambda$', 'Explained Variance', 'Cumulative Explained Variance', 'Interpreter', 'Latex')
hold off

figure;
tiledlayout(2,2)

%U
nexttile
plot(1:25,U(:,1),1:25, U(:,2),1:25, U(:,3));
title('Q3: $\hat u_1$, $\hat u_2$ and $\hat u_3$', 'interpreter', 'latex');
legend('$\hat u_1$','$\hat u_2$','$\hat u_3$', 'Interpreter','latex');

%V
nexttile
plot(1:34,V(:,1), 1:34, V(:,2),1:34, V(:,3));
title('Q3: $\hat v_1$, $\hat v_2$ and $\hat v_3$', 'interpreter', 'latex');
legend('$\hat v_1$','$\hat v_2$','$\hat v_3$', 'Interpreter','latex');

%X*
nexttile
plot(1:3423,X(1,:), 1:3423, X(2,:),1:3423, X(3,:));
title('Q3: SVD Method $X^{*}$' , 'interpreter', 'latex');
legend('$x^{*}_1$','$x^{*}_2$','$x^{*}_3$', 'Interpreter','latex');

%Y*
nexttile
plot(1:3423,Y(1,:), 1:3423, Y(2,:),1:3423, Y(3,:));
title('Q3: SVD Method $Y^{*}$' , 'interpreter', 'latex');
legend('$y^{*}_1$','$y^{*}_2$','$y^{*}_3$', 'Interpreter','latex');

% VECTOR WITH DIMENSION



%################################## EOF ###########################

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


%%%% EOF X VECTOR WITH DIMENSION
dim_x = v_x*sqrtm(d_x);

%%%% EOF Y VECTOR WITH DIMENSIO
dim_y = v_y*sqrtm(d_y);

%%%% SVD X VECTOR WITH DIMENSION 1st
i = 1
s = S(i,i);

U_dim = U(:,i)*s*(1/sqrt(Y(i,:)*Y(i,:)'));
V_dim = V(:,i)*s*(1/sqrt(X(i,:)*X(i,:)'));

figure;
tiledlayout(1,2);
nexttile;

yyaxis left
plot (1:25, dim_x(:,i))
hold on

yyaxis right
plot(1:25, U_dim);
hold off
title ('Mode 1: $\hat u_1$ from SVD and EOF', 'interpreter', 'latex') 
legend ('EOF', 'SVD')

nexttile;
yyaxis right
plot (1:34, dim_y(:,i))
hold on 
yyaxis left
plot (1:34, V_dim)
title ('Mode 1: $\hat v_1$ from SVD and EOF', 'interpreter', 'latex' )
legend ('EOF', 'SVD')
hold off
    
%%%% SVD X VECTOR WITH DIMENSION 2nd
i = 2
s = S(i,i);

U_dim = U(:,i)*s*(1/sqrt(Y(i,:)*Y(i,:)'));
V_dim = V(:,i)*s*(1/sqrt(X(i,:)*X(i,:)'));

figure;
tiledlayout(1,2);
nexttile;

yyaxis left
plot (1:25, dim_x(:,i))
hold on

yyaxis right
plot(1:25, U_dim);
hold off
title ('Mode 2: $\hat u_1$ from SVD and EOF', 'interpreter', 'latex') 
legend ('EOF', 'SVD')

nexttile;
yyaxis right
plot (1:34, dim_y(:,i))
hold on 
yyaxis left
plot (1:34, V_dim)
title ('Mode 2: $\hat v_1$ from SVD and EOF','interpreter', 'latex' )
legend ('EOF', 'SVD')
hold off

%%%% SVD X VECTOR WITH DIMENSION 2nd
i = 3
s = S(i,i);

U_dim = 100*U(:,i)*s*(1/sqrt(Y(i,:)*Y(i,:)'));
V_dim = 100*V(:,i)*s*(1/sqrt(X(i,:)*X(i,:)'));

figure;
tiledlayout(1,2);
nexttile;

yyaxis left
plot (1:25, dim_x(:,i))
hold on

yyaxis right
plot(1:25, U_dim);
hold off
title ('Mode 3: $\hat u_1$ from SVD and EOF', 'interpreter', 'latex') 
legend ('EOF', 'SVD')

nexttile;
yyaxis right
plot (1:34, dim_y(:,i))
hold on 
yyaxis left
plot (1:34, V_dim)
title ('Mode 3: $\hat v_1$ from SVD and EOF','interpreter', 'latex' )
legend ('EOF', 'SVD')
hold off









