mu=0;
sig=20;

X=[1,6,8,13,21,25,30,35,40,45];

C1=zeros(50,10);
Y1=120+4*X;
for i=1:50
    C1(i,:)=Y1+normrnd(mu,sig,[1,10]);
end

C2=zeros(50,10);
Y2=10+2*X+0.1*X.*X;
for i=1:50
    C2(i,:)=Y2+normrnd(mu,sig,[1,10]);
end

C3=zeros(50,10);
Y3=250-0.75*X;
for i=1:50
    C3(i,:)=Y3+normrnd(mu,sig,[1,10]);
end

hold on;
for i=1:50
    plot(X,C1(i,:),'r')
end

for i=1:50
    plot(X,C2(i,:),'b')
end

for i=1:50
    plot(X,C3(i,:),'g')
end
