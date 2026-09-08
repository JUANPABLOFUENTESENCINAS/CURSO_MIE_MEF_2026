# U6 — Elementos CST (triangular) y Q4 (rectangular)

**Sesiones:** 8–10 · **Evidencia:** Actividad 4 (junto con U5, 15 %)

## Objetivo específico

Formular y programar los elementos finitos triangular (CST) y rectangular (Q4) para problemas de elasticidad plana, evaluando su desempeño comparativo.

## Contenidos

- Teoría de la elasticidad bidimensional
- Formulación del elemento triangular de 3 nodos (CST)
- Elemento rectangular de 4 nudos (Q4)

## Actividad 4

Implementación de código propio CST aplicado a una placa con carga conocida, comparado con solución de referencia.

- [ ] Geometría y malla de la placa (nudos, conectividad de elementos CST)
- [ ] Script `.m` del elemento CST (matriz B, matriz constitutiva D, ensamblaje)
- [ ] Comparación con solución de referencia (analítica o software comercial)
- [ ] Análisis de resultados (máx. 1 página, obligatorio)

## Contenido de esta carpeta

```
U6_cst_q4/
├── README.md
├── cst_placa.m   (a crear)
├── cst_placa.md  (a crear)
├── q4_placa.m    (a crear, opcional)
└── q4_placa.md   (a crear, opcional)
```

Cuando tengas la geometría, malla y carga de la placa de la Actividad 4, armamos el script CST siguiendo el mismo estilo de código del resto del repositorio (español, secciones comentadas, verificación antes de entregar).
