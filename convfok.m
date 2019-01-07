clear all
close all
x=[0 1 2 -1 1];
h=[1 1 -1];
m=length(x);
n=length(h);
y=zeros(1,m+n-1);
y=myconv(x,h);
stem(y);




function y=myconv(x,h)
m=length(x);
n=length(h);
x=[x zeros(1,n)];
h=[h zeros(1,m)];
y=zeros(1,m+n);
for i=1:m+n-1
    for j=1:i
        y(i+1)=y(i+1)+x(j)*h(i+1-j);
    end
end
end