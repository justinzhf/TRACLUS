function s_data=gen_segment_data(data,con,pre)
%产生每条轨迹的分段数据
%input: data 1 X N struct array, struct('id',xxx,'cord',[x1,x2,x3...;y1,y1,y3...])
%       con:ASTS.mat con=0.3753, pre: ASTS.mat pre=1
%output:s_data N X 1 struct array;struct('id',xxx,'segs',[x1,y1,x2,y2;....])
    [~,traj_w]=size(data);
    s_data=[];
    for i=1:traj_w
        S=m_segment(data(i).cord(1,:),data(i).cord(2,:),con,pre);
        s_data(i).id=data(i).id;
        s_data(i).id=S;
    end
end