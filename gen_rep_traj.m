function rep_traj=gen_rep_traj(diff_threhold,min_lns,cla,s_map)
%Representative Trajectory Generation
%input: cla struct(id,'sas','cord',[2 ])
%output: rep_traj 2 X N mat [x1,x2,x3...;y1,y2,y3...]

rep_traj_x=[];
rep_traj_y=[];

[traj_h,~]=size(cla);
segments=[];

for i=1:traj_h
    segments=[segments;s_map(char(cla(i).id))];
end

[seg_h,~]=size(segments);

v1=[segments(1,3)-segments(1,1),segments(1,4)-segments(1,2)];
V=v1;
for i=2:seg_h
    v=[segments(i,3)-segments(i,1),segments(i,4)-segments(i,2)];
    V=V+v;
end
p=[segments(:,1:2);segments(:,3:4);];

V=V/sqrt(V*V');

x_unit=[1,0];
cos=V*x_unit';
sin=sqrt(1-cos*cos);
trans_mat=[cos,-sin;sin,cos];
trans_segments=[segments(:,1:2)*trans_mat,segments(:,3:4)*trans_mat];
trans_p=p*trans_mat;
sorted_trans_p=sortrows(trans_p);

[sp_h,~]=size(sorted_trans_p);

rep_traj_trans_x=[];
rep_traj_trans_y=[];
pre_px=sorted_trans_p(1,1);
for i=1:sp_h
    px=sorted_trans_p(i,1);
    contain_pys=[];
    num_p=0;
    for j=1:seg_h
        sx_start=trans_segments(j,1);
        sx_end=trans_segments(j,3);
        if (sx_start<=px&&px<=sx_end)||(sx_start>=px&&px>=sx_end)
            num_p=num_p+1;
            sy_start=trans_segments(j,2);
            sy_end=trans_segments(j,4);
            contain_pys=[contain_pys;sy_start+((sy_end-sy_start)*(px-sx_start)/(sx_end-sx_start))];
        end
    end
    if i>1
        if abs(px-pre_px)>=diff_threhold && num_p>=min_lns
            py=mean(contain_pys);
            true_p=[px,py]*trans_mat^(-1);
            rep_traj_x=[rep_traj_x,true_p(1,1)];
            rep_traj_y=[rep_traj_y,true_p(1,2)];
            pre_px=px;
        end
    else
        if num_p>=min_lns
            py=mean(contain_pys);
            true_p=[px,py]*trans_mat^(-1);
            rep_traj_x=[rep_traj_x,true_p(1,1)];
            rep_traj_y=[rep_traj_y,true_p(1,2)];
        end
    end

end

rep_traj=[rep_traj_x;rep_traj_y];

end