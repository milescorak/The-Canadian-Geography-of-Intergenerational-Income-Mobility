
# map the quintile transition probability
# of moving to the top given parent in the bottom


CD.data.map  <- merge(CD,CD.data)

p1 <- subset(CD.data.map, CD.data.map$p15 >= 0.20)
p2 <- subset(CD.data.map, CD.data.map$p15 < 0.20 & CD.data.map$p15 >= 0.15)
p3 <- subset(CD.data.map, CD.data.map$p15 < 0.15 & CD.data.map$p15 >= 0.10)
p4 <- subset(CD.data.map, CD.data.map$p15 < 0.10 & CD.data.map$p15 >= 0.05)
p5 <- subset(CD.data.map, CD.data.map$p15 < 0.05 & CD.data.map$p15 >= 0.025)
p6 <- subset(CD.data.map, CD.data.map$p15 < 0.025)

c <- brewer.pal(n = 11, name = "RdYlGn")

# this plots the map of the country with CD boundaries

plot(CD.data.map,border="black",col="gray90",axes=FALSE,bg="white",las=1,lwd=0.15)

# this adds each CD according to the value of its transition probability
plot(p1, border="black",col=c[8], axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(p2, border="black",col=c[6], axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(p3, border="black",col=c[5], axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(p4, border="black",col=c[4], axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(p5, border="black",col=c[3], axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(p6, border="black",col=c[2], axes=FALSE,add=TRUE,las=1,lwd=0.15)


leg.txt <- c("0.20 or more",
             "0.15 to 0.20"  ,
             "0.10 to 0.15", "0.05 to 0.10"  ,
             "0.025 to 0.05", "less than 0.025")
# change cex=0.5 to =0.85 for the version to apper in the paper
legend("bottomleft",leg.txt,fill=c(c[8],c[6],c[5],c[4],c[3],c[2]),
       border="white",bg="white",pt.cex=1.5, cex=0.5,bty="n",text.font=3,
       title="Probability of moving to the top quintile for\nmen and women having bottom quintile parents",
       title.adj=0.5,ncol=2)
