clc;
close all;

% define timespan in days
N = 100;
% get day-to-day cortisol data for N days
days = 1:N;
true_cort = gen_cort_readings(N);


% visualize
figure;
% upper bound for accuracy
upper = true_cort + 0.47;
plot(days, upper, 'DisplayName', 'Soma Error UB');
% true levels
hold on;
plot(days, true_cort, 'DisplayName', 'True Value');
% lower bound for accuracy
hold on;
lower = true_cort - 0.47;
plot(days, lower, 'DisplayName', 'Soma Error LB');

% fit the data to a normal distribution to calculate the z-score
[mu, sig] = normfit(true_cort);
% calculate the high and low cut offs
zth = 1.036;
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


