function distance=min_st_distance(seg,traj,type,s_map)
%���ڸ�����segment seg���ҳ�trajectory trai�о���seg�����seg'�ľ��루mbr distance��
%input: seg=[xs,ys,xd,yd] traj=[x1,x2,x3...;y1,y2,y3...] type: mbr or th

segs=s_map(char(traj.id));
[h,~]=size(segs);
num_segs=h;

distances=zeros(num_segs,1);
if strcmp(type,'mbr')
    for i=1:num_segs
        distances(i,1)=mbr_distance(seg,segs(i,:));
    end
else if strcmp(type,'th')
    for i=1:num_segs
        distances(i,1)=th_distance(seg,segs(i,:));
    end
    else
         disp('�������󣬳����˳�');  
         return;
    end
end


distance=min(distances);