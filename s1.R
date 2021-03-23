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

vect <- c(0.5, 55, -10, 6)
tf <- (vect<1)

vect>=6

3>5

4==4

(3>5) & (4==4)

(3>5) | (4==4)

#push