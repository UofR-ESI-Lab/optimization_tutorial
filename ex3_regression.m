clear 
close all
clc

X = load('max_temp_b.txt');
y = load('max_demand_b.txt');

[m,n] = size(X);

plot(X,y,'o')
hold on

%% linear  
Phi = [X ones(m,1)];
theta = inv(Phi' * Phi) * Phi' * y;
% theta = Phi \ y;
% input used for prediction 
x_hat = linspace(min(X),max(X),100); % create a set of evenly spaced input points over the entire range of the input
x_hat = x_hat';
m_hat = length(x_hat);
Phi_hat = [x_hat ones(m_hat,1)];
y_hat = Phi_hat * theta;
plot(x_hat,y_hat,'linewidth',1)

%% 4th order polynomial 
Phi = [X.^4 X.^3 X.^2 X ones(m,1)];
% theta = inv(Phi' * Phi) * Phi' * y;
theta = Phi \ y;

x_hat = linspace(min(X),max(X),100); % create a set of evenly spaced input points over the entire range of the input
x_hat = x_hat';
m_hat = length(x_hat);
Phi_hat = [x_hat.^4 x_hat.^3 x_hat.^2 x_hat ones(m_hat,1)];
y_hat = Phi_hat * theta;

plot(x_hat,y_hat,'linewidth',1)
%%
xlabel('High Temperature (F)')
ylabel('Peak Hourly Demand (GW)')
legend('Observed Data','linear equation','4^th order polynomial','location','NW')
% 
