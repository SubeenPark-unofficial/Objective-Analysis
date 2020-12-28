for x=-50:50
    for t=1:100
        p(x+51,t) = sin(2*pi*x/10-2*pi*t/10);
        q(x+51,t) = cos(2*pi*x/10-2*pi*t/10);
    end 
end

%C_xy
c = (1/100)*p*q' ;
[U, S, V] = svd(c);
Z_x = U'*p;
Z_y = V'*q;

%sigma
figure;
sigma = diag(S)
plot(-50:50,sigma,'b--o');
title('Q2: Sigma');


tiledlayout(2,2)
%U
nexttile
plot(-50:50,U(:,1), 'g', -50:50, U(:,2),'b');
title('Q2: $\hat u_1$ and $\hat u_2$', 'interpreter', 'latex');
legend('$\hat u_1$','$\hat u_2$', 'Interpreter','latex');

%V
nexttile
plot(-50:50,V(:,1), 'g', -50:50, V(:,2),'b');
title('Q2: $\hat v_1$ and $\hat v_2$', 'interpreter', 'latex');
legend('$\hat v_1$','$\hat v_2$', 'Interpreter','latex');

%X*
nexttile
plot(1:100,Z_x(1,:),'g', 1:100, Z_x(2,:),'b');
title('Q2: $X^{*}$' , 'interpreter', 'latex');
legend('$x^{*}_1$','$x^{*}_2$', 'Interpreter','latex');

%Y*
nexttile
plot(1:100,Z_y(1,:),'g',1:100,Z_y(2,:),'b');
title('Q2: $Y^{*}$' , 'interpreter', 'latex');
legend('$y^{*}_1$','$y^{*}_2$', 'Interpreter','latex');