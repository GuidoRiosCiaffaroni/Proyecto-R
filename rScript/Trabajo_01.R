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
###############################################################################
library(tidyverse)
library(skimr)
library(GGally)
library(dplyr)

datos <- read.csv("Data.csv", header = TRUE, sep = "," , encoding = "UTF-8") # Carga de Datos

# Ver las primeras filas
head(datos)

# Ver la estructura de los datos
glimpse(datos)
###############################################################################

###############################################################################

###########################################################################
# Cargar librerías
library(dplyr)

# Leer el archivo correctamente (con separador ";")
datos <- read.csv2("Data.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

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
write.csv2(datos, "Data_modificado.csv", fileEncoding = "UTF-8", row.names = FALSE)
###########################################################################


# Cargar librerías

#########################################################################
library(tidyverse)
library(skimr)
library(ggplot2)
library(GGally)
library(plotly)
library(shiny)
library(scatterplot3d)
library(readr)
library(dplyr)
library(lubridate)

###########################################################################


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

###########################################################################
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



# Leer archivo
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Convertir fecha
datos$Fecha <- as.POSIXct(datos$Fecha, format = "%d-%m-%Y %H:%M", tz = "UTC")

# Filtrar filas con valores clave no faltantes
datos <- datos %>% filter(!is.na(Nombre_Genero_Victima_Texto), !is.na(Edad), !is.na(Nombre_Comuna))

# 1. Barras por género de la víctima
graf1 <- ggplot(datos, aes(x = Nombre_Genero_Victima_Texto)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Casos por género de la víctima", x = "Género", y = "Cantidad")
ggsave("001_grafico_genero_victima.png", plot = graf1, width = 6, height = 4, dpi = 300)

# 2. Barras agrupadas víctima vs agresor
graf2 <- ggplot(datos, aes(x = Nombre_Genero_Victima_Texto, fill = Nombre_Genero_Agresor_Texto)) +
  geom_bar(position = "dodge") +
  labs(title = "Víctima vs Agresor por género", x = "Víctima", fill = "Agresor")
ggsave("001_grafico_victima_agresor.png", plot = graf2, width = 6, height = 4, dpi = 300)

# 3. Barras por comuna
graf3 <- ggplot(datos, aes(x = Nombre_Comuna)) +
  geom_bar(fill = "darkorange") +
  labs(title = "Casos por comuna", x = "Comuna", y = "Cantidad") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))
ggsave("001_grafico_comuna.png", plot = graf3, width = 8, height = 5, dpi = 300)

# 4. Dispersión Edad vs Comuna
graf4 <- ggplot(datos, aes(x = Edad, y = Nombre_Comuna, color = Nombre_Genero_Victima_Texto)) +
  geom_point(size = 2) +
  labs(title = "Edad de víctimas por comuna", x = "Edad", y = "Comuna")
ggsave("001_grafico_edad_vs_comuna.png", plot = graf4, width = 6, height = 5, dpi = 300)

# 5. Pastel por género víctima
tabla_victima <- datos %>%
  group_by(Nombre_Genero_Victima_Texto) %>%
  summarise(Frecuencia = n())

graf5 <- ggplot(tabla_victima, aes(x = "", y = Frecuencia, fill = Nombre_Genero_Victima_Texto)) +
  geom_col() +
  coord_polar("y", start = 0) +
  labs(title = "Proporción por género de víctima", fill = "Género")
ggsave("001_grafico_pastel_genero.png", plot = graf5, width = 5, height = 5, dpi = 300)

# 6. Histograma de casos por fecha
graf6 <- ggplot(datos, aes(x = Fecha)) +
  geom_histogram(binwidth = 86400, fill = "purple") +
  labs(title = "Distribución temporal de casos", x = "Fecha", y = "Número de casos")
ggsave("001_grafico_casos_por_fecha.png", plot = graf6, width = 7, height = 4, dpi = 300)


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

###########################################################################

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
###########################################################################
library(lubridate)

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

###########################################################################

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

graficar_violencia_por_genero("Data_modificado.csv", 1, 1, "010_mujeres_sobre_mujeres.png")
graficar_violencia_por_genero("Data_modificado.csv", 0, 1, "010_mujeres_sobre_hombres.png")
graficar_violencia_por_genero("Data_modificado.csv", 1, 0, "010_hombres_sobre_mujeres.png")
graficar_violencia_por_genero("Data_modificado.csv", 0, 0, "010_hombres_sobre_hombres.png")

############################################################################
############################################################################

############################################################################
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
  archivo_csv = "Data_modificado.csv",
  edad_objetivo = edad,
  nombre_comuna = comuna,
  genero_victima = genero,
  salida = paste0("011_violencia_", comuna, "_", genero_texto, "_", edad, ".png")
)
###########################################################################
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

###########################################################################


###########################################################################
# === 1. Cargar datos reales ===
datos <- read.csv2("Data_modificado.csv", encoding = "UTF-8", stringsAsFactors = FALSE)

# Convertir columna Fecha a formato de fecha
datos$Fecha <- as.POSIXct(datos$Fecha, format = "%d-%m-%Y %H:%M", tz = "UTC")

# Eliminar registros con valores faltantes clave
datos <- datos %>% filter(!is.na(Nombre_Genero_Victima_Texto), !is.na(Edad), !is.na(Nombre_Comuna))

# === 2. Funciones de gráficos ===

grafico_genero_victima <- function(df) {
  g <- ggplot(df, aes(x = Nombre_Genero_Victima_Texto)) +
    geom_bar(fill = "steelblue") +
    labs(title = "Casos por género de la víctima", x = "Género", y = "Cantidad")
  ggsave("012_grafico_genero_victima.png", plot = g, width = 6, height = 4, dpi = 300)
}

grafico_genero_cruzado <- function(df) {
  g <- ggplot(df, aes(x = Nombre_Genero_Victima_Texto, fill = Nombre_Genero_Agresor_Texto)) +
    geom_bar(position = "dodge") +
    labs(title = "Víctima vs Agresor por género", x = "Género víctima", fill = "Género agresor")
  ggsave("012_grafico_genero_cruzado.png", plot = g, width = 6, height = 4, dpi = 300)
}

grafico_comuna <- function(df) {
  g <- ggplot(df, aes(x = Nombre_Comuna)) +
    geom_bar(fill = "darkorange") +
    labs(title = "Casos por comuna", x = "Comuna", y = "Cantidad") +
    theme(axis.text.x = element_text(angle = 45, hjust = 1))
  ggsave("012_grafico_comuna.png", plot = g, width = 8, height = 5, dpi = 300)
}

grafico_edad_comuna <- function(df) {
  g <- ggplot(df, aes(x = Edad, y = Nombre_Comuna, color = Nombre_Genero_Victima_Texto)) +
    geom_point(size = 2) +
    labs(title = "Edad de víctimas por comuna", x = "Edad", y = "Comuna")
  ggsave("012_grafico_edad_comuna.png", plot = g, width = 6, height = 5, dpi = 300)
}

grafico_pastel_tipo <- function(df) {
  df_summary <- df %>%
    group_by(Nombre_Genero_Victima_Texto) %>%
    summarise(Frecuencia = n())
  
  g <- ggplot(df_summary, aes(x = "", y = Frecuencia, fill = Nombre_Genero_Victima_Texto)) +
    geom_col() +
    coord_polar("y", start = 0) +
    labs(title = "Proporción por género de víctima", fill = "Género")
  ggsave("012_grafico_pastel_tipo.png", plot = g, width = 5, height = 5, dpi = 300)
}

grafico_tiempo <- function(df) {
  g <- ggplot(df, aes(x = Fecha)) +
    geom_histogram(binwidth = 86400, fill = "purple") +
    labs(title = "Distribución temporal de casos", x = "Fecha", y = "Cantidad")
  ggsave("012_grafico_tiempo.png", plot = g, width = 7, height = 4, dpi = 300)
}

# === 3. Ejecutar y guardar gráficos ===

grafico_genero_victima(datos)
grafico_genero_cruzado(datos)
grafico_comuna(datos)
grafico_edad_comuna(datos)
grafico_pastel_tipo(datos)
grafico_tiempo(datos)
#############################################################################



###########################################################################
