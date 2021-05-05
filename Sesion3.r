#CARGAR LOS 3 CUERPOS DE LITERATURA
#https://github.com/massimoaria/bibliometrix/blob/master/R/conceptualStructure.R
#https://bibliometrix.org/documents/bibliometrix_Report.html#section-4-the-conceptual-structure---co-word-analysis
#http://researchtoolsbox.blogspot.com/2020/06/
#https://jllopisperez.com/2013/07/06/tema-27-analisis-de-correspondencias/
####https://www.youtube.com/watch?v=CwgNPdzKMVI
#https://rstudio-pubs-static.s3.amazonaws.com/253042_5cc214c2db1845a0a45fa4b7cb9a78d8.html
#https://mran.microsoft.com/snapshot/2018-05-11/web/packages/bibliometrix/vignettes/bibliometrix-vignette.html
#LA B?SQUEDA SE FINALIZ? EL 17 DE MARZO DE 2021
#EN SCOPUS SE BUSCA ENTRECOMILLADO Y SE SELECCIONAN LAS OBSERVACIONES CORRESPONDIENTES A SOCIAL SCIENCES
#EN WOS SE BUSCA EN ALL FIELDS Y SE FILTRA POR TRANSPORTATION

# Cargar bibliometrix-----------------------------------------------------------

library(bibliometrix)
library(bibliometrixData)

file <- "/Users/rdelatorre/Downloads/scopus128.bib"
scopus128 <- convert2df(file = file, dbsource = "scopus", format = "bibtex")
file <- "/Users/rdelatorre/Downloads/savedrecs392.bib"
savedrecs393 <- convert2df(file = file, dbsource = "wos", format = "bibtex")


M<-bibliometrix::mergeDbSources(savedrecs393, scopus128, remove.duplicated = TRUE)


M<- M[-34,]
M<- M[-52,]

-----------------------------------------------------------------------------------
results <- biblioAnalysis(M, sep = ";")
S <- summary(object = results, k = 100, pause = TRUE)
plot(x = results, k = 10, pause = TRUE)


#berdica, holling, bruneau
M$CR[1]
CR1 <- citations(M, field = "article", sep = ";")
CR1$Cited[1:100]
cits <- CR1$Cited[1:100]

#cits
cits <- as.data.frame(cits)
cits<- stringr::str_split(cits$CR, pattern = "DOI", 2)
cits <- unlist(cits)
cits <- as.data.frame(cits)
cits$tf <- grepl("10.", cits$c)
cits <- cits %>% select(c, tf) %>% filter(tf=="TRUE") %>% select(c)
#exportarlo para limpiar en excell

cits<- read.csv("/Users/rdelatorre/Downloads/cits.csv")
cits<- sub(" ", "", cits$DI)
cits <- as.data.frame(cits)
names(cits) <- c("DI")

left_join(cits, M)

#######################################################

CR2 <- citations(M, field = "author", sep = ";")
CR2$Cited[1:15]

CR3 <- localCitations(M, sep = ";")
CR3$Authors[1:15,]
CR3$Papers[1:15,]

DF <- dominance(results, k=15)
DF

#Red de co-citas

NetMatrix <- biblioNetwork(M, analysis = "co-citation", network = "references", sep = ";")
net=networkPlot(NetMatrix, n = 10, Title = "Red de co-citas", type = "auto", cluster = "kamada", size=T,
                remove.multiple=TRUE, remove.isolates = TRUE, labelsize=0.8,edgesize = 5)#en lugar de "kamada" el cluster puede ser "louvain"

authorProdOverTime(M, k = 10, graph = TRUE)

#Co-ocurrencia de palabras

NetMatrix <- biblioNetwork(M, analysis = "co-occurrences", network = "keywords", sep = ";")
net=networkPlot(NetMatrix, normalize="association", weighted=T, n = 30, Title = "Keyword Cooccurrences", type = "fruchterman", size=T,edgesize = 5,labelsize=0.7)

CS <- conceptualStructure(M,field="ID", method="MCA", minDegree=4, clust=4 ,k.max=8, stemming=FALSE, labelsize=10, documents=10) #method puede ser "CA"

plot(CS[[4]])

# Create a historical citation network

histResults <- histNetwork(M, sep = ";")

# Plot a historical co-citation network
net <- histPlot(histResults, n=20, size = TRUE, labelsize = 5)


#Country collaboration

M <- metaTagExtraction(M, Field = "AU_CO", sep = ";")
NetMatrix <- biblioNetwork(M, analysis = "collaboration", network = "countries", sep = ";")
net=networkPlot(NetMatrix, n = 20, Title = "Country Collaboration", type = "circle", size=TRUE,remove.multiple=FALSE)
net=networkPlot(NetMatrix, n = 20, Title = "Country Collaboration", type = "fruchterman", size=FALSE, remove.multiple=TRUE)


#Bibliographic collaboration

NetMatrix <- biblioNetwork(M, analysis = "collaboration", network = "authors", sep = ";")
net=networkPlot(NetMatrix, n = 20, Title = "Bibliographic collaboration", type = "circle", size=FALSE, remove.multiple=TRUE)
net=networkPlot(NetMatrix, n = 20, Title = "Bibliographic collaboration", type = "kamada", size=TRUE, remove.multiple=TRUE)

#Buscar abstracts con el DOI

M %>% select(DI, AB) %>% filter(DI=="10.1016/j.jtrangeo.2020.102727")

K <- M[order(desc(M$TC)),]

head(K$TC,10)
head(K$AU, 10)
head(K[,c("AU", "AB", "TC", "DI")], 108)

#inclusion: mayores a 10 total citations.

m10 <- M %>% select(AU, TI, TC, AB, DI) %>% filter(TC>10)
m10 <- m10[order(desc(m10$TC)),]
m10$DI[13]

#################

L<- filter(M, grepl('BIG DATA',AB))

