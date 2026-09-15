% Integracion numerica por la regla del trapecio
% Ejemplo: integral de sin(x) entre 0 y pi (valor exacto = 2)

f = @(x) sin(x);   % funcion a integrar
a = 0;             % limite inferior
b = pi;            % limite superior
n = 100;           % numero de subintervalos

h = (b - a) / n;

% Calculamos los puntos x(i) con un for
x = zeros(1, n+1);
for i = 1:n+1
    x(i) = a + (i-1)*h;
end

% Evaluamos la funcion en cada punto con un for
y = zeros(1, n+1);
for i = 1:n+1
    y(i) = f(x(i));
end

% Sumamos los terminos intermedios con un for
suma = 0;
for i = 2:n
    suma = suma + y(i);
end

I = (h/2) * (y(1) + 2*suma + y(n+1));

printf("Integral aproximada (trapecio): %f\n", I);
printf("Valor exacto: %f\n", 2);
printf("Error: %e\n", abs(I - 2));
