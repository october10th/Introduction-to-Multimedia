% hw3.m - 請完整寫出把三首歌都分出來的過程
clear all;close all;clc;
%%
% Read in input audio file (wavread or audioread)
[y, fs]=audioread('hw3_mix.wav');
% y_info=audioinfo('hw3_mix.wav');

% Filtering
%%
[y1, f1]=myFilter(y, fs, 1501, 'Blackman', 'low-pass', 300);
y1=y1*8;
% sound(y1, fs);
% fvtool(f1);
%%
[y2, f2]=myFilter(y, fs, 501, 'Rectangular', 'band-pass', [400 770]);
% sound(y2, fs);
%%
[y3, f3]=myFilter(y, fs, 801, 'Rectangular', 'high-pass', 800);
y3=y3*3;
% sound(y3, fs);
%%
% Frequency analysis - you can use the following code to plot spectrum
% y1: signal, Fs1: sampling rate
%{
L = 2^nextpow2(max(size(y1)));
y1_FFT = fft(y1,L);
xx = Fs1/2*linspace(0,1,L/2+1);
figure, plot(xx,abs(y1_FFT(1:L/2+1)));
%}
%% y
subplot(3, 4, 1);
myplot(y, fs);
title('spectrum of y');
%% y1
subplot(3, 4, 2);
myplot(y1, fs);
title('spectrum of y1');
%% y2
subplot(3, 4, 3);
myplot(y2, fs);
title('spectrum of y2');
%% y3
subplot(3, 4, 4);
myplot(y3, fs);
title('spectrum of y3');
%% f1
subplot(3, 4, 6);
myplot(f1, fs);
title('spectrum of f1');
%% f2
subplot(3, 4, 7);
myplot(f2, fs);
title('spectrum of f2');
%% f3
subplot(3, 4, 8);
myplot(f3, fs);
title('spectrum of f3');
%% f1 shape
subplot(3, 4, 10);
plot(f1);
title('shape of f1');
%% f2 shape
subplot(3, 4, 11);
plot(f2);
title('shape of f2');
%% f3 shape
subplot(3, 4, 12);
plot(f3);
title('shape of f3');
%%
% Save the filtered audio (wavwrite or audiowrite)
audiowrite('hw3_1_y1.wav', y1, fs); 
audiowrite('hw3_1_y2.wav', y2, fs);
audiowrite('hw3_1_y3.wav', y3, fs); 
%% hw3-2
[y, fs]=audioread('AnJing_4bit.wav');
% y_info=audioinfo('AnJing_4bit.wav');
subplot(1, 2, 1);
plot(y(:, 1));

subplot(1, 2, 2);
plot(y(:, 2));

myplot(y, fs);

%%
y_out=[];
y_noise=[];
% D=-1+2*rand(1);
c=0.8;
[y_out(:, 1) y_noise(:, 1)]=noiseshape(y(:, 1), c);
[y_out(:, 2) y_noise(:, 2)]=noiseshape(y(:, 2), c);
subplot(1, 2, 1);
plot(y_out(:, 1));
plot(y_out(:, 2));

plot(y_noise(:, 1));
plot(y_noise(:, 2));
subplot(1, 2, 2);
myplot(y_out(:, 2), fs);
%%
% audiowrite('hw3_2_only_shape.wav', y_out, fs); 
% sound(y_out, fs);
%%
% y_out=y;
yf=[];
fc=500;
N=501;
[y_out(:, 1), yf(:, 1)]=myFilter(y_out(:, 1), fs, N, 'Rectangular', 'low-pass', fc);
[y_out(:, 2), yf(:, 2)]=myFilter(y_out(:, 2), fs, N, 'Rectangular', 'low-pass', fc);
% sound(y_out, fs);
audiowrite('hw3_2.wav', y_out, fs); 
% notes