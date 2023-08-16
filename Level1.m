

%% Parameters
alpha = 5.2; %incubation period
gamma = 1/alpha; %rate at which people leave E to I.(multiplicative reciprocal)
Duration = 7; %Duration spent as an infectious person
sigma = 1/Duration; %rate at which people leave I to R; recovery rate
R_0 = 1.7; % R0 for Covid-19 2020 as recorded by SA gov
N = 60140000; % 2021 Population of South Africa according to https://www.gov.za/about-sa/south-africas-people
beta = R_0/(N*Duration); %contact rate


% Differential equations
%level 1 lockdown was already in place
tspan = 0:0.1:98; %september 2020 to december 2020
I = 189509;
S = N-I;
E = 0;
R = 0;
y0 = [S, E, I, R]; % Coronavirus count of South Africa 
[t,y]=ode45(@(t,y) ode_level1(t,y,beta), tspan, y0);

%% plot
plot(t,y,'LineWidth', 1.5, 'MarkerSize', 18)
legend('Susceptible','Exposed','Infectious','Recovered', 'Location', 'best', 'fontsize', 7)
xlabel('Days after September 2020')
ylabel('Population')
title('Predicted Spread of COVID-19 in South Africa during level 1 lockdown', 'fontsize', 10)
grid on;
grid minor;
set(gcf, 'units','normalized','outerposition',[0 0 1 1])

%%
figure
plot(t,y(:,3),'LineWidth', 1.5, 'MarkerSize', 18,'Color',"#EDB120")
xlabel('Days after September 2020')
ylabel('Population')
title('Predicted infection of COVID-19 in South Africa during level 1 lockdown', 'fontsize', 10)

%Reference
%Nadanomics (2020). Model COVID-19 using MATLAB (Full code in description) | Modeling the Pandemic, code 1. [online]
% www.youtube.com. Available at: https://www.youtube.com/watch?v=nHON0v0AM40&ab_channel=Nadanomics.