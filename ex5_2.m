clear 
clc
close all

c = 5;
r = 10;  %regular price
s = 3; %discount price
x_hat = 70;

n = 1000; %number of samples
% we have a (positive truncated) normal distribution for demand (can't have a negative demand... unless short selling....)
sigma   = 5;
mu      = 30;
demand  = max(normrnd(mu,sigma,[n,1]),0);
yyaxis left
histogram(demand,150,'normalization','probability');

ylabel('Probability')
yyaxis right
cdfplot(demand);
xlabel('Demand')
ylabel('Cumulative Probability')
title(' ')
%%
cvx_begin
variable x
variable profit(n)
variable yr(n)
variable ys(n)
minimize -sum(profit)
subject to
    0<=yr<=demand
    ys>=0
    yr + ys <= x    
    profit == - c * x + r*yr +  s*ys
cvx_end

%% profit
profit_mean = -c*x + mean(r*yr+s*ys);
profit = -c*x + r*yr+s*ys;
figure 
yyaxis left
histogram(profit,150,'normalization','probability');

ylabel('Probability')
yyaxis right
cdfplot(profit);
xlabel('Profit')
ylabel('Cumulative Probability')
title(' ')