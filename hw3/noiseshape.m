function [F_out, F_dith]=noiseshape(F_in, c)
% noise shape & dither
F_in=128*F_in;% 8 bit
F_out=floor(F_in);
D=-1+2*rand(size(F_in));
F_dith=F_in+32*D;
e=0;
for i=1:1:length(F_in)
    F_out(i)=floor(F_dith(i)+c*e);
    e=F_in(i)-F_out(i);
end
F_dith=F_dith/128;
F_out=F_out/128;
end