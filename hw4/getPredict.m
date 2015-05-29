function out=getPredict(ref, motion, N)
[H W ~]=size(motion);
out=ref;

for i=1:H
    for j=1:W
        ref_x=(i-1)*N+1;
        ref_y=(j-1)*N+1;
        out_x=ref_x+motion(i, j, 1);
        out_y=ref_y+motion(i, j, 2);
        out(out_x:out_x+N-1, out_y:out_y+N-1)=ref(ref_x:ref_x+N-1, ref_y:ref_y+N-1);
    end
end
end