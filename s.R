#https://gist.github.com/sibyvt

#Lesson 1
#https://gist.github.com/sibyvt/9c9ea23550f5037d5cff98456fa75503

#Pedir ayuda
#b�squedas en https://stackoverflow.com/

help.start()

#La forma m�s simple de usar R es como una calculadora

5+5
5+7

#La forma en que asigna un valor a una variable en R es mediante la asignaci�n
#operador, que es solo un s�mbolo 'menor que' seguido de un signo 'menos'. Eso
#se ve as�: <-

# Piense en el operador de asignaci�n como una flecha. Est�s asignando el valor a
# el lado derecho de la flecha al nombre de la variable en el lado izquierdo de la
# flecha.

#Para asignar el resultado de 5 + 7 a una nueva variable llamada x, escribe x <- 5 +
#7. Esto se puede leer como 'x obtiene 5 m�s 7'. Pru�belo ahora.

x <- 5+7

#Ahora la variable y 

y <-x-3

#La estructura m�s simple de datos son los vectores

c (1,1, 9, 3,14)

#Asignemos el vector a la variable z

z <- (1 1 9 3 14)

z <-c (1, 1, 9, 3, 14)

z <-c (1.1, 9, 3.14)

#Pedir ayuda sobre una funci�n en espec�fico

?c

z

#Podemos combinar vectores

c (z, 555, z)

#Los vectores num�ricos se pueden utilizar en operaciones aritm�ticas

z * 2 + 10
z * 2 + 100

#Guardar una funci�n que contenga otra funci�n

raiz <-sqrt (z-1)

#�Cu�les son las dimensiones de los objetos que hemos creado?
#�Qu� es lo que hace para calcular la ra�z?

#Una nueva variable

div <- (z / raiz)

div <- z / raiz

#Reciclaje

z * 2 + 100
z * c (2, 2, 2) + c (100, 100, 100)

#Otro ejemplo de reciclaje

c (1,2,3,4) + c (0,10)
c (1,2,3,4) + c (0,10,0,10)

#Lesson 2
getwd()

#los objetos que tienen en su espacio local de trabajo

ls()

#�Qu� hace ls()?

?ls

x <- 9

#veamos qu� tenemos en nuestro espacio local de trabajo

ls()

#�Qu� tenemos en nuestro directorio?

list.files()

#�Qu� hace list files?

?list.files

#�Cu�les son sus argumentos?

args(list.files)

#

old.dir <- getwd()

dir.create("testdir")

setwd("testdir")

#Crear un script

file.create("mytest.R")

#�Qu� tenemos en nuestro espacio de trabajo y en nuestro directorio?

ls()

list.files()

file.exists("mytest.R")

file.info("mytest.R")

?file.info

file.info("mytest.R")$mtime

#Cambiar el nombre

file.rename()
args(file.rename)

file.rename("mytest2.R", "mytest.R")

#Copiar archivos

file.copy("mytest.R", "borrador1.1.R")

#file.path


#file path sirve para establecer directorios de trabajo 
#ejemplo con materias

path<- file.path("C:", "Users", "rdelatorre", "Documents", "GitHub", "Rbasico", fsep="/")

setwd(path)

        

###Crear directorio dentro de nuestro directorio, para que funcione el directorio debe existir.
#manualmente crear una carpeta y posteriormente ver c�mo aparece otra materia 
#CREAR MATERIAS MANUALMENTE

#MATERIAS
getwd()

dir.create("materias/filosofia")

dir.create("materias/filosofia/lecturas")


path<- file.path("C:", "Users", "rdelatorre", "Documents", "GitHub", "Rbasico", "materias", fsep="/")
setwd(path)


#Podemos crear archivos

file.create("jc.txt")
file.create("prueba2.R.")


getwd()

ls()

getwd()

list.files()


setwd(old.dir)

getwd()

#Crear irectorios dentro de directorios

dir.create(file.path("biologia", "lecturas"), recursive = TRUE)



materias <- c("historia", "geografia", "fisica", "quimica")

for (i in materias){
  
  dir.create(i)
  
}

dir.create("quimica/lecturas")

dir.create(file.path("biologia", "lecturas"))

dir.create("materias/filosofia")

for (i in materias){ 
dir.create(file.path(i, "lecturas"), recursive = TRUE)
}

#Lesson 3

ls()

1:20
pi:10
15:1

?":"

?"+"

#Deseamos mayor control del que el operador nos da

seq (1,20)

seq (1,20, by=0.5)

seq(1, 20, length=10)

my_seq <- seq(5, 10, length=30)

#supongamos que no conocemos la longitud de my_seq

1:length(my_seq)

seq_along (my_seq)

#Crear un vector que contenga 40 ceros

rep (0, times = 40)

#Repetir un vector

rep(c(0,1,2), times = 10)

rep(c(0,1,2), each = 10)

for (i in 1:10) {
  
  print(seq(1,20))
}




#Lesson 4

vect <- c(0.5, 55, -10, 6)
tf <- (vect < 1)

vect >= 6

(3 > 5)
(4 == 4)

(3 > 5) & (4 == 4)

(3 > 5) | (4 == 4)

((111 >= 111) | !(TRUE)) & ((4 + 1) == 5)

nombres <- c ("Martha", "Edelmira", "Itzamara", "Arturo", "Jos� Alonso")

nom <- c("Mi", "nombre", "es")

paste(nom, collapse = " ")

nombre <- c(nom, "Johnn")

paste(nombre, collapse = " ")

paste("Centinela", "37", sep = " #")

paste(c("Ju�rez", "Reforma", "Constituci�n"), 45:47, sep = " #")

paste(LETTERS, 1:4, sep = "-")

