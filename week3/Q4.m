M = csvread('Eta_bp.csv',1,2)
obs = M'
obs

[m,n]=size(obs);
C=obs*obs'/n; %Covariance Matrix
[EOFs, D] = eig(C); 
PCs=EOFs*obs; %Z Uncorrelated Time Series

EOFs=fliplr(EOFs);
PCs=flipud(PCs);
D=fliplr(flipud(D));
lambda=diag(D);

v = EOFs
L=lambda;
plot(1:m,L,'b--o')

%i=5
%for j=1:5
%    subplot(5,1,j)
%    plot(1:n,PCs(5*(i-1)+j,:))
%    title([5*(i-1)+j])
%end
M = csvread('Eta_bp.csv',1,2)
obs = M'
obs

[m,n]=size(obs);
C=obs*obs'/n; %Covariance Matrix
[EOFs, D] = eig(C); 
PCs=EOFs*obs; %Z Uncorrelated Time Series

EOFs=fliplr(EOFs);
PCs=flipud(PCs);
D=fliplr(flipud(D));
lambda=diag(D);

v = EOFs
L=lambda;
plot(1:m,L,'b--o')

%i=5
%for j=1:5
%    subplot(5,1,j)
%    plot(1:n,PCs(5*(i-1)+j,:))
%    title([5*(i-1)+j])
%end
M = csvread('Eta_bp.csv',1,2)
obs = M'
obs

[m,n]=size(obs);
C=obs*obs'/n; %Covariance Matrix
[EOFs, D] = eig(C); 
PCs=EOFs*obs; %Z Uncorrelated Time Series

EOFs=fliplr(EOFs);
PCs=flipud(PCs);
D=fliplr(flipud(D));
lambda=diag(D);

v = EOFs
L=lambda;
plot(1:m,L,'b--o')

%i=5
%for j=1:5
%    subplot(5,1,j)
%    plot(1:n,PCs(5*(i-1)+j,:))
%    title([5*(i-1)+j])
%end
M = csvread('Eta_bp.csv',1,2)
obs = M'
obs

[m,n]=size(obs);
C=obs*obs'/n; %Covariance Matrix
[EOFs, D] = eig(C); 
PCs=EOFs*obs; %Z Uncorrelated Time Series

EOFs=fliplr(EOFs);
PCs=flipud(PCs);
D=fliplr(flipud(D));
lambda=diag(D);

v = EOFs
L=lambda;
plot(1:m,L,'b--o')

%i=5
%for j=1:5
%    subplot(5,1,j)
%    plot(1:n,PCs(5*(i-1)+j,:))
%    title([5*(i-1)+j])
%end
M = csvread('Eta_bp.csv',1,2)
obs = M'
obs

[m,n]=size(obs);
C=obs*obs'/n; %Covariance Matrix
[EOFs, D] = eig(C); 
PCs=EOFs*obs; %Z Uncorrelated Time Series

EOFs=fliplr(EOFs);
PCs=flipud(PCs);
D=fliplr(flipud(D));
lambda=diag(D);

v = EOFs
L=lambda;
plot(1:m,L,'b--o')

%i=5
%for j=1:5
%    subplot(5,1,j)
%    plot(1:n,PCs(5*(i-1)+j,:))
%    title([5*(i-1)+j])
%end

M = csvread('Eta_bp.csv',1,2)
obs = M'
obs

[m,n]=size(obs);
C=obs*obs'/n; %Covariance Matrix
[EOFs, D] = eig(C); 
PCs=EOFs*obs; %Z Uncorrelated Time Series

EOFs=fliplr(EOFs);
PCs=flipud(PCs);
D=fliplr(flipud(D));
lambda=diag(D);

v = EOFs
L=lambda;
plot(1:m,L,'b--o')

%i=5
%for j=1:5
%    subplot(5,1,j)
%    plot(1:n,PCs(5*(i-1)+j,:))
%    title([5*(i-1)+j])
%end

plot(1:m,v(:,1),'g',1:m,v(:,2),'r',1:m,v(:,3),'b',1:m,v(:,4),'y',1:m,v(:,5),'b')
legend('Mode 1', 'Mode 2', 'Mode3','Mode4','Mode5')

%l = L*(1/1313.3089)
%cum = cumsum(l)
%plot (1:m, cum, 'b--o')
