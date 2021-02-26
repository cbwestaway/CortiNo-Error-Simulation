clc;
close all;

% timespan in days
N = 100;
%{
    coefficient of variation (CV = SD/mean)
    - Ideally our CV is less than 15% for 
      all values in the measurement range
    - Note: If possible we should aim for a 
      CV of 10% as it looks significantly better
%} 
cv = 0.15;
% get day-to-day cortisol data for N days
days = 1:N;
true_cort = gen_cort_readings(N);
% approximation of 1 standard deviation at each point
err = true_cort .* cv;

% Plot the true values with error bars representing the standard deviation
figure;
errorbar(days, true_cort, err, 'DisplayName', 'Cort. Values w/ Error');

% fit the data to a normal distribution to calculate the z-score
% this is likely similar to how we would do it in the app
[mu, sig] = normfit(true_cort);
% calculate the high and low cut offs
zth = 1.036; % 15%-85% threshold
high = ones(1, N) .* (zth * sig) + mu;
low = ones(1, N) .* (-zth * sig) + mu;
% plot the cut offs
hold on;
plot(days, high, '--', 'DisplayName', 'High Threshold');
hold on;
plot(days, low, '--', 'DisplayName', 'Low Threshold');

xlabel('Day');
ylabel('Cortisol ng/mL');
title('Cortisol Level Classification');
legend();


