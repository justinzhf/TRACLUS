function LH=cal_LH(cord,par_points)
%calculate L(H)
%input: ԭ�켣�е����е�cord=[x1,x2,x3...;y1,y2,y3...], par_points=[index1,index2,...] ��ԭ�켣��ѡȡ�ĵ��index
%output: L(H)
[~,points_h]=size(par_points);
LH=0;
for i=1:points_h-1
    p1=cord(:,par_points(1,i))';
    p2=cord(:,par_points(1,i+1))';
    LH=LH+norm(p1-p2);
end
LH=log2(LH+1);
end