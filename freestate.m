
% Parameters
alpha = 5.2;
gamma = 1/alpha; 
Duration = 7; 
sigma = 1/Duration; 
R_0 = 1.09*10; % RO for Beta variant https://www.gov.za/Coronavirus
N = 2745590; % 2021 Population of South Africa according to https://www.gov.za/about-sa/south-africas-people
beta = R_0/(N*Duration); 


% Differential equations
I = 61974; %https://www.nicd.ac.za/latest-confirmed-cases-of-covid-19-in-south-africa-29-dec-2020/
S = N-I;
E = 0;
R = 0;
tspan1 = 0:1:37; 
y0 = [S, E, I, R];
[t,y]=ode45(@(t,y) ode_level3(t,y,beta), tspan1, y0);
y_2nd = [y(end,1), y(end,2), y(end,3), y(end,4)];

%during level 3 lockdown
tspan2 = 38:1:80; 
[t,y2]=ode45(@(t,y) ode_level3(t, y, beta/4), tspan2, y_2nd); %level 3 lockdown
y_combined = [y;y2];

%
plot(0:1:80,y_combined,'LineWidth', 1.5, 'MarkerSize', 18)
legend('S','E','I','R', 'Location', 'Best')
xlabel('Days after December, 2020')
ylabel('Population')
title('Predicted Spread of B.1.351 - Free State')
grid on;
grid minor;
set(gcf, 'units','normalized','outerposition',[0 0 1 1])

%
figure
plot(0:1:80,y_combined(:,3),'LineWidth', 1.5, 'MarkerSize', 18,'Color',"#EDB120")
xlabel('Days after December, 2020')
ylabel('Population')
title('Predicted infections of B.1.351 - Free State')