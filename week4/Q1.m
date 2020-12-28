
for x=-50:50
    for t=1:100
        p(x+51,t) = (1/50)*x*cos(2*pi*t/100);
        q(x+51,t) = (1/500)*x*cos(2*pi*t/10);
    end 
end


%C_xy
c = (1/100)*p*q' ;
[U, S, V] = svd(c);
P = U'*p;
Q = V'*q;
Z_x = U'*p;
Z_y = V'*q;

%sigma
figure;
sigma = diag(S)
plot(-50:50,sigma,'b--o');
title('Q1: Sigma');

figure;
tiledlayout(2,2)
%U
nexttile
plot(-50:50,U(:,1), 'g');
title('Q1: $\hat u_1$', 'interpreter', 'latex');
legend('$\hat u_1$', 'Interpreter','latex');

%V
nexttile
plot(-50:50,V(:,1), 'g');
title('Q1: $\hat v_1$' , 'interpreter', 'latex');
legend('$\hat v_1$', 'Interpreter','latex');

%X*
nexttile
plot(1:100,Z_x(1,:));
title('Q1: $X^{*}$' , 'interpreter', 'latex');
legend('$x^{*}_1$', 'Interpreter','latex');

%Y*
nexttile
plot(1:100,Z_y(1,:));
title('Q1: $Y^{*}$' , 'interpreter', 'latex');
legend('$y^{*}_1$', 'Interpreter','latex');
