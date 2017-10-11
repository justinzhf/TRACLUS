function O=traclus(D,e,MinLns)
%TRACLUS
clus_id=1;
[s_h,~]=size(D);
for i=1:s_h
    L=D(i,:);
    N_s=compute_N(e,L,D);
    [N_s_h,~]=size(N_s);
    if N_s_h>=MinLns
       %assign clusterId to N_s
        for j=1:N_s_h
           N_s(j,1).clus_id=clus_id;
        end     
       %insert N-L into the queue and expand cluster.Besides N_s is the
       %final cluster
       for j=2:N_s_h
           seg=N_s(j,1);
           N_seg=compute_N(e,seg,D);
           [N_seg_h,~]=size(N_seg);
           if N_seg_h>=MinLns
                for k=1:N_seg_h
                    n_seg=N_seg(k,1);
                    %n_seg is unclassified
                    if n_seg.clus_id==0
                        n_seg.clus_id=clus_id;
                        N_s_h=N_s_h+1;
                        N_s(N_s_h,1)=n_seg;
                    end
                    %n_seg is noise
                    if n_seg.clus_id==-1
                        n_seg.clus_id=clus_id;
                    end
                end
           end
       end
       O(clus_id).id=clus_id;
       O(clus_id).cla=N_s;
       %increase clusterId by 1
       clus_id=clus_id+1;
    else
        %mark L as a noise
        L.clus_id=-1;
    end
end
%check trajectory cardinality
[~,O_w]=size(O);
for i=1:O_w
    %calculate |PTR(C)|
    cla=O_w(i).cla;
    [cla_h,~]=size(cla);
    for j=1:cla_h
        cla_ids(j,1)={cla(j,1).traj_id};
    end
    cla_ids=sort(cla_ids);
    pre_id=cla_ids(1,1);
    ptr=0;
    for j=2:cla_h
        id=cla_ids(j,1)
        if strcmp(id,pre_id)~=1
            prt=ptr+1;
            pre_id=id;
        end
    end
    
    if ptr<MinLns
        %remove C from set O
        O_w(i)=[];
    end
    
end


















end