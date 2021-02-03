function readings = gen_cort_readings(N)
    % generating mock cortisol reading in ng/mL
    r0 = 8;
    sd = 2.95;
    % create normally distributed  readings for N days
    readings = normrnd(r0, sd, [1, N]);
end

