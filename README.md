# Informe de Análisis de Datos: Estudio del Acoso en las Comunas de Santiago
## Programación con R | Master Data Science | Universidad de las Américas (UDLA)

1. Introducción General
1.1. Contextualización del Problema
El acoso en espacios públicos y privados es una problemática social de gran relevancia, con implicancias en la seguridad, bienestar y derechos humanos de las personas. En el contexto urbano de Santiago de Chile, las manifestaciones de acoso pueden variar según factores demográficos (como sexo y edad) y geográficos (como comuna de residencia).

Comprender la distribución y características de este fenómeno es crucial para el diseño de políticas públicas, campañas de prevención y mecanismos de protección, especialmente en zonas donde la incidencia pueda ser mayor.

1.2. Propósito del Estudio
El propósito de este análisis es describir y modelar la ocurrencia de acoso reportado en los últimos 6 meses, considerando variables como sexo, edad y comuna de residencia. A través del uso de R y técnicas de análisis de datos, se busca identificar patrones, diferencias significativas y posibles factores asociados al fenómeno.

1.3. Objetivos
General: Analizar la incidencia de acoso en la población de hombres y mujeres de las comunas de Santiago en los últimos 6 meses.

Específicos:

Describir la distribución de acoso según sexo, edad y comuna.

Evaluar si existe diferencia significativa en la proporción de casos entre hombres y mujeres.

Modelar la probabilidad de sufrir acoso en función de las variables disponibles.

Proporcionar visualizaciones claras y relevantes para la interpretación de los resultados.

2. Definición del Problema / Hipótesis
2.1. Pregunta de Investigación
¿Existe una diferencia significativa en la proporción de hombres y mujeres que han reportado haber sufrido acoso en los últimos 6 meses en las comunas de Santiago?

2.2. Hipótesis Estadística
Hipótesis Nula (H0): No existe una diferencia significativa en la proporción de casos de acoso entre hombres y mujeres.

Hipótesis Alternativa (H1): Sí existe una diferencia significativa en la proporción de casos de acoso entre hombres y mujeres.

3. Descripción del Conjunto de Datos
Variable	Tipo	Descripción
Sexo	Cualitativa nominal	Género de la persona (Hombre/Mujer)
Edad	Cuantitativa continua	Edad de la persona en años completos
Comuna	Cualitativa nominal	Comuna de residencia dentro de Santiago
Acoso	Cualitativa binaria	Variable indicadora si la persona ha sufrido acoso en los últimos 6 meses (Sí/No)

3.1. Dimensión de los Datos
Se especificará la cantidad total de registros, porcentaje por categoría (sexo, comuna) y distribución de la variable respuesta (acoso).

3.2. Exploración de Datos Faltantes e Irregularidades
Se realizará una inspección para identificar:

Datos faltantes en variables clave.

Outliers en la variable edad.

Posibles inconsistencias (ej: comunas no válidas).

4. Preprocesamiento de Datos
4.1. Carga y Conversión de Variables
Utilizando tidyverse, se realizará la carga de datos y la conversión de variables a factores según corresponda.

4.2. Tratamiento de Datos Faltantes
Se definirán criterios de exclusión o imputación si fuese necesario.

4.3. Creación de Variables Derivadas
Agrupación de edades en rangos.

Variables indicadoras si se requieren para modelado.

4.4. Resumen de Preprocesamiento
Se incluirá un flujo esquemático de limpieza, transformación y preparación del dataset.

5. Análisis Exploratorio de Datos (EDA)
5.1. Distribución Demográfica
Gráficos de barras para la distribución de sexo.

Histograma de edades global y por sexo.

5.2. Incidencia de Acoso por Sexo
Proporción de casos de acoso por género.

Comparación gráfica (barras, proporciones).

5.3. Distribución Geográfica del Acoso
Frecuencia de casos por comuna.

Visualización con gráficos de barras o mapas de calor.

5.4. Relaciones Cruzadas
Boxplots de edad por condición de acoso.

Tablas de contingencia cruzando sexo, comuna y acoso.

6. Modelado de Datos
6.1. Selección del Modelo
Se utilizará un modelo de regresión logística binaria, dado que la variable respuesta (acoso) es dicotómica.

6.2. Especificación del Modelo
acoso ~ sexo + edad + comuna

6.3. Evaluación del Modelo
Estimación de Odds Ratios.

Prueba de significancia para coeficientes.

Evaluación de ajuste y predicción.

6.4. Visualización de Resultados
Gráficos de efectos marginales.

Probabilidades predichas para interpretación práctica.

7. Interpretación de Resultados
7.1. Discusión de la Hipótesis
Conclusión respecto a la existencia de diferencias significativas en la proporción de acoso entre hombres y mujeres.

Impacto de la edad y comuna en la probabilidad de acoso.

7.2. Implicancias Sociales
Reflexión sobre los resultados en el contexto de la ciudad de Santiago.

Posibles recomendaciones para prevención e intervención.

8. Código R y Repositorio
8.1. Estructura de Código
Bloques comentados por sección (Carga, EDA, Modelado, Visualización).

Buenas prácticas en nombres de variables y funciones.





