function myplot(y, fs)

L = 2^nextpow2(max(size(y)));
y_FFT = fft(y,L);
xx = fs/2*linspace(0,1,L/2+1);
plot(xx,abs(y_FFT(1:L/2+1)));
end