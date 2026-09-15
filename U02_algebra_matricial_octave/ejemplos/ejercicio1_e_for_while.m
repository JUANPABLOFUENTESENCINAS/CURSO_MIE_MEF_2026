clc; clear;

% PARTE A -- bucle for, N=10

N = 10;
suma = 1;
termino = 1;

for i = 1:N
  termino = termino * (1/i);
  suma = suma + termino;
endfor

error_for = abs(exp(1) - suma);

printf('--- PARTE A: FOR, N=%d ---\n', N);
printf('Aproximacion: %.10f\n', suma);
printf('Error:        %.3e\n\n', error_for);

% PARTE B -- bucle while, tolerancia

tol = 1e-4;
suma = 1;
termino = 1;
i = 0;

while termino > tol
  i = i + 1;
  termino = termino * (1/i);
  suma = suma + termino;
endwhile

error_while = abs(exp(1) - suma);

printf('--- PARTE B: WHILE, tol=%.0e ---\n', tol);
printf('Terminos usados: %d\n', i);
printf('Aproximacion:    %.10f\n', suma);
printf('Error:           %.3e\n', error_while);
