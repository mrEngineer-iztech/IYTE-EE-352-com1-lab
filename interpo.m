clear all;
close all;
f1=500;
f2=2000;
fs1=36000; fs2=12000; fs3=6000;

t1=0:1/fs1:0.005;
t2=0:1/fs2:0.005;
t3=0:1/fs3:0.005;

x1=cos(2*pi*f1*t1)+sin(2*pi*f2*t1);
x2=cos(2*pi*f1*t2)+sin(2*pi*f2*t2);
x3=cos(2*pi*f1*t3)+sin(2*pi*f2*t3);
figure (1)
subplot (311);
plot(t1,x1);
title('fs1');
subplot (312);
plot (t2,x2);
title('fs2');
subplot (313);
plot (t3,x3);
title('fs3');


N=length(x1);
ff1=linspace(-fs1/2,fs1/2,N);
fftx1=abs(fftshift(fft(x1,N))/N);
N2=length(x2);
ff2=linspace(-fs2/2,fs2/2,N2);
fftx2=abs(fftshift(fft(x2,N2))/N2);

N3=length(x3);
ff3=linspace(-fs3/2,fs3/2,N3);
fftx3=abs(fftshift(fft(x3,N3))/N3);

figure(2)
subplot(311);
plot(ff1,fftx1);
subplot(312);
plot(ff2,fftx2);
subplot(313);
plot(ff3,fftx3);



int11=interp1(t2,x2,t1,'spline');
int12=interp1(t2,x2,t1);
int21=interp1(t3,x3,t1,'spline');
int22=interp1(t3,x3,t1);
figure (3)
subplot(211);
plot(t1,int11,t2,x2,'x');
hold on
plot(t1,x1);
subplot(212)
plot(t1,int12,t2,x2,'x');
hold on
plot(t1,x1);

figure (4)
subplot(211);
plot(t1,int21,t3,x3,'x');
hold on
plot(t1,x1);
subplot(212)
plot(t1,int22,t3,x3,'x');
hold on
plot(t1,x1);