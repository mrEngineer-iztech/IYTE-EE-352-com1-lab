 t0=0.3; fs=1000; fc=100; kp1=pi/4; kp2=pi/2; kp3=pi;
t1=0:1/fs:t0/6;
m1=0.*heaviside(t1);

t2=t0/6:1/fs:(2*t0/6);
m2=heaviside(t2);

t3=2*t0/6:1/fs:3*t0/6;
m3=2.*heaviside(t3);

t4=3*t0/6:1/fs:4*t0/6;
m4=-1.*heaviside(t4);

t5=4.*t0/6:1/fs:t0;
m5=heaviside(t5);
    
t=[t1 t2 t3 t4 t5];
m=[m1 m2 m3 m4 m5];

figure(1)
plot(t,m);

N=length(t);
fftm=abs(fftshift(fft(m,N))/N);
f1=linspace(-fs/2,fs/2,N);
figure(2)
plot(f1,fftm);

figure(3)
u1=cos(2*pi*fc*t+kp1*m); 
u2=cos(2*pi*fc*t+kp2*m);
u3=cos(2*pi*fc*t+kp3*m);
subplot(311); plot(t,u1);
subplot(312); plot(t,u2);
subplot(313); plot(t,u3);

fftu1=abs(fftshift((fft(u1,N))/N));
fu1=linspace(-fs/2,fs/2,N);

fftu2=abs(fftshift((fft(u2,N))/N));
fu2=linspace(-fs/2,fs/2,N);

fftu3=abs(fftshift((fft(u3,N))/N));
fu3=linspace(-fs/2,fs/2,N);
figure(4)
subplot(311); plot(fu1,fftu1);
subplot(312); plot(fu2,fftu2);
subplot(313); plot(fu3,fftu3);




