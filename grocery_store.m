clc, clear

% the problem will be solved with out discretesample function
n = 15;
customer = (1: 1: n)';
interarrival_time = [0; unidrnd(8, n-1, 1)];
arrival_time = zeros(n, 1);

for i = 2 : n
    arrival_time(i) = arrival_time(i-1) + interarrival_time(i);
end

service_time = zeros(n, 1);
rand_digit = unidrnd(100, n, 1);

for i = 1 : n
    if rand_digit(i)>=1 && rand_digit(i) <= 10
        service_time(i) = 1;
    elseif rand_digit(i)>=11 && rand_digit(i) <= 30
        service_time(i) = 2;
    elseif rand_digit(i)>=31 && rand_digit(i) <= 60
        service_time(i) = 3;
    elseif rand_digit(i)>=61 && rand_digit(i) <= 85
        service_time(i) = 4;
    elseif rand_digit(i)>=86 && rand_digit(i) <= 95
        service_time(i) = 5;
    else
        service_time(i) = 6;
    end
end

service_start_time = zeros(n, 1);

for i = 2: n
    if arrival_time(i) >= (service_start_time(i-1) + service_time(i-1))
        service_start_time(i) = arrival_time(i);
    else
        service_start_time(i) = service_start_time(i-1) + service_time(i-1);
    end
end

service_end_time = service_start_time + service_time;
waiting_time = service_start_time - arrival_time;

system_idle_time = zeros(n, 1);

for i = 2 : n
    system_idle_time(i) = service_start_time(i) - service_end_time(i-1);
end

results = [customer, service_start_time, interarrival_time, arrival_time, service_end_time, waiting_time, system_idle_time];
names = {'customer', 'service_start_time', 'interarrival_time', 'arrival_time', 'service_end_time', 'waiting_time', 'system_idle_time'};
table = array2table(results, 'variablename', names);
table

