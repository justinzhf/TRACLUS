function distance=th_distance(seg1,seg2)
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
    prl_distance_1=abs((sj-si)*va')/length_a;
    prl_distance_2=abs((ej-ei)*va')/length_a;
    pdd_distance_1=abs((sj-si)*va_pdd')/length_a;
    pdd_distance_2=abs((ej-ei)*va_pdd')/length_a;
    agl_distance=abs(vb*va_pdd')/length_a;

    if pdd_distance_1==0&&pdd_distance_2==0
        pdd_distance=0;
    else
         pdd_distance=(pdd_distance_1*pdd_distance_1+pdd_distance_2*pdd_distance_2)/(pdd_distance_1+pdd_distance_2);
    end
    prl_distance=min(prl_distance_1,prl_distance_2);

    distance=pdd_distance+prl_distance+agl_distance;
else
    ab=va*vb';
    vb_pdd=[-vb(1,2),vb(1,1)];
    if ab<0
        sj=seg1(3:4);ej=seg1(1:2);
        va=ej-sj;
    end
    prl_distance_1=abs((sj-si)*vb')/length_b;
    prl_distance_2=abs((ej-ei)*vb')/length_b;
    pdd_distance_1=abs((sj-si)*vb_pdd')/length_b;
    pdd_distance_2=abs((ej-ei)*vb_pdd')/length_b;
    agl_distance=abs(va*vb_pdd')/length_b;

    if pdd_distance_1==0&&pdd_distance_2==0
        pdd_distance=0;
    else
         pdd_distance=(pdd_distance_1*pdd_distance_1+pdd_distance_2*pdd_distance_2)/(pdd_distance_1+pdd_distance_2);
    end
    prl_distance=min(prl_distance_1,prl_distance_2);

    distance=pdd_distance+prl_distance+agl_distance;
end

end