
# map the seven cluster country
# but retain all those in cluster 2 of the 2 cluster country in one cluster

plot(CD.data.map.cluster, border="black",col="gray90",axes=FALSE,bg="white",las=1,lwd=0.15)

c <- brewer.pal(n = 11, name = "RdYlGn")

c1 <- subset(CD.data.map.cluster, CD.data.map.cluster$cluster9 == 1)
c2 <- subset(CD.data.map.cluster, CD.data.map.cluster$cluster9 == 2)
c3 <- subset(CD.data.map.cluster, CD.data.map.cluster$cluster9 == 3)
c4 <- subset(CD.data.map.cluster, CD.data.map.cluster$cluster9 == 4)
c5 <- subset(CD.data.map.cluster, CD.data.map.cluster$cluster9 == 5)
c6 <- subset(CD.data.map.cluster, CD.data.map.cluster$cluster9 == 6)
c7 <- subset(CD.data.map.cluster, CD.data.map.cluster$cluster9 == 7)
c8 <- subset(CD.data.map.cluster, CD.data.map.cluster$cluster9 == 8)
c9 <- subset(CD.data.map.cluster, CD.data.map.cluster$cluster9 == 9)

# this cluster is from the two leaf tree and used to replace the mapping
# of these CDs in the 10 leaf model
c11 <- subset(CD.data.map.cluster, CD.data.map.cluster$cluster2 == 2)

# map four clusters
plot(c1, border="black",col=c[6], axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(c2, border="black",col=c[4], axes=FALSE,add=TRUE,las=1,lwd=0.15)
#plot(c3, border="black",col=c[1], axes=FALSE,add=TRUE,las=1,lwd=0.15) covered by c11
plot(c4, border="black",col=c[7], axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(c5, border="black",col=c[5], axes=FALSE,add=TRUE,las=1,lwd=0.15)
#plot(c6, border="black",col=c[1], axes=FALSE,add=TRUE,las=1,lwd=0.15) covered by c11
#plot(c7, border="black",col=c[1], axes=FALSE,add=TRUE,las=1,lwd=0.15) covered by c11
#plot(c8, border="black",col=c[1], axes=FALSE,add=TRUE,las=1,lwd=0.15) covered by c11

# map the single cluster
plot(c9, border="black",col="gray", axes=FALSE,add=TRUE,las=1,lwd=0.15)

# map the four clusters belonging to the two fold landscape
plot(c11, border="black",col="red", axes=FALSE,add=TRUE,las=1,lwd=0.15)

leg.txt <- c("1", "2", "3", "4", "5", "unclassified")
legend("bottomleft",leg.txt,fill=c(c[7],c[6],c[5],c[4],"red","gray"),
       border="white",bg="white",pt.cex=1.5, cex=0.85,bty="n",text.font=3,
       title="Census Division Clusters\n(determined by Hierarchical\nAgglomorative Clustering)",
       title.adj=0.5,ncol=2)
#with(CD.data.cluster,
#     boxplot(CD.data.cluster[cluster2==2,]$p55,
#             CD.data.cluster[cluster7==2,]$p15,
#             CD.data.cluster[cluster7==1,]$p15,
#             CD.data.cluster[cluster7==3,]$p15 ))
