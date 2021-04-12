clc
clear all

%A = [0 1;-3 -4];  %q1
A = [0 1;-2 -3];  %q3   impulso
%A = [-0.71 1; -14.28 0];  %generico subamortecido

B = [0; 1];

C = [1 0];
D = 0;

x0 = [0.8; 0.5];

[H,s] = ss2tf(A,B,C,D)

sys = ss(A,B,C,D);

%[y,t,x] = initial(sys,x0);  %q1 
[y,t,x] = impulse(sys);  %q3

%Plot 
subplot(2,1,1)
plot(t,100*y)
title('grafico 1')
xlabel('t')
ylabel('y1')
grid
axis([0 10 -100 100])

