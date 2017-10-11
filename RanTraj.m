mu=0
sig=20;

X=[1,6,8,13,21,25,30,35,40,45];

Y1=120+4*X;
Y1_1=Y1+normrnd(mu,sig,[1,10]);
Y1_2=Y1+normrnd(mu,sig,[1,10]);
Y1_3=Y1+normrnd(mu,sig,[1,10]);
Y1_4=Y1+normrnd(mu,sig,[1,10]);
Y1_5=Y1+normrnd(mu,sig,[1,10]);
hold on;
plot(X,Y1,'k')
plot(X,Y1_1,'o-');
plot(X,Y1_2,'o-');
plot(X,Y1_3,'o-');
plot(X,Y1_4,'o-');
plot(X,Y1_5,'o-');


Y2=10+2*X+0.1*X.*X;
Y2_1=Y2+normrnd(mu,sig,[1,10]);
Y2_2=Y2+normrnd(mu,sig,[1,10]);
Y2_3=Y2+normrnd(mu,sig,[1,10]);
Y2_4=Y2+normrnd(mu,sig,[1,10]);
Y2_5=Y2+normrnd(mu,sig,[1,10]);

hold on;
plot(X,Y2,'k')
plot(X,Y2_1,'x-');
plot(X,Y2_2,'x-');
plot(X,Y2_3,'x-');
plot(X,Y2_4,'x-');
plot(X,Y2_5,'x-');

Y3=250-0.75*X;
Y3_1=Y3+normrnd(mu,sig,[1,10]);
Y3_2=Y3+normrnd(mu,sig,[1,10]);
Y3_3=Y3+normrnd(mu,sig,[1,10]);
Y3_4=Y3+normrnd(mu,sig,[1,10]);
Y3_5=Y3+normrnd(mu,sig,[1,10]);


hold on;
plot(X,Y3,'k');
plot(X,Y3_1,'v-');
plot(X,Y3_2,'v-');
plot(X,Y3_3,'v-');
plot(X,Y3_4,'v-');
plot(X,Y3_5,'v-');