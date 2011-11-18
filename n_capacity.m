% Sub Program
%
% n_capacity.m
%
% This function generates the netwrok capacity


function [ output_simulation ] = n_capacity(Capacity,Capacity_IFR,TLPC)
z=0;
n = 0;
avg_Capacity = mean(Capacity);
avg_Capacity_IFR = mean(Capacity_IFR);
avg_Capacity_TLPC = mean(TLPC(:,2));
while n < 100
    n = n + 1;
    if Capacity(n,1) > avg_Capacity
        capacity_temp(n,1) = Capacity(n,1);
    else
        capacity_temp(n,1) = 0;
    end
    if Capacity_IFR(n,1) > avg_Capacity_IFR
        capacity_IFR_temp(n,1) = Capacity_IFR(n,1);
    else
        capacity_IFR_temp(n,1) = 0;
    end
    if TLPC(n,2) > avg_Capacity_TLPC
        capacity_TLPC_temp(n,1) = TLPC(n,2);
    else
        capacity_TLPC_temp(n,1) = 0;
    end
end   
for x = 1:10:100
    y = x + 10;
    if y == 101;
        y = y - 1;
    elseif y > 100
        break
    end
    z = z + 1;
    % Fairless Time
    capacity_time = mean(Capacity(x:y,1));
    capacity_IFR_time = mean(Capacity_IFR(x:y,1));
    capacity_TLPC_time = mean(TLPC(x:y,2));
    % Fairless Throughput
    capacity_thr = mean(capacity_temp(x:y,1));
    capacity_IFR_thr = mean(capacity_IFR_temp(x:y,1));
    capacity_TLPC_thr = mean(capacity_TLPC_temp(x:y,1));
    % Result
    output_simulation(z,1) = capacity_time;
    output_simulation(z,2) = capacity_IFR_time;
    output_simulation(z,3) = capacity_TLPC_time;
    output_simulation(z,4) = capacity_thr;
    output_simulation(z,5) = capacity_IFR_thr;
    output_simulation(z,6) = capacity_TLPC_thr;
end
% Distance
for k = 1:10
    kk = k * 0.1;
    output_simulation(k,7) = kk;
end
end