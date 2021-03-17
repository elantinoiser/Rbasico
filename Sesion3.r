#CARGAR LOS 3 CUERPOS DE LITERATURA
#https://github.com/massimoaria/bibliometrix/blob/master/R/conceptualStructure.R
#https://bibliometrix.org/documents/bibliometrix_Report.html#section-4-the-conceptual-structure---co-word-analysis
#http://researchtoolsbox.blogspot.com/2020/06/
#https://jllopisperez.com/2013/07/06/tema-27-analisis-de-correspondencias/


file <- "/Users/rdelatorre/Downloads/scopus456.bib"
scopus456 <- convert2df(file = file, dbsource = "scopus", format = "bibtex")
file <- "/Users/rdelatorre/Downloads/savedrecs393.bib"
savedrecs393 <- convert2df(file = file, dbsource = "wos", format = "bibtex")
file <- "/Users/rdelatorre/Downloads/savedrecs273.bib"
savedrecs273 <- convert2df(file = file, dbsource = "wos", format = "bibtex")


#MERGE DE WEB  OF SCIENCE

wos393 <- as.data.frame(savedrecs393$DI)
wos273 <- as.data.frame(savedrecs273$DI)

names(wos393) <- "doi"
names(wos273) <- "doi"

duplicados<- rbind(wos273, wos393)

unique(duplicados$doi)

dplyr::left_join(wos273, wos393)



scopus <- as.data.frame(scopus456$DI)

names(wos) <- "doi"
names(scopus) <- "doi"

duplicados<- rbind(wos, scopus)

unique(duplicados$doi)

M<- full_join(savedrecs393, savedrecs273, by="DI")
M <- M[,1:55]
names(M)<-names

names<- names(savedrecs393)


#####SCOPUS
####https://www.youtube.com/watch?v=CwgNPdzKMVI

file <- "/Users/rdelatorre/Downloads/scopus(1).bib"
M <- convert2df(file = file, dbsource = "scopus", format = "bibtex")
M<- M[-68,]

results <- biblioAnalysis(M, sep = ";")
S <- summary(object = results, k = 10, pause = TRUE)
plot(x = results, k = 10, pause = TRUE)


M$CR[1]
CR1 <- citations(M, field = "article", sep = ";")
CR1$Cited[1:10]

CR2 <- citations(M, field = "author", sep = ";")
CR2$Cited[1:10]

CR3 <- localCitations(M, sep = ";")
CR3$Authors[1:10,]
CR3$Papers[1:10,]

DF <- dominance(results, k=15)
DF

NetMatrix <- biblioNetwork(M, analysis = "co-citation", network = "references", sep = ";")
net=networkPlot(NetMatrix, n = 10, Title = "Red de co-citas en Scopus", type = "auto", cluster = "kamada", size=T,
                remove.multiple=TRUE, remove.isolates = TRUE, labelsize=0.8,edgesize = 5)#en lugar de "kamada" el cluster puede ser "louvain"
authorProdOverTime(M, k = 10, graph = TRUE)


NetMatrix <- biblioNetwork(M, analysis = "co-occurrences", network = "keywords", sep = ";")
net=networkPlot(NetMatrix, normalize="association", weighted=T, n = 30, Title = "Keyword Cooccurrences", type = "fruchterman", size=T,edgesize = 5,labelsize=0.7)

CS <- conceptualStructure(M,field="ID", method="MCA", minDegree=4, clust=4 ,k.max=8, stemming=FALSE, labelsize=10, documents=10) #method puede ser "CA"

plot(CS[[4]])

# Create a historical citation network

histResults <- histNetwork(M, sep = ";")

# Plot a historical co-citation network
net <- histPlot(histResults, n=20, size = TRUE, labelsize = 5)


############WEB OF SCIENCE

####https://www.youtube.com/watch?v=CwgNPdzKMVI

file <- "/Users/rdelatorre/Downloads/savedrecs392.bib"
M <- convert2df(file = file, dbsource = "wos", format = "bibtex")
M<- M[-34,]#Esto es necesario porque la fuente es 2021


results <- biblioAnalysis(M, sep = ";")
S <- summary(object = results, k = 10, pause = TRUE)
plot(x = results, k = 10, pause = TRUE)

#En la exportación de WOS, seleccioné Autor, Título, Fuente, Abstract y exportar como BibText

M$CR[1]
CR1 <- citations(M, field = "article", sep = ";")
CR1$Cited[1:10]

CR2 <- citations(M, field = "author", sep = ";")
CR2$Cited[1:10]

CR3 <- localCitations(M, sep = ";")
CR3$Authors[1:10,]
CR3$Papers[1:10,]

DF <- dominance(results, k=15)
DF

NetMatrix <- biblioNetwork(M, analysis = "co-citation", network = "references", sep = ";")
net=networkPlot(NetMatrix, n = 10, Title = "Red de co-citas en Web of Science", type = "auto", cluster = "kamada", size=T,
                remove.multiple=TRUE, remove.isolates = TRUE, labelsize=0.8,edgesize = 5)
authorProdOverTime(M, k = 10, graph = TRUE)

NetMatrix <- biblioNetwork(M, analysis = "co-occurrences", network = "keywords", sep = ";")
net=networkPlot(NetMatrix, normalize="association", weighted=T, n = 30, Title = "Keyword Cooccurrences", type = "fruchterman", size=T,edgesize = 5,labelsize=0.7)

CS <- conceptualStructure(M,field="ID", method="MCA", minDegree=4, clust=4 ,k.max=8, stemming=FALSE, labelsize=10, documents=10)

plot(CS[[4]])

############WEB OF SCIENCE

####https://www.youtube.com/watch?v=CwgNPdzKMVI

file <- "/Users/rdelatorre/Downloads/savedrecs273.bib"
M <- convert2df(file = file, dbsource = "wos", format = "bibtex")


results <- biblioAnalysis(M, sep = ";")
S <- summary(object = results, k = 10, pause = TRUE)
plot(x = results, k = 10, pause = TRUE)

#En la exportación de WOS, seleccioné Registro completo y referencias y exportar como BibText

M$CR[1]
CR1 <- citations(M, field = "article", sep = ";")
CR1$Cited[1:10]

CR2 <- citations(M, field = "author", sep = ";")
CR2$Cited[1:10]

CR3 <- localCitations(M, sep = ";")
CR3$Authors[1:10,]
CR3$Papers[1:10,]

DF <- dominance(results, k=15)
DF

NetMatrix <- biblioNetwork(M, analysis = "co-citation", network = "references", sep = ";")
net=networkPlot(NetMatrix, n = 10, Title = "Red de co-citas en Web of Science", type = "auto", cluster = "kamada", size=T,
                remove.multiple=TRUE, remove.isolates=FALSE, labelsize=0.8,edgesize = 5)

authorProdOverTime(M, k = 10, graph = TRUE)


