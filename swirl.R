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


