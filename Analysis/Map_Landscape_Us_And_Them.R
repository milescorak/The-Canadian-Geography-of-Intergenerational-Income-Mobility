
# map a two cluster 'us - them' country
# the program Text-Figure-Dendrogram.R must have run to define n.cluster and y

a <- rep("cluster",n.cluster)
b <- seq(1:n.cluster)
a <- paste(a,b,sep="")

colnames(y) <- a
y <- as.data.frame(y)
CD.data.cluster      <- cbind(CD.data,y)
CD.data.map.cluster  <- merge(CD,CD.data.cluster)

plot(CD.data.map.cluster, border="black",col="gray90",axes=FALSE,
     bg="white",las=1,lwd=0.15)

c1 <- subset(CD.data.map.cluster, CD.data.map.cluster$cluster2 == 1)
c2 <- subset(CD.data.map.cluster, CD.data.map.cluster$cluster2 == 2)

c  <- rainbow(3)

plot(c1, border="black",col="gray", axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(c2, border="black",col="red", axes=FALSE,add=TRUE,las=1,lwd=0.15)