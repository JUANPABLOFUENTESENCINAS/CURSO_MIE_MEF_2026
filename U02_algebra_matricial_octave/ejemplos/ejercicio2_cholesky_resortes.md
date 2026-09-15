# `ejercicio2_cholesky_resortes.m`

Resuelve el sistema de 3 resortes en serie ($k=1$ cada uno, nudo 1 fijo, nudo 4 libre con $P=10$) usando la función **nativa** `chol()` de Octave, en vez de implementar la factorización a mano — tal como se pidió, sin complicar el código con un algoritmo propio.

## Ensamblaje

Igual que en los demás ejemplos de resortes del repositorio: se recorre cada elemento con un `for` y se suma su matriz elemental $\mathbf{k}_e=\begin{bmatrix}k&-k\\-k&k\end{bmatrix}$ en la posición global correspondiente.

## Condiciones de contorno

```octave
Kr = Kg(2:nn, 2:nn);
Fr = Fg(2:nn);
```

Como el único nudo restringido es el nudo 1 (el primero), basta con tomar la submatriz `2:nn` — no hace falta ninguna función adicional para "buscar" qué grados están libres.

## Factorización y solución con `chol()`

```octave
R = chol(Kr);      % Kr = R'*R, con R triangular SUPERIOR
y = R' \ Fr;        % sustitucion hacia adelante (R' es triangular inferior)
u_libres = R \ y;    % sustitucion hacia atras
```

**Importante sobre la convención de Octave:** `chol(A)` devuelve el factor **triangular superior** $R$ tal que $A = R^\top R$ (a diferencia de la deducción manual de `capitulo2.tex`, que usa $L$ triangular inferior con $K_r=LL^\top$; se cumple $R = L^\top$). Por eso la solución se arma como $R^\top y = F_r$ seguido de $Ru=y$ — el operador `\` de Octave resuelve cada sistema triangular de forma eficiente sin necesidad de programar la sustitución manualmente.

## Resultados esperados (verificados)

| Cantidad | Valor |
|---|---|
| $u$ | $[0,\ 10,\ 20,\ 30]$ |
| Reacción en nudo 1 | $-10$ |
| Fuerza interna en cada resorte | $10$ (los tres iguales) |

Coincide exactamente con el desarrollo manual de `capitulo2.tex` (sustitución hacia adelante/atrás con $L$).

## Reacciones y fuerzas internas

```octave
Reac = Kg*u - Fg;
```

Se usa la matriz **completa** `Kg` (sin condensar) — es lo que permite recuperar la reacción en el nudo restringido, algo que se pierde si en vez de condensar se hubiera anulado fila/columna directamente sobre `Kg`.

## Cómo correrlo

```bash
octave ejercicio2_cholesky_resortes.m
```

## Relación con `capitulo2.tex`

Este script reemplaza el bucle doble de la factorización manual (columna por columna, calculando cada $L_{ij}$) por una sola llamada a `chol()`. El resultado numérico es idéntico; lo que cambia es que aquí se confía en la función optimizada de Octave en vez de reimplementar el algoritmo, que es lo recomendable en código de uso real (la versión manual sigue siendo útil como material didáctico, no como la forma de resolverlo en la práctica).
