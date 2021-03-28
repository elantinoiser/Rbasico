
data(Arrests, package="carData")
indexplot(Arrests[,c('age', 'year'), drop=FALSE], type='h', id.method='y', 
  id.n=2)
indexplot(Arrests[,'age', drop=FALSE], type='h', id.method='y', id.n=2)
with(Arrests, Dotplot(age, bin=FALSE))
with(Arrests, Dotplot(age, bin=FALSE))
with(Arrests, Dotplot(age, bin=FALSE))
with(Arrests, Hist(age, scale="frequency", breaks="Sturges", 
  col="darkgray"))
with(Arrests, discretePlot(year, scale="frequency"))
densityPlot( ~ age, data=Arrests, bw=bw.SJ, adjust=1, kernel=dnorm, 
  method="adaptive")
library(aplpack, pos=18)
with(Arrests, stem.leaf(age, na.rm=TRUE))
Boxplot( ~ age, data=Arrests, id=list(method="y"))
with(Arrests, qqPlot(age, dist="norm", id=list(method="y", n=2, 
  labels=rownames(Arrests))))
symbox(~ age, data=Arrests, trans=bcPower, powers=c(-1,-0.5,0,0.5,1))
symbox(~ age, data=Arrests, trans=bcPower, powers=c(-1,-0.5,0,0.5,1))
scatterplot(year~age, regLine=FALSE, smooth=FALSE, boxplots=FALSE, 
  data=Arrests)
scatterplotMatrix(~age+checks+year, regLine=FALSE, smooth=FALSE, 
  diagonal=list(method="density"), data=Arrests)
library(colorspace, pos=19)
with(Arrests, piechart(colour, xlab="", ylab="", main="colour", 
  col=rainbow_hcl(2), scale="percent"))

