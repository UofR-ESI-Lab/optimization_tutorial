%% lp 1
c = [-1,-1.25];
A = [0.03,0.06;
    0.08,0.04;
    1,0;
    0,1;
    -1,0;
    0,-1];
b = [30 44 500 400 0 0];
x = linprog(c,A,b)

%% lp 2
c = [-1,-1.25];
A = [0.03,0.06;
    0.08,0.04];
b = [30 44];
lb = [0 0];
ub = [500 400];
x = linprog(c,A,b,[],[],lb,ub)

%% CVX
clear
c = [1;1.25];
cvx_begin
    variable x(2);
    minimize -(c')*x
    subject to
    0.03*x(1)+0.06*x(2)<=30;
    0.08*x(1)+0.04*x(2)<=44;
    x(1)<=500;
    x(2)<=400;
    x(1)>=0;
    x(2)>=0;
cvx_end
x