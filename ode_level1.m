function dydt = ode_level1(t, y,beta) %dy dt is change 

k = 1.88;  % Death rate of COVID-19
alpha = 5.2;
gamma = 1/alpha;
Duration = 7;
sigma = 1/Duration;
S = y(1);
E= y(2);
I = y(3);

dS = -beta*I.*S;
dE = beta*I.*S -  gamma.*E;
dI = gamma*E - sigma*I;
dR = sigma*(1-k)*I;

dydt = [dS; dE; dI; dR];
end