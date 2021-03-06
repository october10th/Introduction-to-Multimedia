function [out, filter] = myFilter(in, fs, N, wFun, type, para)

% in: input signal
% fs: sampling frequency
% N : size of FIR filter, assumed to be odd
% wFun: 'Hanning', 'Hamming', 'Blackman'
% type: 'low-pass', 'high-pass', 'bandpass', 'bandstop' 
% para: cut-off frequency or band frequencies corresponding to the filter type
%       if type is 'low-pass' or 'high-pass', para has only one element         
%       if type is 'bandpass' or 'bandstop', para is a vector of 2 elements

f_c=para;
% 1. Normalization
f_c=f_c/fs;
w_c=2*pi*f_c;

% 2. Create the filter according the ideal equations in Table5.2
middle=floor(N/2);
filter=zeros(1, N);
w=zeros(1, N);
if strcmp(type,'low-pass')==1, 
    
    for n=-middle:1:middle
        if n==0
            filter(middle+1)=1; % dummy value to avoid devide by 0
        else
            filter(n+middle+1) = sin(2*pi*f_c*n)/(pi*n);
        end
    end
    filter(middle+1) = 2*f_c;
elseif strcmp(type, 'high-pass')==1
    for n=-middle:1:middle
        if n==0
            filter(middle+1)=1; % dummy value to avoid devide by 0
        else
            filter(n+middle+1) = -sin(2*pi*f_c*n)/(pi*n);
        end
    end
    filter(middle+1) = 1-2*f_c;
elseif strcmp(type, 'band-pass')==1
    for n=-middle:1:middle
        if n==0
            filter(middle+1)=1; % dummy value to avoid devide by 0
        else
            filter(n+middle+1) = sin(2*pi*f_c(2)*n)/(pi*n)...
                                -sin(2*pi*f_c(1)*n)/(pi*n);
        end
    end
    filter(middle+1) = 2*(f_c(2)-f_c(1));
elseif strcmp(type, 'band-stop')==1
    for n=-middle:1:middle
        if n==0
            filter(middle+1)=1; % dummy value to avoid devide by 0
        else
            filter(n+middle+1) = sin(2*pi*f_c(1)*n)/(pi*n)-sin(2*pi*f_c(2)*n)/(pi*n);
        end
    end
    filter(middle+1) = 1-2*(f_c(2)-f_c(1));
end
        
% 3. Create the windowing function
if strcmp(wFun,'Hanning')==1,
    for n = 0:1:N-1
        w(n+1)=(0.5 + 0.5*cos((2*pi*n)/N));
    end
elseif strcmp(wFun,'Hamming')==1,
    for n = 0:1:N-1
        w(n+1)=(0.54 + 0.46*cos((2*pi*n)/N));
    end
elseif strcmp(wFun,'Blackman')==1,
    for n = 0:1:N-1
        w(n+1)=(0.42 + 0.5*cos((2*pi*n)/(N-1))+0.08*cos((4*pi*n)/(N-1)));
    end
elseif strcmp(wFun,'Rectangular')==1,
    % do nothing
    for n = 0:1:N-1
        w(n+1)=1;
    end
end
      
% 4. Get the realistic filter
for n = 0:1:N-1
    filter(n+1) = filter(n+1) * w(n+1);
end


% 5. Filter the input signal in time domain. Do not use matlab function 'conv'

%% not using
% X=fft(in);
% H=fft(filter);
% Y=X*H;
% out=ifft(Y);
%%
% out=conv(in, filter);
%% 
out=convolution(in, filter);

