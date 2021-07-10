
#######################################################
#   Manejo de datos con R
#######################################################

# Lectura de datos.
# %>%       : Operador pip
# select()  : selecciona variables (columnas) por su nombre.
# filter()  : seleccionar (filtrar) filas dada una condición.
# arrange() : ordenar valors de una (varias) varible(s) de forma ascendente o descendente.
# mutate()  : crea nuevas variables a partir de variables existentes.

setwd(choose)
##########################################################
#          Lectura de archivo csv (iris.csv)

df1 <- read.csv('https://raw.githubusercontent.com/JulioCesarMartinez-00/S1-Introduccion-a-R/main/Sesi%C3%B3n4%20Manejo%20de%20datos%20con%20R/datsets/iris.csv')
head(df1)

# header para indicar encabezados
df2 <- read.csv('https://raw.githubusercontent.com/JulioCesarMartinez-00/S1-Introduccion-a-R/main/Sesi%C3%B3n4%20Manejo%20de%20datos%20con%20R/datsets/iris.csv', header=TRUE)
head(df2)


# agregar nombres de columnas 
df3 <- read.csv('https://raw.githubusercontent.com/JulioCesarMartinez-00/S1-Introduccion-a-R/main/Sesi%C3%B3n4%20Manejo%20de%20datos%20con%20R/datsets/iris.csv', 
                header=TRUE,
                col.names= c('Sepal_Length', 'Sepal_width', 'Petal_length', 'Petal_Width', 'Species'))
head(df3)

# para guardar un data frame en formato csv 
write.csv(df3, 'iris_x.csv', row.names=FALSE)



##########################################################
#  Lectura de archivo csv con separador distinto a ","

# csv separado por ; (iris2.csv)
df4 <- read.csv('https://raw.githubusercontent.com/JulioCesarMartinez-00/S1-Introduccion-a-R/main/Sesi%C3%B3n4%20Manejo%20de%20datos%20con%20R/datsets/iris2.csv',
                sep=';')
df4

# csv separado por "-" (iris3,csv)
df5 <- read.csv('https://raw.githubusercontent.com/JulioCesarMartinez-00/S1-Introduccion-a-R/main/Sesi%C3%B3n4%20Manejo%20de%20datos%20con%20R/datsets/iris3.csv',
                sep='-')
head(df5)
##########################################################
#       Lectura de archivos de excel

library(readxl)

# lestura de archivo (iris.xlsx)
df6 <- read_excel('./datasets/iris.xlsx')
head(df6)

# código para consolidar varias hojas de excel en un sólo data frame

df7 <- read_excel('./datasets/iris.xlsx', sheet = 1)
head(df7)

# mostramos los primeros valores
df7 <- read_excel('./datasets/iris.xlsx', sheet = 1)
head(df7)

# verificamos las dimensiones
consolidar <- function(dir){
  # lee primer archivo
  df7 <- read_excel(dir, sheet = 1)
  # vector de hojas de excel
  sheets <- excel_sheets(dir)
  # contar el número de hojas
  nsheets <- length(sheets)
  # lee iésima hoja y la concatena con df7
  for(i in 2:nsheets){
    df_i <- read_excel(dir, sheet = i)
    
    df7 <- rbind(df7, df_i)
  }
  return(df7)
}
#############################################
#ruta  <- './datasets/iris.xlsx'
df8 <- consolidar(dir='./datasets/iris.xlsx')
head(df8)
unique(df8$Species)

####################################################
#   Lectura de datos de la web 

# La información se encuentra disponible en la siguiente liga: 
#  https://www.gob.mx/salud/documentos/datos-abiertos-152127.
temp <- tempfile()
# creación de un archivo temporal
download.file("http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos/datos_abiertos_covid19.zip",temp)

# descargar archivo .zip al archivo temporal
# url : http://datosabiertos.salud.gob.mx/gobmx/salud/datos_abiertos
# función: download.file(url, temp)
covid_mx <- read.csv(unz(temp,'210707COVID19MEXICO.csv'))  

# lectura del archivo .csv deltro del .zip

# remueve archivos temporales
unlink(temp)

head(covid_mx)
dim(covid_mx)

######################################################
#              Manipulación de datos
######################################################

library('nycflights13')
library("tidyverse")


# descripción de variables
#  Variable	: Descripción
#  dep_time :	Hora real de salida
#  sched_dep_time :	Horario de salida y llegada programado
#  dep_delay	: Retraso de salida, en minutos. Los tiempos negativos representan salidas tempranas
#  arr_time	: Hora real de salida y de llegada
#  sched_arr_time	: Horario de llegada programado
#  arr_delay	: Retraso de llegada, en minutos. Los tiempos negativos representan llegadas tempranas
#  carrier	: Abreviación de la auerolínea
#  flight	: Número de vuelo
#  tailnum	: Número de avión
#  origin	: Origen
#  dest	: Destino
#  air_time	: Cantidad de tiempo en el aire, en minutos
#  distance	: Distancia entre aeropuertos, en millas
#  hour	: Hora de salida prevista desglosada en hora
#  minute	: Hora de salida prevista desglosada en minutos
#  time_hour	: Fecha y hora prevista del vuelo

# read dataset
flights <- read.csv('./datasets/flights.csv')
head(flights)
# Ejercicio 1: 
#  a) Crear varibles año, mes y día
#  b) Eliminar la variable time_hour
#  c) seleccionar las variables flight , air_time , y distance .
#  d) Filtrar mes de enero.
#  e) Filtrar por dia primero
#
flights

df01 <- flights %>% 
  # creamos variables año, mes y día
  mutate(año = substring(time_hour,7,10),
         mes = substring(time_hour,4,5),
         dia = substring(time_hour,1,2)) %>%
  # selecionamos la variable año
  select(año) 
  # filtramos 
  



#Ejercicio 6: de la base "flights" filtrar por mes de enero a marzo 
#             y ordenar el día de forma descendente.


# Ejercicio 7: de la base "flights" filtrar por los meses de 
#              enero a marzo y ordenar mes y día de forma descendente.


