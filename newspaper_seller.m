total_days = 20;
days = (1:total_days)';
buying_price = .33;
selling_price = 0.50;
scrap_price = 0.05;

newsday_type_probability = [0.35, 0.45, 0.2]';
demands_available = (40:10:100)';

rand_digit_good = [3, 8, 23, 43, 78, 93, 100];
%rand_digit_fair = 
%rand_digit_poor = 