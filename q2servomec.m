clc
clear all;
syms a b c g1 g2 g3 dx1 dx2 dx3 u1 u2

dx = [dx1; dx2; dx3]; %vetor de espaço de espaço derivado
x = [g1; g2; g3]; %vetor de espaço de estado
u = [u1; u2]; %vetor de entradas

A = [-a -b 0;b -c 0; a b 0]; %matriz A do sistema
B = [1 0;0 1;0 0]; %matriz B do sistema

final = A*x + B*u; %forma final do sistema

%loop para imprimir os resultados
Display=A
disp(B)
for i = 1:3
    fprintf('%s=',dx(i))
    disp(final(i))
end

