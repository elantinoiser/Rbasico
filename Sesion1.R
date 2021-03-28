#Sesión 1############

########Creación, listado y remoción de objetos######

n <- 15
n
5-> n
n
<<<<<<< HEAD
n = 15
=======
>>>>>>> 4ea3370848277328433f24ff9646c84fcb9f0974
x <- 1
X <- 10

n <- 10 + 2
n
12
<<<<<<< HEAD
n <- 3 + rnorm(3)
=======
n <- 3 + rnorm(1)
>>>>>>> 4ea3370848277328433f24ff9646c84fcb9f0974
n
(10+2)*5
name <- "Carmen"; n1 <- 10; n2 <- 100; m <- 0.5
ls()
ls(pat="m")
ls(pat = "^m")
ls.str()
M <- data.frame(n1, n2, m)
ls.str(pat="M")
rm(list=ls(pat="^m"))
<<<<<<< HEAD
rm(list = ls())
=======
>>>>>>> 4ea3370848277328433f24ff9646c84fcb9f0974

##########Pedir ayuda#########
?lm
help("*")
help("!=")
help.start()
apropos("help")
apropos("lm")

<<<<<<< HEAD
x <- 1
mode(x)
length(x)
A <- "Gomphotherium"; compar <- TRUE; z <- 1i

carData::Salaries

#Coerción de objetos

as.factor()
as.numeric()
as.matrix()
as.data.frame()
as.list()


diamonds <- read.csv("D:/Escritorio/diamonds.csv")
jul_gtfs_ohiiunam <- read_excel("D:/Escritorio/gtfs.mes/jul/jul.gtfs.ohiiunam.xlsx")

#Operadores
#https://stackoverflow.com/questions/38524774/understanding-the-result-of-modulo-operator
#Trabajar con Salaries de carData y storms de dplyr

#TIPOS DE OBJETOS

#VARIABLES

x <- 5
2 * x + 3
pais <- "Colombia"
nchar(pais)

verdadero <- TRUE
falso <- FALSE

verdadero*verdadero
verdadero*falso
falso*falso

#VECTORES

edad <- c(15, 19, 13, NA, 20)
deporte <- c(TRUE, TRUE, NA, FALSE, TRUE)
comic_fav <- c(NA, "Superman", "Batman", NA, "Batman")

edad[3]
edad[-3]

comic_fav[c(2:5)]
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


is.na(mimarco)

subset(mimarco, subset=edad >= 17)

subset(mimarco, subset=edad < 20, select=c('deporte', 'comic_fav'))

subset(mimarco, subset=edad < 20 & deporte == TRUE)

url <- 'https://raw.githubusercontent.com/fhernanb/datos/master/medidas_cuerpo'
dt1 <- read.table(url, header=T)
dim(dt1)  # Para conocer la dimensión de la base original

dt2 <- subset(x=dt1, subset=altura > 185 & peso > 80,
              select=c('sexo', 'edad', 'peso', 'altura'))

#LISTAS

set.seed(12345)
mivector <- runif(n=5)
matriz2 <- matrix(data=1:12, ncol=6)
milista <- list(E1=mivector, E2=matriz2, E3=mimarco)

milista

milista$E2

milista[[2]]

milista[2]

class(milista$E3)

class(milista[[3]])

class(milista[3]) #De lo anterior se observa claramente que cuando usamos $ o [[]] el resultado es el objeto almacenado, una matriz. Cuando usamos [] el resultado es una lista cuyo contenido es el objeto almacendado.

milista3 <- milista[3]

#Conociendo la base.

class(carData::Arrests) #class() is used to define/identify what "type" an object is from the point of view of object-oriented programming in R.
mode(carData::Arrests) #mode() gives the "type" of object from the point of view of Becker, Chambers & Wilks (1988).
storage.mode(carData::Arrests)
typeof(carData::Arrests) #typeof() gives the "type" of object from R's point of view.

x <- Arrests[[1]]

print(c(class(x), mode(x), storage.mode(x), typeof(x)))

head(Arrests[[1]]); head(Arrests[[2]]); head(Arrests[[3]])
tail(Arrests[[1]], 10); tail(Arrests[[2]], 10); tail(Arrests[[3]], 10)


names(carData::Arrests)
names(carData::Salaries)



#Gráficos


#Gráficas

with(Salaries, plotMeans(salary, sex, error.bars="se", connect=TRUE, xlab="Sexo", ylab="Salarios", main = "Brecha de género"))
plotMeans(Salaries$salary, Salaries$sex, error.bars="se", connect=TRUE, xlab="Sexo", ylab="Salarios", main = "Brecha de género")
=======
#Operadores
18>6

#Leer archivos

read.table(file, header = FALSE, sep = "", quote = "\"'", dec = ".",
           row.names, col.names, as.is = FALSE, na.strings = "NA",
           colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE, fill = !blank.lines.skip,
           strip.white = FALSE, blank.lines.skip = TRUE,
           comment.char = "#")

#Stata
Aguascalientes <- read_dta("C:/Users/rdelatorre/Downloads/Aguascalientes.dta")




>>>>>>> 4ea3370848277328433f24ff9646c84fcb9f0974
