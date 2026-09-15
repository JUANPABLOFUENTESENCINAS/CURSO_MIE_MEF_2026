clc; clear;

% DATOS

a = 0;
b = 1;
valor_ref = 0.746824132812427;

% PARTE A -- TRAPECIO, n=4

n = 4;
h = (b - a) / n;

x = zeros(1, n+1);
for i = 1:n+1
  x(i) = a + (i-1)*h;
endfor

y = zeros(1, n+1);
for i = 1:n+1
  y(i) = exp(-x(i)^2);
endfor

suma_interior = 0;
for i = 2:n
  suma_interior = suma_interior + y(i);
endfor

I_trapecio = (h/2) * (y(1) + 2*suma_interior + y(n+1));
error_trapecio = abs(valor_ref - I_trapecio);

printf('--- TRAPECIO, n=%d ---\n', n);
printf('Aproximacion: %.6f\n', I_trapecio);
printf('Error:        %.3e\n\n', error_trapecio);

% PARTE B -- GAUSS-LEGENDRE, n=3

t = [-0.774597 0 0.774597];
w = [0.555556 0.888889 0.555556];
nG = length(t);

xg = zeros(1, nG);
for i = 1:nG
  xg(i) = (b-a)/2 * t(i) + (b+a)/2;
endfor

yg = zeros(1, nG);
for i = 1:nG
  yg(i) = exp(-xg(i)^2);
endfor

suma_gauss = 0;
for i = 1:nG
  suma_gauss = suma_gauss + w(i)*yg(i);
endfor

I_gauss = (b-a)/2 * suma_gauss;
error_gauss = abs(valor_ref - I_gauss);

printf('--- GAUSS-LEGENDRE, n=%d ---\n', nG);
printf('Aproximacion: %.6f\n', I_gauss);
printf('Error:        %.3e\n', error_gauss);
