load ('SAdata.mat')

%for Beta level 3
figure
hold on
plot(new_cases_smoothed(99:181))
xlim([0,84])
xlabel('Days')
ylabel('Daily New Cases')
title('smoothed Daily cases  Level 3 lockdown for B.1.351')