# `tensor_tensiones_principales.m`

Calcula las **tensiones principales** y **direcciones principales** de un tensor de tensiones de Cauchy 3×3, junto con sus invariantes. Corresponde a la Unidad 1 (descripción de la tensión, Actividad 1).

## ¿Qué hace?

1. Verifica que el tensor `sigma` ingresado sea simétrico (condición necesaria para que exista una base de autovectores ortonormal).
2. Calcula los invariantes de tensión $I_1$, $I_2$, $I_3$ (invariantes ante rotación de ejes).
3. Calcula los **autovalores** de `sigma` con `eig()` — físicamente, son las **tensiones principales** $\sigma_1 \ge \sigma_2 \ge \sigma_3$ (los planos donde la tensión cortante es nula).
4. Calcula los **autovectores** — son las **direcciones principales** $n_1, n_2, n_3$, normales a esos planos.
5. Verifica dos cosas:
   - Que los autovectores sean **ortonormales** ($V^T V = I$).
   - Que el tensor se pueda **reconstruir** exactamente como $\sigma = V \Lambda V^T$.
6. Calcula la tensión octaédrica y la tensión cortante máxima como cantidades derivadas útiles.

## Datos de entrada

Edita la matriz `sigma` en la sección `% DATOS DEL PROGRAMA`:

```octave
sigma = [ sxx  sxy  sxz
          sxy  syy  syz
          sxz  syz  szz ];
```

Debe ser simétrica (el programa lo verifica y lanza un error si no lo es). Las unidades son las que uses para los esfuerzos (MPa, kg/cm², etc.) — el programa no las asume, solo opera con los números.

## Cómo correrlo

```bash
octave tensor_tensiones_principales.m
```

## Salida esperada

En pantalla: invariantes, tensiones principales ordenadas, direcciones principales, tensión octaédrica, tensión cortante máxima, y el resultado de las dos verificaciones numéricas.

## Notas

- `eig()` en Octave no garantiza un orden específico de los autovalores, por eso el script los reordena explícitamente de mayor a menor y reordena las columnas de `V` en consecuencia — así `n1` siempre corresponde a `sigma1`.
- El signo de cada autovector no está definido de forma única (un autovector y su opuesto son igual de válidos); el programa no lo fuerza a ningún signo particular, es normal que cambie entre corridas o versiones de Octave.
- Si quieres verificar a mano con un tensor sencillo, uno diagonal (`sigma = diag([s1 s2 s3])`) debe devolver exactamente esos valores como tensiones principales y la identidad como matriz de direcciones.
