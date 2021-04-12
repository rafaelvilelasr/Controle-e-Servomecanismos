clc
clear all;

%A = [0 -0.25; 1 1];  %q2
A = [0 1; 0.25 0];  %q4  impulso

%A = [0 1; 0.25 1];  %extra  impulso

%B = [1; 0];  %q2
B = [0;1];  

%C = [0 1];  %q2
C = [1 0];

D = 0;

Fs = 10;
dt = 1/Fs;
N = 51;
t = dt*(0:N-1);

%u = zeros(1,N);  %q2
u = [1 zeros(1,N-1)];  %q4

%x = [0.8;0.8];   %q2
x = [0;0];  %q4

for k = 1:N
    y(k) = C*x + D*u(k);
    x = A*x + B*u(k);
end

stem(t,y,'filled')
xlabel('t')

