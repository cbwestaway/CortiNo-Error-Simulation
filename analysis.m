clc;
close all;

% define timespan in days
N = 150;
% get day-to-day cortisol data for N days
days = 1:N;
true_cort = gen_cort_readings(N);

% visualize
figure;
% upper bound for accuracy
upper = true_cort * 1.1;
plot(days, upper);
% true levels
hold on;
plot(days, true_cort);
% lower bound for accuracy
hold on;
lower = true_cort * 0.9;
plot(days, lower);

