clc
clear 
%%
load('As3_data')
price = price';
cvx_begin
    variable p(288)
    minimize price * p
    subject to 
        sum(p)==20*60/15; %kW15min 
        0<=p<=2;
cvx_end
%%
yyaxis left
plot(p)
axis([0,288,0,2.2])
ylabel('Charging power (kW)')
yyaxis right
plot(price)
axis([0,288,0,0.3])
ylabel('Real-time pricing ($/kWh)')
timelabel={'0','4','8','12','16','20','24'};
fs =10;
set(gca,'xtick',0:48:288,'xticklabel',timelabel,'fontsize',fs);
