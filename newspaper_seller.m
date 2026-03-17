clear, clc;
%% variable declaration
total_days = 20;
days = (1:total_days)';
buying_price = .33;
selling_price = 0.50;
scrap_price = 0.05;

newsday_type_prob = [0.35, 0.45, 0.2]';
demands_available = (40:10:100)';

rand_digit_good = [3, 8, 23, 43, 78, 93, 100]';
rand_digit_fair = [10, 28, 68, 88, 96, 100]';
rand_digit_poor = [44, 66, 82, 94, 100]';

per_day_demands = zeros(total_days, 1);
%%
newsday_types = days(discretesample(newsday_type_prob, total_days));
per_sim_profit = zeros(7, 1);
simulation = 1;

%per day demand for 20 days
for i = 1: total_days
    rand_digit = unidrnd(100); %(range, row, col)
    if newsday_types(i) == 1
        for j = 1: size(rand_digit_good, 1)
            if rand_digit <= rand_digit_good(j)
                per_day_demands(i) = demands_available(j);
                break;
            end
        end
    elseif newsday_types(i) == 2
        for j = 1: size(rand_digit_fair, 1)
            if rand_digit <= rand_digit_fair(j)
                per_day_demands(i) = demands_available(j);
                break;
            end
        end
    elseif newsday_types(i) == 3
        for j = 1: size(rand_digit_poor, 1)
            if rand_digit <= rand_digit_poor(j)
                per_day_demands(i) = demands_available(j);
                break;
            end
        end
    end
end

%% revenue, cost, profit, loss, salvage calculation
for bought = (40:10:100)
    per_day_rev = zeros(total_days, 1);
    cost_of_newspaper = zeros(total_days, 1);
    per_day_profit = zeros(total_days, 1);
    per_day_lost_profit = zeros(total_days, 1);
    per_day_salvage = zeros(total_days, 1);
    for i = 1: total_days
        if bought < per_day_demands(i)
            per_day_rev(i) = bought * selling_price;
            per_day_lost_profit(i) = ( per_day_demands(i) - bought)*(selling_price - buying_price);
            per_day_salvage(i) = 0;
        else
            per_day_rev(i) = per_day_demands(i) * selling_price;
            per_day_lost_profit(i) = 0;
            per_day_salvage(i) = ( bought - per_day_demands(i))*scrap_price;
        end
        cost_of_newspaper(i) = buying_price * bought;
        per_day_profit(i) = per_day_rev(i) - cost_of_newspaper(i) - per_day_lost_profit(i) - per_day_salvage(i);
    end
    
    per_sim_profit(simulation) = sum(per_day_profit);
    simulation = simulation + 1;
end

[max_profit, max_profit_sim] = max(per_sim_profit);

final_result = [max_profit, max_profit_sim];
final_names = {'max_profit', 'max_profit_sim'};
final_result_table = array2table(final_result, 'variablenames', final_names);
final_result_table