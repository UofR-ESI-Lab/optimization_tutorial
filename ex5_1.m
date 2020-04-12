d = [10; 30; 50];
pb = [1/4, 5/12, 1/3];
n = length(d);
c = 5;
r = 10;  %regular price
s = 3; %discount price
x_hat = 70;

cvx_begin
    variable x;
    variable yr(n);
    variable ys(n);
    
    minimize c*x - pb*(r*yr+s*ys)
    subject to
        x<=75;
        yr <= d;
        yr + ys <=x*ones(n,1);
        x>=0;
        yr>=0;
        ys>=0;
cvx_end

%% profit
profit_mean = -c*x + pb*(r*yr+s*ys);
profit = -c*x + r*yr+s*ys;