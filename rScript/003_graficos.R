
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

