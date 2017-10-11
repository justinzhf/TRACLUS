function s_set=gen_segment_set(s_data)
%input: s_data: segment data
%output: s_set Nx1 struct array, N is the number of segments, 
%        struct('clus_id',0,seg,[x1,y1,x2,y2])
[s_h,~]=size(s_data);
count=1;
for i=1:s_h
    segs=s_data(i,1).segs;
    [segs_h,~]=size(segs);
    for j=1:segs_h
        s_set(count).seg=segs(j,:);
        s_set(count).clus_id=0;
        s_set(count).id=j;
        s_set(count).traj_id=s_data(i,1).id;
        count=count+1;
    end
end
s_set=s_set';

end