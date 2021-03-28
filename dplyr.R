#https://github.com/rstudio/cheatsheets/blob/master/data-transformation.pdf

#DPLYR

install.packages("dplyr")
library(dplyr)

?mtcars

?iris


names(mtcars)
names(iris)

head(mtcars)
tail(iris)

head(mtcars, 3)
tail(iris, 3)

#Summarise cases

dplyr::summarise(mtcars, mediana=median(mpg))

dplyr::count(iris, Species)

class(iris$Species)

#Group cases

mtcars <- mtcars

mtcars %>% group_by(cyl) %>% summarise(avg=mean(mpg))

g_mtcars <- group_by(mtcars, cyl)

u_iris<-ungroup(g_iris)

#Extract cases

dplyr::filter(iris, Sepal.Length>7)

dplyr::distinct(iris, Species)

distinct(mtcars, cyl)

unique(iris$Species)

sample_n(iris, 10)

slice(iris, 10:15)

top_n(g_iris, 3, Sepal.Width)

#Arrange cases

arrange(mtcars, by=mpg)

arrange(mtcars, desc(mpg))

arrange(mtcars, desc(mpg), by_group=TRUE)

#Add cases

?faithful
add_row(faithful, eruptions=1, waiting=1)

#Extract variables

pull(iris, Sepal.Length)

select(iris, Sepal.Length, Species)

mutate(mtcars, gpm=1/mpg)

transmute(mtcars, gpm=1/mpg)

mutate_all(faithful, funs(log(.), log2(.)))

lapply(iris, class)

mutate_if(iris, is.numeric, funs(log(.)))

mutate_at (iris, vars(-Species), funs(log(.)))

rename(iris, Length=Sepal.Length)