clear all;
close all;
m=100;
n=100;
mun=zeros(1,n);
for i=1:n
    x=10*rand(1,n);
    mun=mun+x/n;
end
ms=0;
for i=1:m
  ms=ms+mun(i)/m;
end

figure 
stem(ms);
x=zeros(1,m);
for i=1:m
  x(i)=ms;
end
figure 
plot(x);
hold on;
stem (mun);