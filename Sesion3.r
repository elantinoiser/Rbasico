#CARGAR LOS 3 CUERPOS DE LITERATURA
#https://github.com/massimoaria/bibliometrix/blob/master/R/conceptualStructure.R
#https://bibliometrix.org/documents/bibliometrix_Report.html#section-4-the-conceptual-structure---co-word-analysis
#http://researchtoolsbox.blogspot.com/2020/06/
#https://jllopisperez.com/2013/07/06/tema-27-analisis-de-correspondencias/
####https://www.youtube.com/watch?v=CwgNPdzKMVI


file <- "/Users/rdelatorre/Downloads/scopus128.bib"
scopus128 <- convert2df(file = file, dbsource = "scopus", format = "bibtex")
file <- "/Users/rdelatorre/Downloads/savedrecs392.bib"
savedrecs393 <- convert2df(file = file, dbsource = "wos", format = "bibtex")


M<-bibliometrix::mergeDbSources(savedrecs393, scopus128, remove.duplicated = TRUE)


M<- M[-34,]
M<- M[-52,]


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



