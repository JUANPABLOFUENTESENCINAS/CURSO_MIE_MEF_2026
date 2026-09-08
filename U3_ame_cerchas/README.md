# U3 — Análisis Matricial de Estructuras (AME): cerchas planas

**Sesiones:** 3–4 · **Evidencia:** Actividad 2 (junto con U2, 15 %)

## Objetivo específico

Formular y programar algoritmos de análisis matricial de estructuras (AME) de 2 GDL (barras, ensamblaje, condiciones de contorno), e interpretar su generalización hacia elementos de 4 GDL.

## Contenidos

- Sistemas estructurales
- Conceptos básicos de AME
- Analogía con otros sistemas
- Etapas del AME de barras
- Ensamblaje
- Desplazamientos prescritos y reacciones
- Solución del sistema
- Introducción al MEF

## Actividad 2

Elaborar un código propio (Octave) para cercha plana, con verificación de equilibrio y reacciones.

- [ ] Datos de la cercha (nudos, conectividad, propiedades E-A, apoyos, cargas)
- [ ] Script `.m` de cercha plana (2 GDL por nudo, solo axial)
- [ ] Verificación de equilibrio global (ΣF = 0) y reacciones
- [ ] Análisis de resultados (máx. 1 página, obligatorio)

## Contenido de esta carpeta

Cada cercha resuelta va como un par de archivos con el mismo nombre base:

```
U3_ame_cerchas/
├── README.md
├── <nombre_cercha>.m
└── <nombre_cercha>.md
```

> **Nota:** el script sigue el esqueleto estándar del curso (banner, `% DATOS DEL PROGRAMA`, `%%% INICIO DEL PROGRAMA %%%`, ensamblaje por bucles `for...endfor`, condensación por apoyos, cálculo de reacciones y graficación). Cuando tengas los datos de tu primera cercha (coordenadas de nudos, conectividad, E, A, apoyos y cargas), pídeme el script y lo armamos aquí.
