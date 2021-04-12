clc
clear all
syms s t z n

% q1 e q3

%A = [0 1;-3 -4];  %q1
%A = [0 1;-2 -3];  %q3

% q2 e q4
%A = [0 -0.25; 1 1];  %q2
A = [0 1; 0.25 0];  %q4
%A = [0 1; 0.25 1];  %extra  impulso

%A = [-0.71 1; -14.28 0];  %generico subamortecido

%{
%q1 e q3
matriz = s*eye(2)-A;
phi_s = matriz^-1; 
phi_t = ilaplace(phi_s) 

eig(phi_t)
limit(phi_t,t,inf)
%}

%
%q2 e q4
matriz = z*eye(2)-A; 
phi_z = matriz^-1; 
phi_zz = z*phi_z;
phi_n = iztrans(phi_zz)

eig(phi_n)
limit(phi_n,n,inf)
%


