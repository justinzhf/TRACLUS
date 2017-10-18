function m_plot_seg(cla,color)
[o_h,~]=size(cla);
x=zeros(o_h,1);
y=zeros(o_h,1);
for i=1:o_h
    x(i,1)=cla(i,1).seg(1,1);
    y(i,2)=cla(i,1).seg(1,2);
end
hold on;
plot(x,y,color);
end
