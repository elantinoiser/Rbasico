#Comando para pedir ayuda
#por ejemplo
#help.start()

help.start()

5+7

#Operador asignacion
#x y y son vectores de longitud 1


x <- 5+7

y <- x-3

#La sintaxis obliga a separar los elementos 
#de los vectores por comas,
#sin importar los espacios.

c(1,1,9,3,14)

z <- c(1,1,9,3,14)

length(x); length(y); length(z)

?c #funcion para combinar valores en un vector o lista

z

c(z,555,z)
c(x,y,z)

#Operaciones aritmeticas

z*2+10

#Guardar en una variable a una funcion
#que contenga otra funcion

raiz <- sqrt(z-1)

div <- z/raiz

#Reciclaje 

c(1,2,3,4)+c(0,10)#son vectores de diferente tamaño
c(1,2,3,4)+c(0,10,0,10)#R "recicla" los elementos para completarlos.


#Sesión 2

#¿Dónde estamos trabajando?

getwd() #Directorio o path

list.files()

#¿Qué tengo en mi working space?

ls()

?ls

rm(list=ls()) #Eliminar todos los objetos del espacio de trabajo

?list.files
args(list.files)

list.files(path = ".")

list.files(path = "C:/Users/rdelatorre/")

list.files(path = "C:/")

list.files(path = ".")

#Cambiar nombre de archivos

file.rename("mytest.R", "mytest2.R")

path<- file.path("C:", "Users", "rdelatorre", 
"Documents", "GitHub", "Rbasico", fsep = "/")

setwd(path)

setwd("C:/Users/rdelatorre/Documents/GitHub/")

getwd()
?setwd

getwd()

dir.create("materias/filosofia/lecturas")

dir.create(file.path("biologia", "lecturas"),
           recursive = TRUE)

file.create("jc.txt")
file.create("prueba2.R")

materias <- c("historia", "geografia", "fisica", "quimica")

for (i in materias){
  dir.create(i)
  
}

for (i in materias){
  
  dir.create(file.path(i, "lecturas"), recursive = TRUE)
}

seq(1,20)
seq(20,1)

seq(1,20, by=0.5)

seq(1,20, length=10)

my_seq <- seq(5,10, length=30)

1:length(my_seq) #Una secuencia de la misma longitud que otra

seq_along(my_seq)

#Crear un vector que contenga 40 ceros

rep(0, times=40)

rep(c(0,1,2), each=10)

for(i in 1:4){
  print(seq(1,5))
  
}
#Vectores

vect <- c(0.5, 55, -10, 6)
tf <- (vect<1)

vect>=6

3>5

4==4

(3>5) & (4==4)

(3>5) | (4==4)


((111 >= 111) | !(TRUE)) & ((4 + 1) == 5)

?"="
?"+"
?">"
?"|"

nombres <- c ("Martha", "Edelmira", "Itzamara", "Arturo", "José Alonso")

nom <- c("Mi", "nombre", "es")

paste(nom, collapse = " ")

nombre <- c(nom, "Johnn")

paste(nombre, collapse = " ")

paste("Centinela", "37", sep = " #")

paste(c("Juárez", "Reforma", "Constitución"), 45:47, sep = " #")

#Reciclaje

paste(LETTERS, 1:4, sep = "-")

#TIPOS DE OBJETOS

n <- rnorm(50, 5, 1)
y <- 10
x <- 5

x/y

class(x)

name <- "Carmen"; n1 <- 10; n2<- 100; m <- .5

ls()

ls(pat="m")
ls(pat="^nombre")

ls.str()

M <- data.frame("n1", "n2", "m")
N <- data.frame(3, 4, 5)
R <- rbind(M,N) #unir las filas de 2 dataframes

names(M)
names(N)

names(M) <- c("X3", "X4", "X5")

#diferentes formas de pedir ayuda

?lm
help("*")
help.start()


#Coerción de objetos, cambiar la clase de objeto o de dato

R$X3<- as.factor(R$X3)
class(R$X3)
as.numeric(R$X3)
as.matrix()
as.data.frame()
as.list()
as.character()
as.integer()
as.logical()

#LECTURA DE ARCHIVOS EN CSV Y XLS

diamonds <- read.csv("D:/Escritorio/diamonds.csv")
jul_gtfs_ohiiunam <- read_excel("D:/Escritorio/gtfs.mes/jul/jul.gtfs.ohiiunam.xlsx")

#VECTORES

edad <- c(15,19,13,NA, 20)
deporte <- c(TRUE, TRUE, NA, FALSE, TRUE)
comic_fav <- c(NA, "Superman", "Batman", NA, "Batman")

#EXTRAER ELEMENTOS DE VECTORES

edad[3]
edad[-3]

comic_fav[c(2,5)]

comic_fav[c(1,4)]

deporte[-3]

#MATRICES

mimatriz <- matrix(data=1:20, nrow=4, ncol=5, byrow=TRUE)

mimatriz

mimatriz[3, 4]

mimatriz[2, ]
mimatriz[, 5]

mimatriz[, -c(2, 4)]

mimatriz[-1, -3]  # Signo de menos para eliminar

#HASTA AQUÍ HEMOS REVISADO VECTORES, DATAFRAMES, MATRICES
#ARREGLOS

miarray <- array(data=letters[1:24], dim=c(3, 4, 2))

miarray[1, 3, 2]  # El orden es importante

miarray[,, 2]  # No se coloca nada en las primeras posiciones

miarray[, 3,]  # No se coloca nada en las primeras posiciones

#DATAFRAMES

mimarco <- data.frame(edad, deporte, comic_fav)

mimarco 

mimarco$deporte  # Se recomienda si el nombre es corto

mimarco[, 2]  # Se recomienda si recordamos su ubicacion

mimarco[["deporte"]]

mimarco[c("deporte", "edad")]

mimarco[2:4, 1]

subset(mimarco, subset=deporte == FALSE)

subset(mimarco, subset=deporte == TRUE)

subset(mimarco, subset=edad >= 17)

subset(mimarco, subset=edad < 20, select=c('deporte', 'comic_fav'))

subset(mimarco, subset=edad < 20 & deporte == TRUE)

url <- 'https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo'
dt1 <- read.table(url, header=T)
dim(dt1)  # Para conocer la dimensión de la base original

dt2 <- subset(x=dt1, subset=altura > 185 & peso > 80,
              select=c('sexo', 'edad', 'peso', 'altura'))
