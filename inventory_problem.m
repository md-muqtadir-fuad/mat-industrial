clc, clear

M = 11; % max_inventory
N = 5; % review period
cycles = 5;
total_days = N * cycles;

begining_inventory = [3; zeros((total_days-1), 1)];
ending_inventory = zeros(total_days, 1);
initial_lead_time = 2;
initial_demand = 8;

days = (1:total_days)';
demand_list = (0:1:4)';
daily_demand_pobability = [.1; .25; .35; .21; .09]; 
per_day_demand = demand_list(discretesample(daily_demand_pobability, total_days));

lead_time_list = (1:1:3)';
lead_time_probability = [0.6 ;0.3; 0.1];
per_cycle_lead_time = lead_time_list(discretesample(lead_time_probability, cycles));
lead_time = zeros(total_days, 1);

j = 1;
for i=N:N:total_days
    lead_time(i) = per_cycle_lead_time(j);
    j = j + 1;
end

shortage = zeros(total_days, 1);
order = zeros(total_days, 1);

for i=1:total_days
    if i == initial_lead_time
        begining_inventory(i) = begining_inventory(i) + initial_demand;
    end
    if begining_inventory(i) >= per_day_demand(i)
        ending_inventory(i) = begining_inventory(i) - per_day_demand(i);
        shortage(i) = 0;
        
        if (i + 1) <= total_days
            begining_inventory(i+1) = begining_inventory(i+1) + ending_inventory(i);
        end
    else
        ending_inventory(i) = 0;
        shortage(i) = per_day_demand(i) - begining_inventory(i);
        if (i + 1) <= total_days
            begining_inventory(i+1) = begining_inventory(i+1) + shortage(i);
        end
    end
    
    if rem(i, N) == 0
        order(i) = M - ending_inventory(i);
    end
    
    if (order(i) > 0) && (i + lead_time(i)) <= total_days
        begining_inventory(i + lead_time(i)) = begining_inventory(i + lead_time(i)) + order(i);
    end
end

result = [days, begining_inventory, per_day_demand, ending_inventory, shortage, order, lead_time];
names = { 'days', 'begining_inventory', 'per_day_demand', 'ending_inventory', 'shortage', 'order', 'lead_time' };
table = array2table(result, 'variablenames', names);
table
