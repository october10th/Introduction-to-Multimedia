function out=bazier(p, Nt)
M=[-1 3 -3 1; 3 -6 3 0;-3 3 0 0;1 0 0 0];
t=0:Nt:1;
ptNum=size(p, 1);
out=[];
for i=1:3:ptNum-2
    
    G=[ p(i, 1) p(mod(i, ptNum)+1, 1) p(mod(i+1, ptNum)+1, 1) p(mod(i+2, ptNum)+1, 1);
        p(i, 2) p(mod(i, ptNum)+1, 2) p(mod(i+1, ptNum)+1, 2) p(mod(i+2, ptNum)+1, 2)]';
    for j=1:size(t, 2)
        T=[t(j)^3 t(j)^2 t(j) 1];
        pp=[T*M*G(:, 1) T*M*G(:, 2)];
        
        out=[out;pp];
    end
end

% bounady case
i=i+3;
if i+1 == ptNum % 2 pt (3)
    M=[  1 -2 1;
        -2 2 0;
         1 0 0];
    G=[ p(i, 1) p(mod(i, ptNum)+1, 1) p(mod(i+1, ptNum)+1, 1) ;
        p(i, 2) p(mod(i, ptNum)+1, 2) p(mod(i+1, ptNum)+1, 2) ]';
    for j=1:size(t, 2)
        T=[t(j)^2 t(j) 1];
        pp=[T*M*G(:, 1) T*M*G(:, 2)];
        out=[out;pp];
    end
elseif i == ptNum % 1 pt (2)
    M=[ -1 1;
         1 0];
    G=[ p(i, 1) p(mod(i, ptNum)+1, 1) ;
        p(i, 2) p(mod(i, ptNum)+1, 2) ]';
    for j=1:size(t, 2)
        T=[t(j) 1];
        pp=[T*M*G(:, 1) T*M*G(:, 2)];
        out=[out;pp];
    end


end

end

