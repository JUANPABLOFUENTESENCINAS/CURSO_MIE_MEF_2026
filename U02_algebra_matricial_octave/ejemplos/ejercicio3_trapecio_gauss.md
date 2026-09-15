# `ejercicio3_trapecio_gauss.m`

Calcula $\int_0^1 e^{-x^2}dx$ con el método del trapecio ($n=4$) y con cuadratura de Gauss-Legendre ($n=3$), con los mismos valores usados en el desarrollo manual de `capitulo2.tex`, pero con **todos los bucles escritos de forma explícita** (sin `sum()`, sin `x=a:h:b`, sin evaluar la función sobre un vector completo de una sola vez).

## Parte A — Trapecio, $n=4$

```octave
for i = 1:n+1
  x(i) = a + (i-1)*h;
endfor

for i = 1:n+1
  y(i) = exp(-x(i)^2);
endfor

suma_interior = 0;
for i = 2:n
  suma_interior = suma_interior + y(i);
endfor

I_trapecio = (h/2) * (y(1) + 2*suma_interior + y(n+1));
```

Tres bucles independientes, cada uno correspondiente a un paso del desarrollo manual: generar los puntos, evaluar $f$ en cada uno, y sumar los interiores antes de aplicar la fórmula compuesta.

**Resultado esperado:** $I \approx 0.742984$, error $\approx 3.84\times10^{-3}$.

## Parte B — Gauss-Legendre, $n=3$

```octave
for i = 1:nG
  xg(i) = (b-a)/2 * t(i) + (b+a)/2;
endfor

for i = 1:nG
  yg(i) = exp(-xg(i)^2);
endfor

suma_gauss = 0;
for i = 1:nG
  suma_gauss = suma_gauss + w(i)*yg(i);
endfor

I_gauss = (b-a)/2 * suma_gauss;
```

Los nodos y pesos de Gauss-Legendre para $n=3$ están tabulados directamente (`t`, `w`) — no se calculan, porque son valores fijos conocidos (raíces del polinomio de Legendre de grado 3). El resto es el mismo patrón: transformar los nodos al intervalo $[a,b]$, evaluar $f$, y sumar ponderando por los pesos.

**Resultado esperado:** $I \approx 0.746815$, error $\approx 9.6\times10^{-6}$ — casi 400 veces más preciso que el trapecio, con una cantidad de evaluaciones de $f$ comparable.

## Por qué no hay funciones ni vectorización aquí

A diferencia de otras versiones de este ejemplo en el repositorio (que usan `f = @(x) exp(-x.^2)` como function handle y lo evalúan sobre el vector completo), esta versión evalúa `exp(-x(i)^2)` directamente dentro de cada bucle, elemento por elemento — así se ve con total claridad cuántas veces se evalúa la función y en qué puntos exactos, que es lo que se está comparando entre ambos métodos.

## Cómo correrlo

```bash
octave ejercicio3_trapecio_gauss.m
```

## Relación con `capitulo2.tex`

Los valores impresos por ambas partes son los mismos que aparecen en la sección "Comparación de resultados" del documento — el script sirve para verificar el desarrollo a mano, o para repetir el cálculo con otro $n$ (agregando más filas a las tablas `t`/`w` si se necesitan más puntos de Gauss).
