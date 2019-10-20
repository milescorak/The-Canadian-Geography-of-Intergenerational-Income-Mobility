# map the quintile transition probability of staying in the bottom given parent in the bottom

CD.data.map  <- merge(CD,CD.data)

p1 <- subset(CD.data.map, CD.data.map$p11 >=0.4)
p2 <- subset(CD.data.map, CD.data.map$p11 < 0.40 & CD.data.map$p11 >= 0.35)
p3 <- subset(CD.data.map, CD.data.map$p11 < 0.35 & CD.data.map$p11 >= 0.30)
p4 <- subset(CD.data.map, CD.data.map$p11 < 0.30 & CD.data.map$p11 >= 0.25)
p5 <- subset(CD.data.map, CD.data.map$p11 < 0.25 & CD.data.map$p11 >= 0.20)
p6 <- subset(CD.data.map, CD.data.map$p11 < 0.2)

c <- brewer.pal(n = 11, name = "RdYlGn")

# this plots the map of the country with CD boundaries

plot(CD.data.map,border="black",col="gray90",axes=FALSE,bg="white",las=1,lwd=0.15)

# this adds each CD according to the value of its transition probability
plot(p1, border="black",col=c[2], axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(p2, border="black",col=c[3], axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(p3, border="black",col=c[4], axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(p4, border="black",col=c[5], axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(p5, border="black",col=c[6], axes=FALSE,add=TRUE,las=1,lwd=0.15)
plot(p6, border="black",col=c[8], axes=FALSE,add=TRUE,las=1,lwd=0.15)

leg.txt <- c("0.40 or higher",
             "0.35 to 0.40", "0.30 to 0.35"  ,
             "0.25 to 0.30", "0.20 to 0.25"  ,
             "less than 0.20")
# change cex=0.5 to =0.85 for the version to appear in the paper
legend("bottomleft",leg.txt,fill=c(c[2],c[3],c[4],c[5],c[6],c[8]),
       border="white",bg="white",pt.cex=1.5, cex=0.5,bty="n",text.font=3,
       title="Probability of staying in the bottom quintile for\nmen and women having bottom quintile parents",
       title.adj=0.5,ncol=2)