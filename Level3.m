%% Parameters
alpha = 5.2; %exposed become infectious
gamma = 1/alpha; %incubation period ; rate from E to I
Duration = 8; %spend 7-14 days before being infectious
sigma = 1/Duration; % rate at which individuals leave E and I to R; recovery rate
R_0 = 1.02*5; % RO for Beta variant https://www.gov.za/Coronavirus
N = 60140000; % 2021 Population of South Africa according to https://www.gov.za/about-sa/south-africas-people
beta = R_0/(N*Duration); %contact rate (beta)


%% solving the Differential equations
I = 697660; %our world in data
S = N-I;
E = 0;
R = 0;
tspan1 = 0:1:37;% Before level 3 policy (level 1) 
y0 = [S, E, I, R];% Coronavirus count of South Africa
[t,y]=ode45(@(t,y) ode_level3(t,y,beta), tspan1, y0);
y_2nd = [y(end,1), y(end,2), y(end,3), y(end,4)];

%during level 3 lockdown
tspan2 = 38:1:70; %december 2020 to february 2021
[t,y2]=ode45(@(t,y) ode_level3(t, y, beta/4), tspan2, y_2nd); %level 3 lockdown
y_combined = [y;y2];

%%
plot(0:1:70,y_combined,'LineWidth', 1.5, 'MarkerSize', 18)
legend('S','E','I','R', 'Location', 'Best')
xlabel('Days after December, 2020')
ylabel('Population')
title('Predicted Spread of B.1.351 with level 3 lockdown')
grid on;
grid minor;
set(gcf, 'units','normalized','outerposition',[0 0 1 1])

%%
figure
plot(0:1:70,y_combined(:,3),'LineWidth', 1.5, 'MarkerSize', 18,'Color',"#EDB120")
%ylim([0 3])
xlabel('Days after December, 2020')
ylabel('Population')
title('Predicted infections of B.1.351 with level 3 lockdown')

%Reference
%Nadanomics (2020). Model COVID-19 using MATLAB (Full code in description) | Modeling the Pandemic, code 1. [online] 
% www.youtube.com. Available at: https://www.youtube.com/watch?v=nHON0v0AM40&ab_channel=Nadanomics.