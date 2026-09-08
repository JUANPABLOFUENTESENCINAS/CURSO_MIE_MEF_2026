# Método de Elementos Finitos — Maestría en Ingeniería Estructural

Repositorio de trabajo para la materia **Método de Elementos Finitos** (Maestría en Ingeniería Estructural, MIEV-3), a cargo del Prof. Juan Pablo Fuentes Encinas.

Contiene el desarrollo teórico-práctico del curso: deducciones, código propio en **GNU Octave**, y los entregables de cada actividad, organizados por unidad de aprendizaje según el sílabo.

> **Alcance:** análisis estructural elástico-lineal. El objetivo del curso no es operar software comercial, sino entender e implementar el algoritmo del MEF desde sus fundamentos.

## 1. Estructura del repositorio

| Carpeta | Unidad(es) | Contenido |
|---|---|---|
| [`U1_mecanica_medio_continuo/`](U1_mecanica_medio_continuo/) | U1 | Cinemática, tensión, deformación, elasticidad lineal, PTV. Actividad 1. |
| [`U2_algebra_matricial_octave/`](U2_algebra_matricial_octave/) | U2 | Álgebra matricial, sistemas Ax=b, integración numérica, primeros programas en Octave. |
| [`U3_ame_cerchas/`](U3_ame_cerchas/) | U3 | Análisis Matricial de Estructuras (AME), cercha plana en Octave. Actividad 2. |
| [`U4_residuos_ponderados_poisson/`](U4_residuos_ponderados_poisson/) | U4 | Ecuación de Poisson, método de residuos ponderados (Galerkin). Actividad 3. |
| [`U5_barra_1d_ptv/`](U5_barra_1d_ptv/) | U5 | Elemento finito 1D a partir del PTV, barra axial, convergencia. |
| [`U6_cst_q4/`](U6_cst_q4/) | U6 | Elementos CST (triangular) y Q4 (rectangular). Actividad 4. |
| [`U7_isoparametrico_gauss/`](U7_isoparametrico_gauss/) | U7 | Formulación isoparamétrica, Jacobiano, cuadratura de Gauss. |
| [`U8_mallado_gid/`](U8_mallado_gid/) | U8 | Mallado y estudios de convergencia con GiD. Actividad 5. |
| [`U9_3d_ansys/`](U9_3d_ansys/) | U9 | Sólidos 3D y axisimétricos con ANSYS. Actividad 6. |
| [`U10_investigacion/`](U10_investigacion/) | U10 | Taller integrador y artículo de investigación. |
| [`docs/`](docs/) | — | Resumen del sílabo y notas generales del curso. |

Cada carpeta de unidad tiene su propio `README.md` con el objetivo específico, los contenidos, y — cuando aplica — sus scripts `.m` acompañados de un `.md` explicativo con el mismo nombre base (ej. `cercha_puente.m` + `cercha_puente.md`).

## 2. Herramientas

- **GNU Octave** — desarrollo propio de algoritmos (uso principal de este repositorio).
- **ANSYS Mechanical** (versión estudiantil) — resolución y verificación en U9.
- **GiD** — pre y post proceso de mallas en U8.

### Cómo correr los scripts de Octave

```bash
octave nombre_del_script.m
```

O desde el intérprete interactivo de Octave:

```octave
run("nombre_del_script.m")
```

## 3. Convenciones de código

- Código, comentarios y nombres de variable en **español**.
- Cada script sigue el mismo esqueleto: banner descriptivo, sección `% DATOS DEL PROGRAMA`, sección `%%% INICIO DEL PROGRAMA %%%` con sub-bloques comentados, y graficación de resultados cuando aplica.
- Todo script trae su `.md` explicativo al lado.

## 4. Evaluación

| Instrumento | Unidades | Peso |
|---|---|---|
| Actividad 1 | U1 | 10 % |
| Actividad 2 | U2, U3 | 15 % |
| Actividad 3 | U4 | 10 % |
| Actividad 4 | U5–U6 | 15 % |
| Actividad 5 | U7–U8 | 10 % |
| Actividad 6 | U9 | 15 % |
| Trabajo de Investigación | Todas | 25 % |

> **Nota:** las entregas son solo vía plataforma del curso — no se aceptan por WhatsApp o correo electrónico.

## 5. Bibliografía base

- Oñate, E. (2009/2013). *Structural Analysis with the Finite Element Method*, Vol. 1 y 2. Springer/CIMNE.
- Zienkiewicz, O. C., Taylor, R. L., & Zhu, J. Z. (2013). *The Finite Element Method: Its Basis and Fundamentals* (7.ª ed.). Elsevier.
- Reddy, J. N. (1993). *An Introduction to the Finite Element Method*. McGraw-Hill.

Ver [`docs/silabo_resumen.md`](docs/silabo_resumen.md) para la bibliografía completa y el detalle de cada unidad.

## Licencia

Este repositorio usa la licencia MIT (ver [`LICENSE`](LICENSE)) — ajústala si tu institución exige otra.
