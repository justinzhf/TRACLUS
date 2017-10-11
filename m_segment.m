function S=m_segment(X,Y,con,pre)
%�Թ켣���зֶ�
%input:  X:1XN��x����  Y:1XN��y����
%output: S M X 4�ľ�������:[x1,y1��x2,y2;x3,y3,x4,y4]
%(x1,y1)(x2,y2)�ǵ�һ��segment�������յ�
cord=[X;Y];
[~,x_w]=size(X);

Graph=zeros(x_w);
for i=1:x_w
    for j=i:x_w
        if i==j
            Graph(i,j)=0;
            Graph(j,i)=0;
        else
            Graph(i,j)=con*cal_LH(cord,[i,j])+pre*cal_LDH(cord,[i,j])+1;
            Graph(j,i)=Graph(i,j);
        end
    end
end
[~,L] = dijkstra(Graph,1,x_w);

[~,L_w]=size(L);
S=zeros(L_w-1,4);
seg_num=1;
for i=L_w:-1:2
    p_s=cord(:,L(1,i));
    p_e=cord(:,L(1,i-1));
    S(seg_num,:)=[p_s',p_e'];
    seg_num=seg_num+1;
end



