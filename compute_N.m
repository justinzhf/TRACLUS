function N_s=compute_N(e,L,D)
%Compute N_e(L)
%input: e: the parameter, L: the segment, D: the set of segment
%       L=[x1,y1,x2,y2] D=N x 1 struct array, struct('seg',[x1,y1,x2,y2,'clus_id',0])
%output: the set of segments, the distance between L and which is less than
%        e, same as D, the 1st row in D is L itself
[D_h,~]=size(D);
N_s(1,1)=L;
count=2;
for i=1:D_h
    seg=D(i,:);
    distance=th_distance(L.seg,seg.seg);
    if distance<e && seg.id~=L.id;
        N_s(count,1)=seg;
        count=count+1;
    end
end
end