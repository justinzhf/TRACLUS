function T_data=get_new_data(clusters)
    [~,clus_w]=size(clusters.clus);
     for i=1:clus_w
         [traj_h,~]=size(clusters.clus(i).cla);
         
         if traj_h==0
             a=1
         end
         
         chose_traj=unidrnd(traj_h);
         T_data(i)=clusters.clus(i).cla(chose_traj);
     end
end