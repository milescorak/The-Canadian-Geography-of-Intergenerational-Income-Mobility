# map a two cluster 'us - them' country
# the program Text-Figure-Dendrogram.R must have run to define n.cluster and y

a <- rep("cluster",n.cluster)
b <- seq(1:n.cluster)
a <- paste(a,b,sep="")

colnames(y) <- a
y <- as.data.frame(y)
CD.data.cluster      <- cbind(CD.data,y)
CD.data.map.cluster  <- merge(CD,CD.data.cluster)
CD.data.map.cluster$cluster2 = as.factor(CD.data.map.cluster$cluster2)
ggplot(CD.data.map.cluster)+
  geom_sf(aes(fill = cluster2))+
  scale_fill_manual(values = c("grey","red"))+
  theme_void()+
  theme(legend.position = "none")



