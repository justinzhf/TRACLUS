function LDH=cal_LDH(cord,par_points)
%calculate L(D|H)
%input: 原轨迹中的所有点cord=[x1,x2,x3...;y1,y2,y3...], par_points=[index1,index2,...] 从原轨迹中选取的点的index
%output: L(D|H)
[~,points_h]=size(par_points);
LDH=0;
total_pdd=0;
total_agl=0;
for i=1:points_h-1
    start_index=par_points(1,i);
    end_index=par_points(1,i+1);
    p1=cord(:,par_points(1,i))';
    p2=cord(:,par_points(1,i+1))';
    seg=[p1,p2];
    if start_index<=end_index-1
        for j=start_index:end_index-1
            primitive_seg=[cord(:,j)',cord(:,j+1)'];
            total_pdd=total_pdd+cal_pdd_distance(seg,primitive_seg);
            total_agl=total_agl+cal_agl_distance(seg,primitive_seg);
        end
    else
        for j=end_index:start_index-1
            primitive_seg=[cord(:,j)',cord(:,j+1)'];
            total_pdd=total_pdd+cal_pdd_distance(seg,primitive_seg);
            total_agl=total_agl+cal_agl_distance(seg,primitive_seg);
        end
    end

end
LDH=log2(total_pdd+1)+log2(total_agl+1);
end

function pdd_distance=cal_pdd_distance(seg1,seg2)
%input: seg1=[xs,ys,xd,yd]
%output: th_distance between seg1,seg2

si=seg1(1:2);ei=seg1(3:4);
sj=seg2(1:2);ej=seg2(3:4);
va=ei-si;
vb=ej-sj;
length_a=sqrt(va*va');
length_b=sqrt(vb*vb');
if (length_a)>(length_b)
    ab=va*vb';
    va_pdd=[-va(1,2),va(1,1)];
    if ab<0
        sj=seg2(3:4);ej=seg2(1:2);
        vb=ej-sj;
    end
    pdd_distance_1=abs((sj-si)*va_pdd')/length_a;
    pdd_distance_2=abs((ej-ei)*va_pdd')/length_a;
    

       if pdd_distance_1==0&&pdd_distance_2==0
        pdd_distance=0;
    else
         pdd_distance=(pdd_distance_1*pdd_distance_1+pdd_distance_2*pdd_distance_2)/(pdd_distance_1+pdd_distance_2);
    end
    
else
    ab=va*vb';
    vb_pdd=[-vb(1,2),vb(1,1)];
    if ab<0
        sj=seg1(3:4);ej=seg1(1:2);
        va=ej-sj;
    end
    
    pdd_distance_1=abs((sj-si)*vb_pdd')/length_b;
    pdd_distance_2=abs((ej-ei)*vb_pdd')/length_b;
    

    if pdd_distance_1==0&&pdd_distance_2==0
        pdd_distance=0;
    else
         pdd_distance=(pdd_distance_1*pdd_distance_1+pdd_distance_2*pdd_distance_2)/(pdd_distance_1+pdd_distance_2);
    end
end
end

function agl_distance=cal_agl_distance(seg1,seg2)
%input: seg1=[xs,ys,xd,yd]
%output: th_distance between seg1,seg2

si=seg1(1:2);ei=seg1(3:4);
sj=seg2(1:2);ej=seg2(3:4);
va=ei-si;
vb=ej-sj;
length_a=sqrt(va*va');
length_b=sqrt(vb*vb');
if (length_a)>(length_b)
    ab=va*vb';
    va_pdd=[-va(1,2),va(1,1)];
    if ab<0
        sj=seg2(3:4);ej=seg2(1:2);
        vb=ej-sj;
    end

    agl_distance=abs(vb*va_pdd')/length_a;

else
    ab=va*vb';
    vb_pdd=[-vb(1,2),vb(1,1)];
    if ab<0
        sj=seg1(3:4);ej=seg1(1:2);
        va=ej-sj;
    end

    agl_distance=abs(va*vb_pdd')/length_b;

end
end