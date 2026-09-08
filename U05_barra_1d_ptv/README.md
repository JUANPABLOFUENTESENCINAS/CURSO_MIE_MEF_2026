# U5 — Elemento finito 1D a partir del PTV

**Sesión:** 7 · **Evidencia:** Sin evidencia formal (base teórica para U6)

## Objetivo específico

Deducir y programar la matriz de rigidez de elementos finitos unidimensionales a partir del PTV, evaluando la convergencia de la solución al incrementar el número de elementos.

## Contenidos

- Deducción del PTV utilizando el MRP
- Barra sometida a fuerzas axiales
- Discretización en uno y varios elementos
- Extrapolación de la solución
- Formulación matricial de la ecuación del elemento

## Contenido de esta carpeta

```
U5_barra_1d_ptv/
├── README.md
├── barra_1d.m   (a crear)
└── barra_1d.md  (a crear)
```

Sugerencia de script: `barra_1d.m` — barra axial discretizada en N elementos (N configurable), que arme la matriz de rigidez global, resuelva desplazamientos, y grafique la convergencia del desplazamiento en el extremo libre al aumentar N frente a la solución analítica. Cuando definas la geometría, carga y condiciones de borde de tu barra, lo armamos aquí.
