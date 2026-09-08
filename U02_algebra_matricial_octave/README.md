# U2 — Álgebra matricial y primeros programas en Octave

**Sesiones:** 2 · **Evidencia:** Sin evidencia formal (base operativa para U3 en adelante)

## Objetivo específico

Aplicar herramientas de álgebra matricial y métodos numéricos (solución de sistemas de ecuaciones lineales, integración numérica) mediante programación en Octave, como base operativa para implementar algoritmos de elementos finitos.

## Contenidos

- Repaso de álgebra matricial
- Métodos directos e iterativos para sistemas Ax = b
- Integración numérica (Newton–Cotes, introducción a Gauss)
- Sintaxis y primeros programas en Octave

## Contenido de esta carpeta

```
U2_algebra_matricial_octave/
├── README.md
└── ejemplos/
    └── (scripts .m de práctica: operaciones matriciales, Ax=b, integración numérica)
```

La carpeta `ejemplos/` es el lugar para los scripts sueltos de práctica de esta unidad (no son entregables formales, son la base para los programas más grandes de U3 en adelante). Sugerencia de scripts a agregar según avance el curso:

- `sistemas_ab.m` — solución de Ax=b por métodos directos (eliminación gaussiana) e iterativos (Jacobi/Gauss-Seidel).
- `integracion_newton_cotes.m` — regla del trapecio y Simpson.
- `intro_gauss.m` — introducción a la cuadratura de Gauss (1D), como preparación para U7.
