# `EJEMPLO_DE_RESORTES.m`

Ejemplo base de **Análisis Matricial de Estructuras (AME)** aplicado al sistema más simple posible: **resortes en serie**, 1 grado de libertad (GDL) por nudo. Es el punto de partida conceptual antes de pasar a la cercha plana (2 GDL/nudo) de la Actividad 2 — la lógica de ensamblaje, condiciones de contorno y solución es exactamente la misma, solo cambia el tamaño de la matriz elemental.

## ¿Qué modela?

Una cadena de `ne` resortes en serie, cada uno con su propia rigidez `k(i)`, conectando `nn = ne+1` nudos numerados de forma consecutiva. Es el análogo mecánico más simple de una barra axial discretizada en elementos finitos 1D.

```
nudo 1 --[k(1)]-- nudo 2 --[k(2)]-- nudo 3 --[k(3)]-- nudo 4
```

## Estructura del script (por secciones)

| Sección | Qué hace |
|---|---|
| 1. Datos de entrada | `k` (rigideces), `Cbo` (nudos restringidos), `Punt` (cargas puntuales: nudo, valor) |
| 2. Variables | Deriva automáticamente `ne`, `nn`, `ngt`, `nnc`, etc. a partir de los datos |
| 3. Matrices elementales | Arma `ke` de cada resorte: $k_e = \begin{bmatrix} k & -k \\ -k & k \end{bmatrix}$ |
| 4. Matriz de conectividad | Para conexión en serie: el elemento `i` conecta los nudos `i` e `i+1` |
| 5. Ensamblaje | Suma cada `ke` en la posición global `K(pos,pos)` según la conectividad |
| 6. Vector de cargas | Coloca cada carga puntual en el GDL correspondiente de `F` |
| 7. Condiciones de contorno | Anula fila/columna del GDL restringido y pone 1 en la diagonal |
| 8. Solución | `u = K\F` — desplazamientos nodales |
| 9. Fuerzas internas | `Fint = ke * [u(i); u(i+1)]` por elemento |

## Datos de entrada

```octave
k    = [100 200 100];   % rigidez de cada resorte
Cbo  = [1; 4];          % nudos con desplazamiento restringido (u=0)
Punt = [2 150; 3 140];  % [nudo, valor de carga] por fila
```

Con 3 resortes (`ne=3`) hay 4 nudos (`nn=4`). Los nudos 1 y 4 están empotrados; los nudos 2 y 3 tienen cargas de 150 y 140 respectivamente.

## Cómo correrlo

```bash
octave EJEMPLO_DE_RESORTES.m
```

## Nota sobre la sección 4 (ya corregida en el archivo)

El comentario dentro del script documenta un error que traía originalmente: el bucle interno de la conectividad iba de `1` a `4` en vez de `1` a `nne` (número de nudos por elemento, que aquí es 2). Ese `4` correspondía al número de GDL de un elemento de pórtico/cercha 2D, no al de este problema de 1 GDL por nudo — quedó de una plantilla anterior. Ya está corregido a `for j=1:nne`, que es lo correcto para cualquier problema en serie con `nne=2`.

## Dos puntos a tener en cuenta si vas a extender esto a la cercha (Actividad 2)

1. **Las reacciones no se calculan.** El método usado en la sección 7 (anular fila/columna y poner 1 en la diagonal) resuelve bien los desplazamientos, pero **destruye la información necesaria para calcular reacciones** directamente de `K\F` en los nudos restringidos. Para obtenerlas hay que guardar la matriz `K` *antes* de aplicar las condiciones de contorno (por ejemplo `Kg = K;` justo después del ensamblaje) y luego calcular:
   ```octave
   R = Kg * u - F;   % reacciones en los GDL restringidos (F original, sin modificar)
   ```
   Esto es exactamente lo que pide la Actividad 2 ("verificación de equilibrio y reacciones"), así que conviene agregarlo antes de usar este esqueleto como base de la cercha.

2. **Las fuerzas internas se sobrescriben.** En la sección 9, `Fint` se recalcula en cada vuelta del `for` y no se guarda por elemento — al terminar el bucle solo queda el resultado del último resorte. Conviene guardarlo indexado, por ejemplo `Fint(:,i) = ke(:,:,i)*uint;`, o mostrarlo con `disp` dentro del propio bucle, para poder reportar la fuerza axial de cada elemento en el análisis de resultados.

Este método (funciones/1 GDL) también asume que los desplazamientos prescritos son **cero** (apoyos fijos). Si alguna vez necesitas un desplazamiento prescrito distinto de cero, este método de "anular fila/columna" no sirve tal cual — se necesita el método de partición de la matriz o el de penalización.
