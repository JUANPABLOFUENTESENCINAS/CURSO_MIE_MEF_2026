# `ejercicio1_e_for_while.m`

Implementa las dos partes del ejemplo comparativo `for`/`while` de `capitulo2.tex`: aproximar $e=\exp(1)$ mediante la serie $e=\sum_{i\geq0} 1/i!$, calculando cada término a partir del anterior ($\text{término}_i = \text{término}_{i-1}\times 1/i$).

## Parte A — `for`, $N=10$

```octave
suma = 1; termino = 1;
for i = 1:N
  termino = termino * (1/i);
  suma = suma + termino;
endfor
```

Suma un número **fijo** de términos ($N=10$, además del término inicial $i=0$). El error es una consecuencia que se calcula al final, no algo que el bucle controle.

**Resultado esperado:** aproximación $2.7182818011$, error $\approx 2.74\times10^{-8}$ — coincide con la tabla paso a paso de `capitulo2.tex`.

## Parte B — `while`, $\text{tol}=10^{-4}$

```octave
while termino > tol
  i = i + 1;
  termino = termino * (1/i);
  suma = suma + termino;
endwhile
```

Aquí es al revés: se fija la **precisión** deseada, y el número de términos necesarios es la consecuencia. Como los términos $1/i!$ decrecen de forma monótona, el propio término recién sumado sirve como estimador de cuánto falta por sumar.

**Resultado esperado:** se detiene en $i=8$, aproximación $2.7182787698$, error real $\approx 3.06\times10^{-6}$ (menor que la tolerancia pedida, como se espera).

## Nota sobre el `while` sin límite de seguridad

A diferencia de otras versiones de este mismo ejemplo en el repositorio, aquí el `while` **no** incluye un `max_iter` de seguridad, para mantener el código lo más simple posible tal como se pidió. Es seguro en este caso porque la convergencia de la serie de $e$ está garantizada matemáticamente (los términos decrecen monótonamente hacia cero), pero en general —y especialmente en un entorno de producción o con una tolerancia mal ingresada— es buena práctica agregar ese límite (`while termino > tol && i < max_iter`).

## Cómo correrlo

```bash
octave ejercicio1_e_for_while.m
```

## Relación con `capitulo2.tex`

Los números impresos por este script son exactamente los que aparecen en las tablas "Desarrollo paso a paso" de ambas partes del documento — sirve para verificar el desarrollo manual, o para generar la tabla directamente si se cambia `N` o `tol`.
