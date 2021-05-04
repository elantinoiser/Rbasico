#Viene de Sesion3.R

library(ggplot2)

cits<- cits[1:10,]
cits$Año <- c(2015, 2003, 2002, 2006, 2012, 2015, 2011, 1973, 2009, 2012) 
cits$radius <- sqrt(cits$Freq / pi )
cits$count <- c("Mattsson", "Bruneau", "Berdica", "Janelius", "Chen", "Reggiani", "Cox", "Holling", "Koetse", "Miller-Hooks") 
colnames(cits)[2] <- "Citas"

library(ggplot2)
ggplot(cits,aes(Año,Citas))+
  geom_point(aes(size=radius*7.5),shape=21,fill="white")+
  geom_text(aes(label=count),size=5)+
  scale_size_identity()+
  theme(panel.grid.major=element_line(linetype=2,color="black"),
        axis.text.x=element_text(angle=90,hjust=1,vjust=0))