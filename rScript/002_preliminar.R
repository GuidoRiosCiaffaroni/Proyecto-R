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

###########################################################################



