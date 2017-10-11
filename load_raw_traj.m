function T_data=load_raw_traj(raw_traj)
%input: raw_traj struct('X',[...],'C1',[...],'C2',[...],'C3',[...])
%       X:1 x 10  C1:50 x 10  same as C2, C3
%output: 1 x 150 struct array, strcut('id',1,'clus_id',0,cord,[2x10])
%
X=raw_traj.X;
C1=raw_traj.C1;
C2=raw_traj.C2;
C3=raw_traj.C3;

for i=1:50
    T_data(i).id={strcat('1',num2str(i))};
    T_data(i).clus_id=0;
    T_data(i).cord=[X;C1(i,:)];
    
    T_data(i+50).id={strcat('2',num2str(i))};
    T_data(i+50).clus_id=0;
    T_data(i+50).cord=[X;C2(i,:)];
    
    T_data(i+100).id={strcat('3',num2str(i))};
    T_data(i+100).clus_id=0;
    T_data(i+100).cord=[X;C3(i,:)];
end

end