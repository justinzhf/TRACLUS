function N_s=compute_N(e,L_index,D)
%Compute N_e(L)
%input: e: the parameter, L: the segment index in D, D: the set of segment
%       L=[x1,y1,x2,y2] D=N x 1 struct array, struct('seg',[x1,y1,x2,y2,'clus_id',0])
%output: the set of segments index in D, the distance between L and which is less than
%        e, same as D, the 1st row in D is L itself
[D_h,~]=size(D);
N_s(1,1)=L_index;
L=D(L_index,1);
count=2;
for i=1:D_h
    seg=D(i,:);
    distance=th_distance(L.seg,seg.seg);
    if distance<e && seg.id~=L.id;
        N_s(count,1)=i;
        count=count+1;
    end
end
end