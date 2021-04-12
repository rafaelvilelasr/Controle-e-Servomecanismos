clc
clear all
M1 = 5; %massa carrinho 1 em kg
M2 = 20; %massa carrinho 2 em kg
K1 = 150; %constante elástica da mola 1 em N/m
K2 = 700; %constante elástica da mola 2 em N/m
B1 = 15; %constante de amortecimento do amortecedor 1 em N s/m
B2 = 30; %constante de amortecimento do amortecedor 2 em N s/m

%matriz A
A = [0 0 1 0;...
       0 0 0 1;...
      (-K1/M1) (K1/M1) (-B1/M1) (B1/M1);...
      (K1/M2) (-(K1+K2)/M2) (B1/M2) (-(B1+B2)/M2)];

%matriz B
B = [0; 0; 1/M1; 0];

%matriz C
C = [1 0 0 0];

%matriz D
D = 0;

%matriz de estado inicial
x0 = [0.1; 0; 0; 0];

%H é a o numerado da eq de transferencia e o s é o denominador
[H,s] = ss2tf(A,B,C,D)

sys = ss(A,B,C,D);

%simulando o sistema com a matriz de estado inicial
[y,t,x] = initial(sys,x0);



%Plot do comportamento do sistema
subplot(2,1,1)
plot(t,100*y)
title('Deslocamento Carrinho 1 x Tempo')
xlabel('t (s)')
ylabel('d_1 (cm)')
grid
axis([0 5 -5 10])

subplot(2,1,2)
plot(t,100*x(:,2))
title('Deslocamento Carrinho 2 x Tempo')
xlabel('t (s)')
ylabel('d_2 (cm)')
grid
axis([0 5 -2 2])

figure
subplot(2,1,1)
plot(t,100*x(:,3))
title('Velocidade Carrinho 1 x Tempo')
xlabel('t (s)')
ylabel('v_1 (cm/s)')
grid
axis([0 5 -40 20])

subplot(2,1,2)
plot(t,100*x(:,4))
title('Velocidade Carrinho 2 x Tempo')
xlabel('t (s)')
ylabel('v_2 (cm/s)')
grid
axis([0 5 -15 15])
