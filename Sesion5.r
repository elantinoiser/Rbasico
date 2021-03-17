Arrests <- carData::Arrests


#RESÚMENES

#Resumen del conjunto de datos activo.
summary(Arrests) 

#Resúmenes numéricos
numSummary(Arrests[,"age", drop=FALSE], statistics=c("mean", "sd", 
                                                     "se(mean)", "IQR", "quantiles", "cv", "skewness", "kurtosis"), 
           quantiles=c(0,.25,.5,.75,1), type="2")

binnedCounts(Arrests[,"age", drop=FALSE])

#Distribución de frecuencias

local({
  .Table <- with(Arrests, table(sex))
  cat("\nfrecuencias:\n")
  print(.Table)
  cat("\nporcentajes:\n")
  print(round(100*.Table/sum(.Table), 2))
})

#Número de observaciones ausentes

sapply(Arrests, function(x)(sum(is.na(x)))) # NA counts

#Tablas de estadísticas 
#Media por grupos
Tapply(age ~ citizen, mean, na.action=na.omit, data=Arrests)

#Matriz de correlaciones

cor(Arrests[,c("age","year")], use="complete")
cor(Arrests[,c("age","year")], use="pairwise.complete")

#Test de correlación

with(Arrests, cor.test(age, checks, alternative="greater", method="pearson"))


#Test de normalidad

normalityTest(~age, test="ad.test", data=Arrests)

#Transformación para normalizar
summary(powerTransform(age ~ 1, data=Arrests, family="bcPower"))

#TABLAS DE CONTINGENCIA

#Doble entrada
tabla1<- table(Arrests$colour,Arrests$released)
par(mfrow=c(1,1))  # divide graph area in 1 columns
plot(tabla1, col = c("red", "blue"), main = "Arrestos vs. color")

local({
  .Table <- xtabs(~released+colour, data=Arrests)
  cat("\nFrequency table:\n")
  print(.Table)
  .Test <- chisq.test(.Table, correct=FALSE)
  print(.Test)
})


#Triple entrada
local({
  .Table <- xtabs(~released+colour, data=Arrests)
  cat("\nFrequency table:\n")
  print(.Table)
  .Test <- chisq.test(.Table, correct=FALSE)
  print(.Test)
})

local({
  .Table <- xtabs(~colour+employed+released, data=Arrests)
  cat("\nFrequency table:\n")
  print(.Table) 
})

tabla<- as.data.frame(table(Arrests$released, Arrests$colour))
table(Arrests$released, Arrests$colour, Arrests$sex)

#https://cran.r-project.org/web/packages/expss/vignettes/tables-with-labels.html

install.packages("expss")
library(expss)
data(mtcars)
mtcars = apply_labels(mtcars,
                      mpg = "Miles/(US) gallon",
                      cyl = "Number of cylinders",
                      disp = "Displacement (cu.in.)",
                      hp = "Gross horsepower",
                      drat = "Rear axle ratio",
                      wt = "Weight (1000 lbs)",
                      qsec = "1/4 mile time",
                      vs = "Engine",
                      vs = c("V-engine" = 0,
                             "Straight engine" = 1),
                      am = "Transmission",
                      am = c("Automatic" = 0,
                             "Manual"=1),
                      gear = "Number of forward gears",
                      carb = "Number of carburetors"
)

cro(mtcars$am, mtcars$vs)

# Table column % with multiple banners
cro_cpct(mtcars$cyl, list(total(), mtcars$am, mtcars$vs))
