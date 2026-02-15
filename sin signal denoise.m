%{
Problem: Generate a noisy sine wave and denoise it using a moving average. 
%}
clc; clear; close all;

%%setup and clean signal
fs = 200;
T = 2;
t = 0:1/fs:T;

f0 = 3; % signal frequency
clean_sig = sin(2*pi*f0*t);

noise_level = 0.5;
noise = noise_level*randn(size(t));
noisy_sig = clean_sig + noise;

k = 10;
b = (1/k)*ones(1, k);
a =1;
denoise_1 = filter(b, a, noisy_sig);
denoise_2 = movmean(noisy_sig,k);

%%Visualization
figure('Position',[100, 100, 1000, 600]);%% opens a new window
%%tells matlab how big screen do i need for plotting the plot [left,
%%bottom, width, height]

subplot(3, 1, 1); %% (3, 1, n) --> create 3 rows, 1 cols and put the following plot in nth slot
plot(t, clean_sig, 'k', 'LineWidth', 1.5);
title('Clean Signal');
grid on; ylim([-2 2]);

subplot(3,1,2);
plot(t, noisy_sig,'Color', 'red'); hold on;
plot(t, denoise_1, 'b','LineWidth', 1.5);
title(['Method 1: Filter (Convolutional) - Window Size: ',num2str(k)]);
legend('Noisy', 'Movemean');
grid on; ylim([-2 2]);


subplot(3,1,3);
plot(t, noisy_sig,'Color', [0.7 0.7 0.7]); hold on;
plot(t, denoise_2, 'r','LineWidth', 1.5);
title(['Method 2: movemean (zero phase) - Window Size: ',num2str(k)]);
legend('Noisy', 'Movemean');
grid on; ylim([-2 2]);
