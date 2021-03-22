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



