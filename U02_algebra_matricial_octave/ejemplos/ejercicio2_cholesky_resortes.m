clc; clear;

Kr=[2 -1 0;-1 2 -1;0 -1 1]; %Matriz de Rigidez
Fr=[0;0;10]; %Vector de Fuerzas


% FACTORIZACION DE CHOLESKY (funcion nativa de Octave)
% chol(Kr) devuelve R triangular SUPERIOR tal que Kr = R'*R

R = chol(Kr);

% SOLUCION: R'*y = Fr ; R*u = y

y = R' \ Fr;
u_libres = R \ y;

u = [0; u_libres];

% RESULTADOS

printf('Desplazamientos:\n');
disp(u');

