function m_plot_clus(clusters,acc_clus_threhold)
%·ÏÆú²»ÓÃ
    [~,clus_w]=size(clusters.clus);
    color={'r','b','w','k','y'};
    tt=1;
    for i=1:clus_w
        cla=clusters.clus(i).cla;
        [traj_h,~]=size(cla);
        if traj_h>=acc_clus_threhold
            for j=1:traj_h
                plot(cla(j).cord(1,:),cla(j).cord(2,:),color(1,tt));
                tt=tt+1;
            end
        end
    end
end