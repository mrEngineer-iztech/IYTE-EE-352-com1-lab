 t0=0.15; fs=2000; fc=200; kf=50;

t1=0:1/fs:t0/3;
m1=heaviside(t1);

t2=t0/3:1/fs:(2*t0/3);
m2=-2.*heaviside(t2);

t3=2*t0/3:1/fs:t0;
m3=0.*heaviside(t3);

t=[t1 t2 t3];
m=[m1 m2 m3];

x1=cos(2*pi*fc.*t1+2*pi*kf*integral(m1));
x2=cos(2*pi*fc.*t2+2*pi*kf*integral(m2));
x3=cos(2*pi*fc.*t3+2*pi*kf*integral(m3));
x=[x1 x2 x3];

figure(1)
m_int=integral(m);
plot(t,m_int);

figure(2)
subplot(211); plot(t,m);
subplot(212); plot(t,x);


N=length(x);
f=linspace(-fs/2,fs/2,N);
fftx=abs(fftshift(fft(x,N))/N);

fftm=abs(fftshift(fft(m,N))/N);

figure(3)
subplot(211); plot(f,fftx);
subplot(212); plot(f,fftm);

function y=integral(x)
fs=2000;
dt=1/fs;
sum=0;
for i=2:length(x)
    sum=sum+x(i)*dt;
    y(i)=sum;
end
end

% function y=integral(x)
% dt=0.001;
% sum=0;
% for i=2:length(x)
%     sum=sum+x(i)*dt;
% end
% y=sum;
% end