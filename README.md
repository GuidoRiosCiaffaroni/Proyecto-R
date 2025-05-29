# Informe de Análisis de Datos: Estudio del Acoso en las Comunas de Santiago
## Programación con R | Master Data Science | Universidad de las Américas (UDLA)

### 1. Introducción General
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

### 2. Definición del Problema / Hipótesis
2.1. Pregunta de Investigación
¿Existe una diferencia significativa en la proporción de hombres y mujeres que han reportado haber sufrido acoso en los últimos 6 meses en las comunas de Santiago?

2.2. Hipótesis Estadística
Hipótesis Nula (H0): No existe una diferencia significativa en la proporción de casos de acoso entre hombres y mujeres.

Hipótesis Alternativa (H1): Sí existe una diferencia significativa en la proporción de casos de acoso entre hombres y mujeres.

### 3. Descripción del Conjunto de Datos
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

### 4. Preprocesamiento de Datos
4.1. Carga y Conversión de Variables
Utilizando tidyverse, se realizará la carga de datos y la conversión de variables a factores según corresponda.

4.2. Tratamiento de Datos Faltantes
Se definirán criterios de exclusión o imputación si fuese necesario.

4.3. Creación de Variables Derivadas
Agrupación de edades en rangos.

Variables indicadoras si se requieren para modelado.

4.4. Resumen de Preprocesamiento
Se incluirá un flujo esquemático de limpieza, transformación y preparación del dataset.

### 5. Análisis Exploratorio de Datos (EDA)
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

### 6. Modelado de Datos
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

### 7. Interpretación de Resultados
7.1. Discusión de la Hipótesis
Conclusión respecto a la existencia de diferencias significativas en la proporción de acoso entre hombres y mujeres.

Impacto de la edad y comuna en la probabilidad de acoso.

7.2. Implicancias Sociales
Reflexión sobre los resultados en el contexto de la ciudad de Santiago.

Posibles recomendaciones para prevención e intervención.

### 8. Código R y Repositorio
8.1. Estructura 

#### Instalacion del Servidor  

```bash
## 
sudo apt update -y 
sudo apt upgrade -y

sudo apt install nano -y

##Instalar Apache
sudo apt install apache2 -y

##Instalar MySQL
#sudo apt install mysql-server -y
#sudo apt install php-mysql -y

sudo apt  install mariadb-server -y
sudo apt  install mariadb-client -y

## Instalar PHP
sudo apt install php -y 
sudo apt install libapache2-mod-php -y 
sudo apt install php-mysql -y

## Instalar paquetes adicionales
sudo apt install php-cli -y
sudo apt install php-curl -y
sudo apt install php-gd -y
sudo apt install php-mbstring -y 
sudo apt install php-xml -y
sudo apt install php-zip -y
sudo apt install php-xmlrpc -y 
sudo apt install php-soap -y
sudo apt install php-intl -y
sudo apt install php-json -y

sudo apt install software-properties-common -y
sudo apt install php-gettext -y
sudo apt install php-fpm -y
sudo apt install php-common -y
sudo apt install php-opcache -y
sudo apt install php-tokenizer -y
sudo apt install php-bcmath -y
sudo apt install php-gettext -y
sudo apt install gnupg2 -y


sudo apt install gnupg2 -y
sudo apt install ca-certificates -y
sudo apt install lsb-release -y
sudo apt install apt-transport-https -y

sudo apt install unzip -y
sudo apt install wget -y

sudo apt install tmux -y
sudo apt install nano -y

sudo a2enmod php*
sudo a2enmod rewrite

sudo apt autoremove 

service apache2 restart 
service mysql restart
```

#### Configuracion de Servidor     
```bash
sed -i 's/^;extension=curl/extension=curl/' /etc/php/8.3/apache2/php.ini
sed -i 's/^;extension=gd/extension=gd/' /etc/php/8.3/apache2/php.ini
sed -i 's/^;extension=mbstring/extension=mbstring/' /etc/php/8.3/apache2/php.ini
sed -i 's/^;extension=mysqli/extension=mysqli/' /etc/php/8.3/apache2/php.ini
sed -i 's/^;extension=pdo_mysql/extension=pdo_mysql/' /etc/php/8.3/apache2/php.ini

sed -i 's/^;extension=curl/extension=curl/' /etc/php/8.3/cli/php.ini
sed -i 's/^;extension=gd/extension=gd/' /etc/php/8.3/cli/php.ini
sed -i 's/^;extension=mbstring/extension=mbstring/' /etc/php/8.3/cli/php.ini
sed -i 's/^;extension=mysqli/extension=mysqli/' /etc/php/8.3/cli/php.ini
sed -i 's/^;extension=pdo_mysql/extension=pdo_mysql/' /etc/php/8.3/cli/php.ini

sed -i 's/^;extension=curl/extension=curl/' /etc/php/8.3/fpm/php.ini
sed -i 's/^;extension=gd/extension=gd/' /etc/php/8.3/fpm/php.ini
sed -i 's/^;extension=mbstring/extension=mbstring/' /etc/php/8.3/fpm/php.ini
sed -i 's/^;extension=mysqli/extension=mysqli/' /etc/php/8.3/fpm/php.ini
sed -i 's/^;extension=pdo_mysql/extension=pdo_mysql/' /etc/php/8.3/fpm/php.ini

service apache2 restart

sudo sed -i 's/^\(\s*\)AllowOverride None/\1AllowOverride All/' /etc/apache2/apache2.conf

service apache2 restart

chown www-data:www-data * -R /var/www/html/wordpress/
chmod 775 * /var/www/
chown -R www-data /var/www/ll
sudo a2enmod rewrite

```


#### Instalacion de R en el servidor    
```bash
#!/bin/bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y locales

sudo apt install -y dirmngr 
sudo apt install gnupg -y 
sudo apt install apt-transport-https -y 
sudo apt install ca-certificates -y
sudo apt install software-properties-common -y

#paquete suplementarios
sudo apt install libcurl4-openssl-dev -y 
sudo apt install libssl-dev -y
sudo apt install libxml2-dev -y
sudo apt install libfontconfig1-dev -y 
sudo apt install libharfbuzz-dev -y
sudo apt install libfribidi-dev -y
sudo apt install libfreetype6-dev -y
sudo apt install libpng-dev -y
sudo apt install libtiff5-dev -y
sudo apt install libjpeg-dev -y

sudo apt install libcurl4-openssl-dev -y 
sudo apt install libssl-dev -y 
sudo apt install libxml2-dev -y
sudo apt install libfontconfig1-dev -y
sudo apt install libharfbuzz-dev -y
sudo apt install libfribidi-dev -y
sudo apt install libfreetype6-dev -y
sudo apt install libpng-dev -y
sudo apt install libtiff5-dev -y
sudo apt install libjpeg-dev -y
sudo apt install build-essential -y

sudo apt install wget -y

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 51716619E084DAB9
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu noble-cran40/"

sudo apt update
sudo apt install -y r-base

# 
wget https://download1.rstudio.org/electron/jammy/amd64/rstudio-2025.05.0-496-amd64.deb
chmod 777 rstudio-2025.05.0-496-amd64.deb
sudo dpkg -i rstudio-*.deb
sudo apt install -f

wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2024.04.0-735-amd64.deb
sudo apt install ./rstudio-server-2024.04.0-735-amd64.deb

#sudo systemctl start rstudio-server
#sudo systemctl enable rstudio-server
#sudo systemctl status rstudio-server

#Ver estado	sudo systemctl status rstudio-server
#Reiniciar RStudio Server	sudo systemctl restart rstudio-server
#Ver logs	sudo journalctl -u rstudio-server
#Ver usuarios conectados	sudo rstudio-server active-sessions

#  Instalar tidyverse y ggplot2 desde R
sudo R --no-save <<EOF
install.packages("tidyverse", repos="https://cloud.r-project.org")
install.packages("ggplot2", repos="https://cloud.r-project.org")
EOF
```

#### Configuracion R
```bash
#########################################################################
#instalacion que quarto
install.packages("quarto")
#########################################################################

#########################################################################
# Manipulación, exploración y visualización de datos.
# ggplot2 (gráficos),
# dplyr (manipulación de datos),
# tidyr (reorganización de datos),
# readr (lectura de archivos),
# purrr (programación funcional),
# tibble (estructuras de datos mejoradas).
install.packages("tidyverse")
#########################################################################

#########################################################################
#resumen estadístico rápido
# La función principal skim() ofrece una alternativa enriquecida a summary()
install.packages("skimr")
#########################################################################

#########################################################################
# el sistema más popular en R para la creación de gráficos.
# Se basa en la gramática de los gráficos (Grammar of Graphics)
# Es el estándar en visualización de datos en R.
install.packages("ggplot2")
#########################################################################

#########################################################################
# extensión de ggplot2 que facilita la creación de gráficos multivariantes
# Gráficos de pares (ggpairs()),
install.packages("GGally")
#########################################################################
# paquete que convierte gráficos de ggplot2 o crea desde cero gráficos
# Permite:
# Zoom,
# Desplazamiento,
# Tooltips (etiquetas flotantes),
# Exportación interactiva.
install.packages("plotly")
#########################################################################

#########################################################################
# Instala shiny, un framework de R para construir aplicaciones web interactivas.
install.packages("shiny")
#########################################################################

install.packages("scatterplot3d")
install.packages("rgl")
```


### Exploracion preliminar de Datos  
```bash
library(tidyverse)
library(skimr)
library(GGally)
library(dplyr)

datos <- read.csv("/content/Data.csv", header = TRUE, sep = "," , encoding = "UTF-8") # Carga de Datos

# Ver las primeras filas
head(datos)

# Ver la estructura de los datos
glimpse(datos)
```


### Exploracion preliminar de Datos  
```bash
###########################################################################
# Cargar librerías
library(dplyr)

# Leer el archivo correctamente (con separador ";")
datos <- read.csv2("/content/Data.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Verificar que el archivo tenga datos
stopifnot(nrow(datos) > 0)

# Convertir columnas a numéricas desde texto
datos$Genero.Victima <- as.numeric(as.character(datos$Genero.Victima))
datos$Genero.Agresor <- as.numeric(as.character(datos$Genero.Agresor))
datos$Comuna <- as.numeric(as.character(datos$Comuna))
datos$Tipo <- as.numeric(as.character(datos$Tipo))


# Agregar columnas con texto interpretado para Género de Víctima y Agresor
datos <- datos %>%
  mutate(
    Nombre_Genero_Victima_Texto = case_when(
      Genero.Victima == 0 ~ "Hombre",
      Genero.Victima == 1 ~ "Mujer",
      Genero.Victima == 2 ~ "Otro",
      TRUE ~ NA_character_
    ),
    Nombre_Genero_Agresor_Texto = case_when(
      Genero.Agresor == 0 ~ "Hombre",
      Genero.Agresor == 1 ~ "Mujer",
      Genero.Agresor == 2 ~ "Otro",
      TRUE ~ NA_character_
    )
  )

# Agregar columna con nombre de comuna
datos <- datos %>%
  mutate(Nombre_Comuna = case_when(
    Comuna == 13101 ~ "Santiago",
    Comuna == 13102 ~ "Cerrillos",
    Comuna == 13103 ~ "Cerro Navia",
    Comuna == 13104 ~ "Conchalí",
    Comuna == 13105 ~ "El Bosque",
    Comuna == 13106 ~ "Estación Central",
    Comuna == 13107 ~ "Huechuraba",
    Comuna == 13108 ~ "Independencia",
    Comuna == 13109 ~ "La Cisterna",
    Comuna == 13110 ~ "La Florida",
    Comuna == 13111 ~ "La Granja",
    Comuna == 13112 ~ "La Pintana",
    Comuna == 13113 ~ "La Reina",
    Comuna == 13114 ~ "Las Condes",
    Comuna == 13115 ~ "Lo Barnechea",
    Comuna == 13116 ~ "Lo Espejo",
    Comuna == 13117 ~ "Lo Prado",
    Comuna == 13118 ~ "Macul",
    Comuna == 13119 ~ "Maipú",
    Comuna == 13120 ~ "Ñuñoa",
    Comuna == 13121 ~ "Pedro Aguirre Cerda",
    Comuna == 13122 ~ "Peñalolén",
    Comuna == 13123 ~ "Providencia",
    Comuna == 13124 ~ "Pudahuel",
    Comuna == 13125 ~ "Quilicura",
    Comuna == 13126 ~ "Quinta Normal",
    Comuna == 13127 ~ "Recoleta",
    Comuna == 13128 ~ "Renca",
    Comuna == 13129 ~ "San Joaquín",
    Comuna == 13130 ~ "San Miguel",
    Comuna == 13131 ~ "San Ramón",
    Comuna == 13132 ~ "Vitacura",
    Comuna == 13201 ~ "Puente Alto",
    Comuna == 13202 ~ "Pirque",
    Comuna == 13203 ~ "San José de Maipo",
    Comuna == 13301 ~ "Colina",
    Comuna == 13302 ~ "Lampa",
    Comuna == 13303 ~ "Tiltil",
    Comuna == 13401 ~ "San Bernardo",
    Comuna == 13402 ~ "Buin",
    Comuna == 13403 ~ "Calera de Tango",
    Comuna == 13404 ~ "Paine",
    Comuna == 13501 ~ "Melipilla",
    Comuna == 13502 ~ "Alhué",
    Comuna == 13503 ~ "Curacaví",
    Comuna == 13504 ~ "María Pinto",
    Comuna == 13505 ~ "San Pedro",
    Comuna == 13601 ~ "Talagante",
    Comuna == 13602 ~ "El Monte",
    Comuna == 13603 ~ "Isla de Maipo",
    Comuna == 13604 ~ "Padre Hurtado",
    Comuna == 13605 ~ "Peñaflor",
    TRUE ~ NA_character_
  ))


# Agregar columna con nombre de Violencia
datos <- datos %>%
  mutate(Nombre_Violencia = case_when(
    Tipo == 1 ~ "Lenguaje discriminatorio (sexista, racista, homofóbico, etc.)",
    Tipo == 2 ~ "Chistes, burlas o memes ofensivos sobre género o identidad",
    Tipo == 3 ~ "Estereotipos de género o roles impuestos",
    Tipo == 4 ~ "Interrupciones o invisibilización en espacios públicos o laborales",
    Tipo == 5 ~ "Expectativas sociales rígidas sobre cómo debe ser un hombre/mujer/persona",
    Tipo == 6 ~ "Cosificación o reducción de una persona a su apariencia física",
    Tipo == 7 ~ "Falta de representación o inclusión en medios, política o educación",
    Tipo == 8 ~ "Apropiación de ideas u opiniones en entornos profesionales",
    Tipo == 9 ~ "Descalificación constante o humillación verbal",
    Tipo == 10 ~ "Manipulación emocional o gaslighting",
    Tipo == 11 ~ "Aislamiento social o familiar intencionado",
    Tipo == 12 ~ "Amenazas verbales (directas o indirectas)",
    Tipo == 13 ~ "Culpar a la víctima por el conflicto o por la violencia sufrida",
    Tipo == 14 ~ "Desvalorización de logros o capacidades personales",
    Tipo == 15 ~ "Fomento de inseguridades o dependencia emocional",
    Tipo == 16 ~ "Uso de hijos/as u otras personas como chantaje emocional",
    Tipo == 17 ~ "Control o prohibición del uso del dinero propio",
    Tipo == 18 ~ "Negarle acceso a estudios, trabajo o recursos económicos",
    Tipo == 19 ~ "Retención o robo de bienes personales o dinero",
    Tipo == 20 ~ "Endeudamiento forzoso a nombre de la víctima",
    Tipo == 21 ~ "Destrucción de objetos personales o simbólicos",
    Tipo == 22 ~ "Negación de recursos básicos (ropa, medicamentos, alimentos)",
    Tipo == 23 ~ "Comentarios sexuales no deseados",
    Tipo == 24 ~ "Miradas o gestos lascivos",
    Tipo == 25 ~ "Tocamientos sin consentimiento",
    Tipo == 26 ~ "Presión o chantaje para relaciones sexuales",
    Tipo == 27 ~ "Relaciones sexuales sin consentimiento pleno",
    Tipo == 28 ~ "Envío o difusión de imágenes sexuales sin consentimiento",
    Tipo == 29 ~ "Exhibicionismo o voyeurismo sin consentimiento",
    Tipo == 30 ~ "Acoso sexual en el trabajo o espacios educativos",
    Tipo == 31 ~ "Violación sexual (con o sin uso de fuerza física)",
    Tipo == 32 ~ "Explotación sexual o trata de personas",
    Tipo == 33 ~ "Empujones o sacudidas leves",
    Tipo == 34 ~ "Bofetadas, tirones de cabello o rasguños",
    Tipo == 35 ~ "Golpes con objetos, puñetazos, patadas",
    Tipo == 36 ~ "Lesiones físicas moderadas o graves",
    Tipo == 37 ~ "Tortura física o castigos corporales continuados",
    Tipo == 38 ~ "Privación de atención médica, alimentos o sueño",
    Tipo == 39 ~ "Encierro o inmovilización forzada",
    Tipo == 40 ~ "Intentos de estrangulamiento o ahogo",
    Tipo == 41 ~ "Amenazas de muerte o daño a terceros",
    Tipo == 42 ~ "Persecución o acoso persistente (stalking)",
    Tipo == 43 ~ "Intentos de homicidio o feminicidio",
    Tipo == 44 ~ "Homicidio por razones de género, orientación o identidad",
    Tipo == 45 ~ "Suicidio inducido por violencia prolongada o sistemática",
    Tipo == 46 ~ "Negación de acceso a justicia por prejuicio o discriminación",
    Tipo == 47 ~ "Trato deshumanizante en servicios públicos o de salud",
    Tipo == 48 ~ "Criminalización o patologización de la identidad de género",
    Tipo == 49 ~ "Violencia policial, carcelaria o estatal por razón de identidad",
    Tipo == 50 ~ "Falta de políticas o protección efectiva frente a la violencia",

    TRUE ~ NA_character_
  ))

# Guardar el archivo modificado
write.csv2(datos, "Data_modificado.csv", row.names = FALSE)
###########################################################################
```


### Cambiar Datos  
```bash
###########################################################################
# Cargar librerías
library(readr)
library(dplyr)

# Leer archivo
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Verificar que las columnas existen
cols_necesarias <- c("Nombre_Comuna", "Comuna.1", "Nombre_Violencia")
stopifnot(all(cols_necesarias %in% names(datos)))

# Función de limpieza
limpiar_texto <- function(texto) {
  texto <- gsub("Ñ", "N", texto)
  texto <- gsub("ñ", "n", texto)
  texto <- gsub("í", "i", texto)
  texto <- gsub("ó", "o", texto)
  texto <- gsub("é", "e", texto)
  texto <- gsub("ú", "u", texto)
  return(texto)
}

# Aplicar limpieza a las columnas relevantes
datos$Nombre_Comuna     <- limpiar_texto(datos$Nombre_Comuna)
datos$Comuna.1          <- limpiar_texto(datos$Comuna.1)
datos$Nombre_Violencia  <- limpiar_texto(datos$Nombre_Violencia)

# Guardar archivo limpio
write.csv2(datos, "Data_modificado_sin_tildes.csv", fileEncoding = "UTF-8", row.names = FALSE)
###########################################################################
```

### Exploracion preliminar de Datos  
```bash
###########################################################################

# Leer archivo modificado
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Convertir a factor para asegurar etiquetas correctas
datos$Genero.Victima <- factor(datos$Genero.Victima,
                               levels = c(0, 1, 2),
                               labels = c("Hombre", "Mujer", "Otro"))

# Crear histograma
ggplot(datos, aes(x = Genero.Victima)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Distribución por Sexo (Víctima)",
       x = "Sexo",
       y = "Frecuencia") +
  theme_minimal()

###########################################################################
```


### Exploracion preliminar de Datos
Crea un nuevo documento con nuevas Columnas las que pueden ser utilizadas posteriormente 
```bash
###########################################################################
# Cargar librerías
library(dplyr)

# Leer el archivo correctamente (con separador ";")
datos <- read.csv2("/content/Data.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Verificar que el archivo tenga datos
stopifnot(nrow(datos) > 0)

# Convertir columnas a numéricas desde texto
datos$Genero.Victima <- as.numeric(as.character(datos$Genero.Victima))
datos$Genero.Agresor <- as.numeric(as.character(datos$Genero.Agresor))
datos$Comuna <- as.numeric(as.character(datos$Comuna))
datos$Tipo <- as.numeric(as.character(datos$Tipo))


# Agregar columnas con texto interpretado para Género de Víctima y Agresor
datos <- datos %>%
  mutate(
    Nombre_Genero_Victima_Texto = case_when(
      Genero.Victima == 0 ~ "Hombre",
      Genero.Victima == 1 ~ "Mujer",
      Genero.Victima == 2 ~ "Otro",
      TRUE ~ NA_character_
    ),
    Nombre_Genero_Agresor_Texto = case_when(
      Genero.Agresor == 0 ~ "Hombre",
      Genero.Agresor == 1 ~ "Mujer",
      Genero.Agresor == 2 ~ "Otro",
      TRUE ~ NA_character_
    )
  )

# Agregar columna con nombre de comuna
datos <- datos %>%
  mutate(Nombre_Comuna = case_when(
    Comuna == 13101 ~ "Santiago",
    Comuna == 13102 ~ "Cerrillos",
    Comuna == 13103 ~ "Cerro Navia",
    Comuna == 13104 ~ "Conchalí",
    Comuna == 13105 ~ "El Bosque",
    Comuna == 13106 ~ "Estación Central",
    Comuna == 13107 ~ "Huechuraba",
    Comuna == 13108 ~ "Independencia",
    Comuna == 13109 ~ "La Cisterna",
    Comuna == 13110 ~ "La Florida",
    Comuna == 13111 ~ "La Granja",
    Comuna == 13112 ~ "La Pintana",
    Comuna == 13113 ~ "La Reina",
    Comuna == 13114 ~ "Las Condes",
    Comuna == 13115 ~ "Lo Barnechea",
    Comuna == 13116 ~ "Lo Espejo",
    Comuna == 13117 ~ "Lo Prado",
    Comuna == 13118 ~ "Macul",
    Comuna == 13119 ~ "Maipú",
    Comuna == 13120 ~ "Ñuñoa",
    Comuna == 13121 ~ "Pedro Aguirre Cerda",
    Comuna == 13122 ~ "Peñalolén",
    Comuna == 13123 ~ "Providencia",
    Comuna == 13124 ~ "Pudahuel",
    Comuna == 13125 ~ "Quilicura",
    Comuna == 13126 ~ "Quinta Normal",
    Comuna == 13127 ~ "Recoleta",
    Comuna == 13128 ~ "Renca",
    Comuna == 13129 ~ "San Joaquín",
    Comuna == 13130 ~ "San Miguel",
    Comuna == 13131 ~ "San Ramón",
    Comuna == 13132 ~ "Vitacura",
    Comuna == 13201 ~ "Puente Alto",
    Comuna == 13202 ~ "Pirque",
    Comuna == 13203 ~ "San José de Maipo",
    Comuna == 13301 ~ "Colina",
    Comuna == 13302 ~ "Lampa",
    Comuna == 13303 ~ "Tiltil",
    Comuna == 13401 ~ "San Bernardo",
    Comuna == 13402 ~ "Buin",
    Comuna == 13403 ~ "Calera de Tango",
    Comuna == 13404 ~ "Paine",
    Comuna == 13501 ~ "Melipilla",
    Comuna == 13502 ~ "Alhué",
    Comuna == 13503 ~ "Curacaví",
    Comuna == 13504 ~ "María Pinto",
    Comuna == 13505 ~ "San Pedro",
    Comuna == 13601 ~ "Talagante",
    Comuna == 13602 ~ "El Monte",
    Comuna == 13603 ~ "Isla de Maipo",
    Comuna == 13604 ~ "Padre Hurtado",
    Comuna == 13605 ~ "Peñaflor",
    TRUE ~ NA_character_
  ))


# Agregar columna con nombre de Violencia
datos <- datos %>%
  mutate(Nombre_Violencia = case_when(
    Tipo == 1 ~ "Lenguaje discriminatorio (sexista, racista, homofóbico, etc.)",
    Tipo == 2 ~ "Chistes, burlas o memes ofensivos sobre género o identidad",
    Tipo == 3 ~ "Estereotipos de género o roles impuestos",
    Tipo == 4 ~ "Interrupciones o invisibilización en espacios públicos o laborales",
    Tipo == 5 ~ "Expectativas sociales rígidas sobre cómo debe ser un hombre/mujer/persona",
    Tipo == 6 ~ "Cosificación o reducción de una persona a su apariencia física",
    Tipo == 7 ~ "Falta de representación o inclusión en medios, política o educación",
    Tipo == 8 ~ "Apropiación de ideas u opiniones en entornos profesionales",
    Tipo == 9 ~ "Descalificación constante o humillación verbal",
    Tipo == 10 ~ "Manipulación emocional o gaslighting",
    Tipo == 11 ~ "Aislamiento social o familiar intencionado",
    Tipo == 12 ~ "Amenazas verbales (directas o indirectas)",
    Tipo == 13 ~ "Culpar a la víctima por el conflicto o por la violencia sufrida",
    Tipo == 14 ~ "Desvalorización de logros o capacidades personales",
    Tipo == 15 ~ "Fomento de inseguridades o dependencia emocional",
    Tipo == 16 ~ "Uso de hijos/as u otras personas como chantaje emocional",
    Tipo == 17 ~ "Control o prohibición del uso del dinero propio",
    Tipo == 18 ~ "Negarle acceso a estudios, trabajo o recursos económicos",
    Tipo == 19 ~ "Retención o robo de bienes personales o dinero",
    Tipo == 20 ~ "Endeudamiento forzoso a nombre de la víctima",
    Tipo == 21 ~ "Destrucción de objetos personales o simbólicos",
    Tipo == 22 ~ "Negación de recursos básicos (ropa, medicamentos, alimentos)",
    Tipo == 23 ~ "Comentarios sexuales no deseados",
    Tipo == 24 ~ "Miradas o gestos lascivos",
    Tipo == 25 ~ "Tocamientos sin consentimiento",
    Tipo == 26 ~ "Presión o chantaje para relaciones sexuales",
    Tipo == 27 ~ "Relaciones sexuales sin consentimiento pleno",
    Tipo == 28 ~ "Envío o difusión de imágenes sexuales sin consentimiento",
    Tipo == 29 ~ "Exhibicionismo o voyeurismo sin consentimiento",
    Tipo == 30 ~ "Acoso sexual en el trabajo o espacios educativos",
    Tipo == 31 ~ "Violación sexual (con o sin uso de fuerza física)",
    Tipo == 32 ~ "Explotación sexual o trata de personas",
    Tipo == 33 ~ "Empujones o sacudidas leves",
    Tipo == 34 ~ "Bofetadas, tirones de cabello o rasguños",
    Tipo == 35 ~ "Golpes con objetos, puñetazos, patadas",
    Tipo == 36 ~ "Lesiones físicas moderadas o graves",
    Tipo == 37 ~ "Tortura física o castigos corporales continuados",
    Tipo == 38 ~ "Privación de atención médica, alimentos o sueño",
    Tipo == 39 ~ "Encierro o inmovilización forzada",
    Tipo == 40 ~ "Intentos de estrangulamiento o ahogo",
    Tipo == 41 ~ "Amenazas de muerte o daño a terceros",
    Tipo == 42 ~ "Persecución o acoso persistente (stalking)",
    Tipo == 43 ~ "Intentos de homicidio o feminicidio",
    Tipo == 44 ~ "Homicidio por razones de género, orientación o identidad",
    Tipo == 45 ~ "Suicidio inducido por violencia prolongada o sistemática",
    Tipo == 46 ~ "Negación de acceso a justicia por prejuicio o discriminación",
    Tipo == 47 ~ "Trato deshumanizante en servicios públicos o de salud",
    Tipo == 48 ~ "Criminalización o patologización de la identidad de género",
    Tipo == 49 ~ "Violencia policial, carcelaria o estatal por razón de identidad",
    Tipo == 50 ~ "Falta de políticas o protección efectiva frente a la violencia",

    TRUE ~ NA_character_
  ))

# Guardar el archivo modificado
write.csv2(datos, "Data_modificado.csv", row.names = FALSE)
###########################################################################
```
### Exploracion preliminar de Datos
Crea un nuevo documento con nuevas Columnas las que pueden ser utilizadas posteriormente 
```bash
###########################################################################
# Cargar librerías
library(readr)
library(dplyr)

# Leer archivo
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Verificar que las columnas existen
cols_necesarias <- c("Nombre_Comuna", "Comuna.1", "Nombre_Violencia")
stopifnot(all(cols_necesarias %in% names(datos)))

# Función de limpieza
limpiar_texto <- function(texto) {
  texto <- gsub("Ñ", "N", texto)
  texto <- gsub("ñ", "n", texto)
  texto <- gsub("í", "i", texto)
  texto <- gsub("ó", "o", texto)
  texto <- gsub("é", "e", texto)
  texto <- gsub("ú", "u", texto)
  return(texto)
}

# Aplicar limpieza a las columnas relevantes
datos$Nombre_Comuna     <- limpiar_texto(datos$Nombre_Comuna)
datos$Comuna.1          <- limpiar_texto(datos$Comuna.1)
datos$Nombre_Violencia  <- limpiar_texto(datos$Nombre_Violencia)

# Guardar archivo limpio
write.csv2(datos, "Data_modificado_sin_tildes.csv", fileEncoding = "UTF-8", row.names = FALSE)
###########################################################################
```

### Elimina Caracteres especiales 
Elimina los carracteres especiales como tides 
```bash
###########################################################################
# Cargar librerías
library(readr)
library(dplyr)

# Leer archivo
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Verificar que las columnas existen
cols_necesarias <- c("Nombre_Comuna", "Comuna.1", "Nombre_Violencia")
stopifnot(all(cols_necesarias %in% names(datos)))

# Función de limpieza
limpiar_texto <- function(texto) {
  texto <- gsub("Ñ", "N", texto)
  texto <- gsub("ñ", "n", texto)
  texto <- gsub("í", "i", texto)
  texto <- gsub("ó", "o", texto)
  texto <- gsub("é", "e", texto)
  texto <- gsub("ú", "u", texto)
  return(texto)
}

# Aplicar limpieza a las columnas relevantes
datos$Nombre_Comuna     <- limpiar_texto(datos$Nombre_Comuna)
datos$Comuna.1          <- limpiar_texto(datos$Comuna.1)
datos$Nombre_Violencia  <- limpiar_texto(datos$Nombre_Violencia)

# Guardar archivo limpio
write.csv2(datos, "Data_Final.csv", fileEncoding = "UTF-8", row.names = FALSE)
###########################################################################
```

### 001 Grafico Preliminar 
El código en R realiza una visualización básica de la distribución de víctimas según su género. Primero, carga un archivo CSV llamado "Data_modificado.csv", asegurándose de que los textos se lean correctamente y sin convertir cadenas a factores automáticamente. Luego, transforma la columna Genero.Victima en un factor con tres niveles etiquetados como "Hombre", "Mujer" y "Otro", asignando etiquetas más descriptivas a los valores codificados 0, 1 y 2.

Posteriormente, crea un gráfico de barras usando ggplot2, donde el eje x representa el género de las víctimas y el eje y la frecuencia de cada categoría. Las barras se rellenan con un color azul ("steelblue") y se aplica un estilo minimalista con theme_minimal(). Finalmente, el gráfico se guarda como una imagen PNG con dimensiones de 800 por 600 píxeles bajo el nombre "001_genero_victima.png".
```bash
###########################################################################

# Leer el archivo CSV modificado
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Convertir columna Genero.Victima a factor con etiquetas
datos$Genero.Victima <- factor(datos$Genero.Victima,
                               levels = c(0, 1, 2),
                               labels = c("Hombre", "Mujer", "Otro"))

# Crear gráfico y guardar como imagen PNG
png("001_genero_victima.png", width = 800, height = 600)

ggplot(datos, aes(x = Genero.Victima)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Distribución por Sexo (Víctima)",
       x = "Sexo",
       y = "Frecuencia") +
  theme_minimal()

dev.off()

###########################################################################


```
![Screenshot](/img/001_genero_victima.png)



### 002 Distribucion de registros por comuna 
Este código en R genera un gráfico de barras que muestra la distribución de casos por comuna a partir de un archivo CSV llamado "Data_modificado.csv". Primero, se carga el archivo especificando la codificación UTF-8 y evitando que las cadenas se conviertan automáticamente en factores. Luego, utilizando ggplot2, se crea un gráfico donde el eje x representa los nombres de las comunas (Nombre_Comuna) y el eje y la cantidad de registros (frecuencia de casos) en cada una.

Las barras del gráfico se rellenan con color naranja oscuro ("darkorange") y se aplica un estilo visual limpio mediante theme_minimal(). Además, para mejorar la legibilidad del eje x, los nombres de las comunas se rotan 90 grados. Finalmente, el gráfico se guarda como una imagen PNG con dimensiones de 1000 por 800 píxeles bajo el nombre "002_distribucion_comunas.png".
```bash

###########################################################################
# Cargar librerías
#library(ggplot2)
#library(readr)

# Leer el archivo CSV modificado
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Crear gráfico y guardar como imagen PNG
png("002_distribucion_comunas.png", width = 1000, height = 800)

ggplot(datos, aes(x = Nombre_Comuna)) +
  geom_bar(fill = "darkorange") +
  labs(title = "Distribución de casos por Comuna",
       x = "Comuna",
       y = "Frecuencia") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))  # Rotar nombres

dev.off()
###########################################################################
```
![Screenshot](/img/002_distribucion_comunas.png)

### 003 Dsitribucion de las edades de las victimas  
Este código en R genera un histograma que muestra la distribución de edades de las víctimas utilizando datos del archivo "Data_modificado.csv". Primero, se carga el archivo asegurando una correcta codificación de caracteres y evitando la conversión automática de cadenas a factores. Luego, se transforma explícitamente la columna Edad a formato numérico, garantizando que se puedan realizar operaciones estadísticas y gráficas sobre ella.

Con ggplot2, se construye un histograma donde el eje x representa las edades y el eje y la frecuencia de aparición de cada valor. Se utiliza un ancho de bin de 1 año para una mayor precisión y detalle, coloreando las barras de verde marino ("seagreen") con bordes negros. Se aplica un tema minimalista para una presentación clara. Finalmente, el gráfico se guarda como imagen PNG de 800 por 600 píxeles con el nombre "003_edad.png".
```bash
###########################################################################

# Leer el archivo CSV modificado
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Asegurarse de que la columna Edad sea numérica
datos$Edad <- as.numeric(as.character(datos$Edad))

# Crear gráfico y guardar como imagen PNG
png("003_edad.png", width = 800, height = 600)

ggplot(datos, aes(x = Edad)) +
  geom_histogram(binwidth = 1, fill = "seagreen", color = "black") +
  labs(title = "Distribución de Edad de las Víctimas",
       x = "Edad",
       y = "Frecuencia") +
  theme_minimal()

dev.off()
###########################################################################


```
![Screenshot](/img/003_distribucion_edad.png)

### Dsitribucion de las edades de las victimas  
Este código en R genera un gráfico de barras que representa la distribución de los distintos tipos de violencia registrados en el archivo "Data_modificado.csv". Primero, se lee el archivo con codificación UTF-8 y sin convertir cadenas automáticamente en factores. Luego, se asume que la columna que contiene los tipos de violencia se llama Nombre_Violencia (debe ajustarse si el nombre difiere en los datos reales).

Utilizando ggplot2, se crea un gráfico donde el eje x muestra las distintas categorías de violencia y el eje y su frecuencia. Las barras se visualizan en color rojo tomate ("tomato"), y se aplica un diseño minimalista con theme_minimal(). Para facilitar la lectura, las etiquetas del eje x se rotan 90 grados. Finalmente, el gráfico se guarda como imagen PNG de 1000 por 700 píxeles bajo el nombre "004_registro_violencia.png".
```bash
###########################################################################

# Leer el archivo CSV modificado
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Verificar que la columna de tipos de violencia existe
# Puedes ajustar el nombre exacto si es diferente
# Supongamos que la columna se llama "Nombre_Violencia"
# Si no existe, reemplazar por el nombre real, por ejemplo: datos$Tipo

# Crear gráfico y guardar como imagen PNG
png("004_registro_violencia.png", width = 1000, height = 700)

ggplot(datos, aes(x = Nombre_Violencia)) +
  geom_bar(fill = "tomato") +
  labs(title = "Distribución por Tipo de Violencia",
       x = "Tipo de violencia",
       y = "Frecuencia") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

dev.off()
###########################################################################
```
![Screenshot](/img/004_registro_violencia.png)

### 005 Violencia cometida hacia las mujeres  
Este código en R genera un gráfico de barras que muestra los tipos de violencia sufridos exclusivamente por mujeres, utilizando datos del archivo "Data_modificado.csv". Primero, se carga el archivo asegurando la correcta codificación de caracteres y sin convertir cadenas a factores automáticamente. Luego, se filtran los registros donde la columna Genero.Victima tiene el valor 1, que representa a mujeres, y se guarda ese subconjunto en datos_mujeres.

Con ggplot2, se crea un gráfico de barras donde el eje x representa los distintos tipos de violencia (Nombre_Violencia) y el eje y su frecuencia. Las barras se muestran en color orquídea ("orchid") y se aplica un diseño limpio usando theme_minimal(). Para mejorar la legibilidad, las etiquetas del eje x se rotan 90 grados. Finalmente, el gráfico se guarda como imagen PNG de 1000 por 700 píxeles con el nombre "005_violencia_hacia_mujeres.png".
```bash
###########################################################################

# Leer el archivo CSV modificado
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Filtrar solo los casos donde la víctima es mujer (Genero.Victima == 1)
datos_mujeres <- datos %>%
  filter(Genero.Victima == 1)

# Crear gráfico y guardar como imagen PNG
png("005_violencia_hacia_mujeres.png", width = 1000, height = 700)

ggplot(datos_mujeres, aes(x = Nombre_Violencia)) +
  geom_bar(fill = "orchid") +
  labs(title = "Tipos de Violencia Sufrida por Mujeres",
       x = "Tipo de Violencia",
       y = "Frecuencia") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

dev.off()
###########################################################################

```
![Screenshot](/img/005_violencia_hacia_mujeres.png)

### 006 Violencia cometida hacia las hombres 
Este código en R genera un gráfico de barras que representa los tipos de violencia sufridos exclusivamente por hombres, utilizando información contenida en el archivo "Data_modificado.csv". En primer lugar, se carga el archivo especificando la codificación UTF-8 y evitando la conversión automática de cadenas en factores. A continuación, se filtran los registros donde la columna Genero.Victima es igual a 0, que corresponde a víctimas de sexo masculino, y se guarda el resultado en datos_hombres.

Usando ggplot2, se construye un gráfico de barras donde el eje x muestra los distintos tipos de violencia (Nombre_Violencia) y el eje y la cantidad de casos correspondientes. Las barras se colorean en azul claro ("skyblue"), y se utiliza un tema minimalista para una visualización clara y estética. Para facilitar la lectura, los nombres de las categorías en el eje x se rotan 90 grados. Finalmente, el gráfico se exporta como una imagen PNG de 1000 por 700 píxeles bajo el nombre "006_violencia_hacia_hombres.png".
```bash
###########################################################################


# Leer el archivo CSV modificado
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Filtrar solo los casos donde la víctima es hombre (Genero.Victima == 0)
datos_hombres <- datos %>%
  filter(Genero.Victima == 0)

# Crear gráfico y guardar como imagen PNG
png("006_violencia_hacia_hombres.png", width = 1000, height = 700)

ggplot(datos_hombres, aes(x = Nombre_Violencia)) +
  geom_bar(fill = "skyblue") +
  labs(title = "Tipos de Violencia Sufrida por Hombres",
       x = "Tipo de Violencia",
       y = "Frecuencia") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

dev.off()
###########################################################################
```
![Screenshot](/img/006_violencia_hacia_hombres.png)

### Comparacion de los actos violentos comentidos hacia hombres y mujeres  
007 Este grafico esta orientado a probar los graficos  
```bash
###########################################################################
# Cargar librerías

# Leer el archivo CSV modificado
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Asegurar que la columna Genero.Victima esté en formato factor
datos$Genero.Victima <- factor(datos$Genero.Victima,
                               levels = c(0, 1),
                               labels = c("Hombre", "Mujer"))

# Crear gráfico y guardar como imagen PNG
png("007_violencia_hombres_mujeres.png", width = 1200, height = 800)

ggplot(datos, aes(x = Nombre_Violencia, fill = Genero.Victima)) +
  geom_bar(position = "dodge") +
  labs(title = "Comparación de Tipos de Violencia Sufrida por Hombres y Mujeres",
       x = "Tipo de Violencia",
       y = "Frecuencia",
       fill = "Género de la Víctima") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

dev.off()
###########################################################################
```
![Screenshot](/img/007_violencia_hombres_mujeres.png)

### Ingreso de los registros por meses y genero
008 Este grafico esta orientado a probar los graficos  
```bash
###########################################################################
# Cargar librerías
#library(ggplot2)
#library(readr)
#library(dplyr)
#library(lubridate)

# Leer el archivo CSV
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Convertir formato de fecha con hora: "09-09-2021 14:09"
datos$Fecha <- dmy_hm(datos$Fecha)  # convierte a objeto POSIXct con hora

# Extraer nombre del mes como texto ordenado
datos$Mes <- factor(month(datos$Fecha, label = TRUE, abbr = FALSE),
                    levels = month.name, ordered = TRUE)

# Convertir Genero.Victima a factor con etiquetas
datos$Genero.Victima <- factor(datos$Genero.Victima,
                               levels = c(0, 1, 2),
                               labels = c("Hombre", "Mujer", "Otro"))

# Crear gráfico y guardar imagen
png("008_Ingreso_PorMesesYGenero.png", width = 1200, height = 700)

ggplot(datos, aes(x = Mes, fill = Genero.Victima)) +
  geom_bar(position = "dodge") +
  labs(title = "Cantidad de Ingresos por Mes, diferenciados por Género",
       x = "Mes del Año",
       y = "Número de Ingresos",
       fill = "Género de la Víctima") +
  theme_minimal()

dev.off()
###########################################################################

```
![Screenshot](/img/008_Ingreso_PorMesesYGenero.png)

### Ingreso de Registros Diferenciados por Mes y Genero
009 Este grafico esta orientado a probar los graficos  
```bash
###########################################################################
# Cargar librerías

# Leer archivo CSV
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Convertir Fecha y calcular hora decimal (ej: 14.25 = 14:15)
datos$Fecha <- dmy_hm(datos$Fecha)
datos$Hora_decimal <- hour(datos$Fecha) + minute(datos$Fecha) / 60

# Crear gráfico y guardar imagen PNG
png("009_ingresos_Horario.png", width = 1000, height = 600)

ggplot(datos, aes(x = Hora_decimal)) +
  geom_histogram(binwidth = 0.25, fill = "darkorange", color = "black") +  # cada 15 minutos
  scale_x_continuous(breaks = seq(0, 23.75, by = 1),
                     labels = paste0(seq(0, 23), ":00")) +
  labs(title = "Distribución Detallada de Ingresos por Hora del Día",
       x = "Hora del Día",
       y = "Número de Ingresos") +
  theme_minimal()

dev.off()
###########################################################################

```
![Screenshot](/img/009_ingresos_Horario.png)

### Funcion Graficar Violencia de genero sobre genero
010 Este grafico esta orientado a probar los graficos  
```bash
###########################################################################
###########################################################################
# Funcion Graficar Violencia de genero sobre genero 
graficar_violencia_por_genero <- function(archivo_csv, genero_victima = 1, genero_agresor = 1, salida = "grafico.png") {
  library(ggplot2)
  library(readr)
  library(dplyr)
  
  # Leer archivo
  datos <- read.csv2(archivo_csv, encoding = "UTF-8", stringsAsFactors = FALSE)
  
  # Convertir a numérico
  datos$Genero.Victima <- as.numeric(as.character(datos$Genero.Victima))
  datos$Genero.Agresor <- as.numeric(as.character(datos$Genero.Agresor))
  
  # Filtrar
  datos_filtrados <- datos %>%
    filter(Genero.Victima == genero_victima,
           Genero.Agresor == genero_agresor)
  
  # Si no hay datos, no crear el gráfico
  if (nrow(datos_filtrados) == 0) {
    message("No se encontraron registros para esos géneros.")
    return(NULL)
  }
  
  # Intentar crear gráfico
  tryCatch({
    png(salida, width = 1000, height = 700)
    print(
      ggplot(datos_filtrados, aes(x = Nombre_Violencia)) +
        geom_bar(fill = "steelblue") +
        labs(
          title = paste("Tipos de Violencia - Víctima:", genero_victima, "| Agresor:", genero_agresor),
          x = "Tipo de Violencia",
          y = "Frecuencia"
        ) +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    )
    dev.off()
    message(paste(" Gráfico guardado en:", salida))
  }, error = function(e) {
    message(" Error al generar el gráfico: ", e$message)
    dev.off()  # cierra dispositivo en caso de error
  })
}
###########################################################################

graficar_violencia_por_genero("/content/Data_modificado.csv", 1, 1, "010_mujeres_sobre_mujeres.png")
graficar_violencia_por_genero("/content/Data_modificado.csv", 0, 1, "010_mujeres_sobre_hombres.png")
graficar_violencia_por_genero("/content/Data_modificado.csv", 1, 0, "010_hombres_sobre_mujeres.png")
graficar_violencia_por_genero("/content/Data_modificado.csv", 0, 0, "010_hombres_sobre_hombres.png")

############################################################################
############################################################################
```
![Screenshot](/img/010_mujeres_sobre_mujeres.png)
![Screenshot](/img/010_mujeres_sobre_hombres.png)
![Screenshot](/img/010_hombres_sobre_mujeres.png)
![Screenshot](/img/010_hombres_sobre_hombres.png)

### Función para Graficar tipo de violencia por edad, comuna y género de la víctima 
0011 Este grafico esta orientado a probar los graficos  
```bash
###########################################################################
# Función: Graficar tipo de violencia por edad, comuna y género de la víctima
graficar_violencia_por_edad_comuna_y_genero <- function(archivo_csv, edad_objetivo, nombre_comuna, genero_victima, salida = "violencia_edad_comuna_genero.png") {
  library(ggplot2)
  library(readr)
  library(dplyr)

  # Leer el archivo
  datos <- read.csv2(archivo_csv, encoding = "UTF-8", stringsAsFactors = FALSE)

  # Convertir columnas a formatos adecuados
  datos$Genero.Victima <- as.numeric(as.character(datos$Genero.Victima))
  datos$Edad <- as.numeric(as.character(datos$Edad))
  datos$Nombre_Comuna <- tolower(datos$Nombre_Comuna)
  nombre_comuna <- tolower(nombre_comuna)

  # Filtrar por edad, comuna y género
  datos_filtrados <- datos %>%
    filter(Edad == edad_objetivo,
           Nombre_Comuna == nombre_comuna,
           Genero.Victima == genero_victima)

  # Validar si hay datos
  if (nrow(datos_filtrados) == 0) {
    message(" No hay registros para la comuna '", nombre_comuna, "', edad ", edad_objetivo, " y género ", genero_victima, ".")
    return(NULL)
  }

  # Crear gráfico
  tryCatch({
    png(salida, width = 1000, height = 700)
    print(
      ggplot(datos_filtrados, aes(x = Nombre_Violencia)) +
        geom_bar(fill = "tomato") +
        labs(
          title = paste("Violencia - Comuna:", tools::toTitleCase(nombre_comuna),
                        "| Edad:", edad_objetivo,
                        "| Género:", genero_victima),
          x = "Tipo de Violencia",
          y = "Frecuencia"
        ) +
        theme_minimal() +
        theme(axis.text.x = element_text(angle = 90, hjust = 1))
    )
    dev.off()
    message(paste(" Gráfico guardado en:", salida))
  }, error = function(e) {
    message(" Error al generar el gráfico: ", e$message)
    dev.off()
  })
}
###########################################################################

# Ejemplo de uso: hombre (0), edad 30, comuna "maipu"
genero <- 1
genero_texto <- ifelse(genero == 1, "mujer", "hombre")
comuna <- "maipu"
edad <- 22

graficar_violencia_por_edad_comuna_y_genero(
  archivo_csv = "/content/Data_modificado.csv",
  edad_objetivo = edad,
  nombre_comuna = comuna,
  genero_victima = genero,
  salida = paste0("011_violencia_", comuna, "_", genero_texto, "_", edad, ".png")
)
```
![Screenshot](/img/011_violencia_maipu_mujer_22.png)

### Función para graficar en 3D: Edad, Comuna y Género de la Víctima
0012 Este grafico esta orientado a probar los graficos  
```bash
###########################################################################
# Función para graficar en 3D: Edad, Comuna y Género de la Víctima
graficar_violencia_3d <- function(archivo_csv, genero_victima = NULL, salida = "grafico_3d.png") {
  # Cargar librerías necesarias
  #if (!requireNamespace("scatterplot3d", quietly = TRUE)) install.packages("scatterplot3d")
  #library(scatterplot3d)
  #library(readr)
  #library(dplyr)

  # Leer archivo CSV
  datos <- read.csv2(archivo_csv, encoding = "UTF-8", stringsAsFactors = FALSE)

  # Validar columnas necesarias
  if (!all(c("Edad", "Genero.Victima", "Nombre_Comuna") %in% names(datos))) {
    stop("El archivo debe contener las columnas: Edad, Genero.Victima y Nombre_Comuna.")
  }

  # Preprocesar y codificar comuna
  datos <- datos %>%
    mutate(
      Edad = as.numeric(Edad),
      Genero.Victima = as.numeric(Genero.Victima),
      Comuna_Cod = as.numeric(factor(Nombre_Comuna))
    ) %>%
    filter(!is.na(Edad), !is.na(Genero.Victima), !is.na(Comuna_Cod))

  # Aplicar filtro de género si se especifica
  if (!is.null(genero_victima)) {
    datos <- datos %>% filter(Genero.Victima == genero_victima)
  }

  # Verificar que hay datos
  if (nrow(datos) == 0) {
    message(" No hay datos para el criterio especificado.")
    return(NULL)
  }

  # Generar gráfico y guardar como imagen PNG
  tryCatch({
    png(salida, width = 1000, height = 800)
    scatterplot3d(
      x = datos$Edad,
      y = datos$Comuna_Cod,
      z = datos$Genero.Victima,
      pch = 16,
      color = "steelblue",
      xlab = "Edad",
      ylab = "Comuna (codificada)",
      zlab = "Género de la Víctima",
      main = "Gráfico 3D: Edad, Comuna, Género de la Víctima"
    )
    dev.off()
    message(paste(" Gráfico guardado como:", salida))
  }, error = function(e) {
    dev.off()
    message(" Error al generar el gráfico:", e$message)
  })
}
###########################################################################

# Todas las víctimas
graficar_violencia_3d("Data_modificado.csv", salida = "012_violencia_3d_todas.png")

# Solo mujeres (1)
graficar_violencia_3d("Data_modificado.csv", genero_victima = 1, salida = "012_violencia_3d_mujeres.png")

# Solo hombres (0)
graficar_violencia_3d("Data_modificado.csv", genero_victima = 0, salida = "012_violencia_3d_hombres.png")

```
![Screenshot](/img/012_violencia_3d_todas.png)
![Screenshot](/img/012_violencia_3d_mujeres.png)
![Screenshot](/img/012_violencia_3d_hombres.png)

### Dsitribucion de las edades de las victimas  
013 Este grafico esta orientado a probar los graficos  
```bash

```
![Screenshot](/img/004_registro_violencia.png)

