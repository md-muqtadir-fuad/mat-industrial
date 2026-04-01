clc, clear
% all calculation will be estimated based on unit time --> minutes
downtime_cost = 5;
repairperson_cost = 15/60;
bearing_cost = 10;
max_operation_time = 20000;

bearing_life_hours = (1000:100:1900)';
bearing_life_propability = [0.1; 0.13; 0.25; 0.13; 0.09; 0.12; 0.02; 0.06; 0.05; 0.05];

delay_time_minutes = (5:5:15)';
delay_time_probability = [0.6; 0.3; 0.1];

bearing_life_sum = zeros(3, 1);
delay_time_sum = zeros(3, 1);
per_replacement_cost = zeros(3, 1);
per_repairperson_total_cost = zeros(3, 1);
per_downtime_total_cost = zeros(3, 1);
per_bearing_total_cost = zeros(3, 1);

% first case: change one bearing when one fails
for i=1:3
    no_of_bearing = 0;
    for j=1:20
        bearing_life = bearing_life_hours(discretesample(bearing_life_propability, 1));
        bearing_life_sum(i) = bearing_life_sum(i) +  bearing_life;
        
        if bearing_life_sum(i) >= max_operation_time
            no_of_bearing = j;
            break;
        end
        
        delay_time = delay_time_minutes(discretesample(delay_time_probability, 1));
        delay_time_sum(i) = delay_time_sum(i) + delay_time;
    end
    
    per_replacement_cost(i) = bearing_cost * (no_of_bearing - 1);
    per_repairperson_total_cost(i) = repairperson_cost * 20 * (no_of_bearing - 1);
    per_downtime_total_cost(i) = delay_time_sum(i) * downtime_cost + downtime_cost * 20 * (no_of_bearing - 1) ;
    per_bearing_total_cost(i) = per_replacement_cost(i) + per_repairperson_total_cost(i) + per_downtime_total_cost(i);
end

total_cost = sum(per_bearing_total_cost);
fprintf('Total bearing cost: %d\n', total_cost);

% second case: change all bearings when one fails
per_bearing_life_sum_case2 = zeros(20, 1);
delay_time_sum_case2 = 0;
replacement_cost_case2 = 0;
repairperson_total_cost_case2 = 0;
downtime_total_cost_case2 = 0;
bearing_total_cost_case2 = 0;

no_of_bearing = 0;

for i = 1:20
    per_bearing_life = bearing_life_hours(discretesample(bearing_life_propability, 3));
    per_bearing_life = min(per_bearing_life);
    per_bearing_life_sum_case2 = per_bearing_life_sum_case2 +  per_bearing_life;
        
    if per_bearing_life_sum_case2 >= max_operation_time
        no_of_bearing = i;
        break
    end 
    
    delay_time = delay_time_minutes(discretesample(delay_time_probability, 1));
    delay_time_sum_case2 = delay_time_sum_case2 + delay_time;
end

replacement_cost_case2 = 3 * bearing_cost * (no_of_bearing - 1);
repairperson_total_cost_case2 = repairperson_cost * 40 * (no_of_bearing - 1);
downtime_total_cost_case2 = delay_time_sum_case2 * downtime_cost + downtime_cost * 40 * (no_of_bearing - 1) ;
total_cost_case2 = replacement_cost_case2 + repairperson_total_cost_case2 + downtime_total_cost_case2;

fprintf('Total bearing cost: %d\n', total_cost_case2);

% define replacement policy

if total_cost > total_cost_case2
    fprintf('Choose Plicy 2: change one bearing which fails');
else
    fprintf('Choose Plicy 1: change all bearing if one fails');
end