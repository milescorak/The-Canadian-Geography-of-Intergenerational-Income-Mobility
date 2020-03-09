
# map the seven cluster country
# but retain all those in cluster 2 of the 2 cluster country in one cluster

install.packages("naniar", repos = "http://cran.us.r-project.org")
library(naniar)
# map the seven cluster country
# but retain all those in cluster 2 of the 2 cluster country in one cluster

CD.data.map  <- merge(CD,CD.data)

CD.data.cluster      <- cbind(CD.data,y)
CD.data.map.cluster  <- merge(CD,CD.data.cluster)

cluster.new = CD.data.cluster$cluster9
cluster.2 = CD.data.cluster$cluster2
position = which(cluster.2==2)


for (i in 1:length(position)) {
  
  cluster.new[position[i]] = 0  
}


cluster.new[cluster.new == 9] = NA

CD.data.cluster.new = cbind(CD.data.cluster,cluster.new)
CD.data.map.cluster=merge(CD,CD.data.cluster.new)
CD.data.map.cluster$cluster.new = as.factor(CD.data.map.cluster$cluster.new)



ggplot(CD.data.map.cluster)+
  geom_sf(aes(fill = cluster.new))+
  scale_fill_manual(name = "Census Division Clusters
(determined by Hierarchical
Agglomorative Clustering)",labels=c("1","2","3","4","5","unclassified"), values = c("red","green1","orange","yellow","brown","grey"), na.value = "grey")+
  theme_void()
  


