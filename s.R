#https://gist.github.com/sibyvt

#Lesson 1
#https://gist.github.com/sibyvt/9c9ea23550f5037d5cff98456fa75503

#Pedir ayuda
#búsquedas en https://stackoverflow.com/

help.start()

#La forma más simple de usar R es como una calculadora

5+5
5+7

#La forma en que asigna un valor a una variable en R es mediante la asignación
#operador, que es solo un símbolo 'menor que' seguido de un signo 'menos'. Eso
#se ve así: <-

# Piense en el operador de asignación como una flecha. Estás asignando el valor a
# el lado derecho de la flecha al nombre de la variable en el lado izquierdo de la
# flecha.

#Para asignar el resultado de 5 + 7 a una nueva variable llamada x, escribe x <- 5 +
#7. Esto se puede leer como 'x obtiene 5 más 7'. Pruébelo ahora.

x <- 5+7

#Ahora la variable y 

y <-x-3

#La estructura más simple de datos son los vectores

c (1,1, 9, 3,14)

#Asignemos el vector a la variable z

z <- (1 1 9 3 14)

z <-c (1, 1, 9, 3, 14)

z <-c (1.1, 9, 3.14)

#Pedir ayuda sobre una función en específico

?c

z

#Podemos combinar vectores

c (z, 555, z)

#Los vectores numéricos se pueden utilizar en operaciones aritméticas

z * 2 + 10
z * 2 + 100

#Guardar una función que contenga otra función

raiz <-sqrt (z-1)

#¿Cuáles son las dimensiones de los objetos que hemos creado?
#¿Qué es lo que hace para calcular la raíz?

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

#¿Qué hace ls()?

?ls

x <- 9

#veamos qué tenemos en nuestro espacio local de trabajo

ls()

#¿Qué tenemos en nuestro directorio?

list.files()

#¿Qué hace list files?

?list.files

#¿Cuáles son sus argumentos?

args(list.files)

#

old.dir <- getwd()

dir.create("testdir")

setwd("testdir")

#Crear un script

file.create("mytest.R")

#¿Qué tenemos en nuestro espacio de trabajo y en nuestro directorio?

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

file.copy("mytest3.R", "mytest2.R")

#file.path


#file path sirve para establecer directorios de trabajo 

path<- file.path("C:", "Users", "rdelatorre", "Documents", "GitHub", "Rbasico", fsep="/")
setwd(path)

        

###

dir.create("testdir/pruebas3")

file.create("jc.txt")

getwd()

ls()

getwd()

list.files()


setwd(old.dir)

getwd()

dir.create("testdir/testdir2")

dir.create(file.path("testdir5", "testdir6"), recursive = TRUE)
