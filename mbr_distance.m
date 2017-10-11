function distance=mbr_distance(seg1,seg2)
%input: seg1=[xs,ys,xd,yd]
%output: mbr_distance between seg1,seg2
%

s=zeros(2,4);%[xl,xu,yl,yu;xl',xu',yl',yu']
if seg1(1,1)<seg1(1,3)
    s(1,1)=seg1(1,1);
    s(1,2)=seg1(1,3);
else
    s(1,1)=seg1(1,3);
    s(1,2)=seg1(1,1);
end

if seg1(1,2)<seg1(1,4)
    s(1,3)=seg1(1,2);
    s(1,4)=seg1(1,4);
else 
    s(1,3)=seg1(1,4);
    s(1,4)=seg1(1,2);
end

if seg2(1,1)<seg2(1,3)
    s(2,1)=seg2(1,1);
    s(2,2)=seg2(1,3);
else
    s(2,1)=seg2(1,3);
    s(2,2)=seg2(1,1);
end

if seg2(1,2)<seg2(1,4)
    s(2,3)=seg2(1,2);
    s(2,4)=seg2(1,4);
else 
    s(2,3)=seg2(1,4);
    s(2,4)=seg2(1,2);
end

x_distance=0;
y_distance=0;
if s(1,1)>s(2,2)
    x_distance=s(1,1)-s(2,2);
else if s(1,2)<s(2,1)
        x_distance=s(2,1)-s(1,2);
    end
end

if s(1,3)>s(2,4)
    y_distance=s(1,3)-s(2,4);
else if s(1,4)<s(2,3)
        y_distance=s(2,3)-s(1,4);
    end
end

distance=sqrt(x_distance*x_distance+y_distance*y_distance);

