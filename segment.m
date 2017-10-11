function S=m_segment(X,Y)
%对轨迹进行分段
%input:  X:1XN的x坐标  Y:1XN的y坐标
%output: S 4X(N-1)的矩阵。例如:[x1,y1，x2,y2;x3,y3,x4,y4]
%(x1,y1)(x2,y2)是第一个segment的起点和终点
cord=[X;Y];
[x_h,x_w]=size(X);
[y_h,y_w]=size(Y);
S=zeros(x_w-1,4);
for i=1:x_w-1
    S(i,:)=[cord(:,i)',cord(:,i+1)'];
end
