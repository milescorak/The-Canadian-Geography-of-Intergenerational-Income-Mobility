# Create figure for the percentile ranks of children according
# percentile rank of the parents

# depict selected rows from the percentile transition matrix

# input the chosen percentile and choose the appropriate
# row from the percentile transition matrix

par(mfrow=c(2,1),las=1)
# graph child percentile outcomes for bottom percentile parents
i <- 1

X <- c(1:100)
Y <- 100*All[,i]
# set parameter for maximum of y axis
y <- 10
if (max(Y) < 5) y <- 5
plot(X,Y,xlab="",
     ylim=c(0,y),las=1,col="gray",ylab="",
     cex=0.75,pch=19,cex.axis=0.85,cex.lab=0.85,
     xaxp=c(0,100,10),
     main="(a) Children of bottom one and of bottom fifth percentile parents",
     font.main=1,cex.main=1,adj=0
)


# graph child percentile outcomes for bottom vingtile parents
i <-5
points(X,100*All[,i],las=1,col="black",pch=1,cex=0.75)

title(ylab="Percentage of children (%)",adj=0.5, outer=FALSE,xpd=TRUE,cex.lab=0.8)
#title(xlab="Child's income rank in adulthood (percentile)",font.lab=1,cex.lab=1)
abline(h=1,lty="dashed",col="brown")
abline(v=c(10,30,50,70,90),col = "lightgray", lty = "dotted")
grid()

points(70,4,pch=19,col="gray")
points(70,3.7,pch=1,col="black")
text(72,4,"Bottom percentile parents",adj=0,cex=0.85,col="black")
text(72,3.7,"Fifth percentile parents",adj=0,cex=0.85,col="black")


# Create figure for the percentile ranks of children according
# percentile rank of the parents

# depict selected rows from the percentile transition matrix

# input the chosen percentile and choose the appropriate
# row from the percentile transition matrix

# graph child percentile outcomes for top percentile parents
i <- 100

X <- c(1:100)
Y <- 100*All[,i]
# set parameter for maximum of y axis
y <- 10
if (max(Y) < 5) y <- 5
plot(X,Y,xlab="",
     ylim=c(0,y),las=1,col="gray",ylab="",
     cex=0.75,pch=19,cex.axis=0.85,cex.lab=0.85,
     xaxp=c(0,100,10),
     main="(b) Children of top percentile parents",
     font.main=1,cex.main=1,adj=0
)

title(ylab="Percentage of children (%)",adj=0.5, outer=FALSE,xpd=TRUE,cex.lab=0.8)
title(xlab="Child's income rank in adulthood (percentile)",font.lab=1,cex.lab=0.8)
abline(h=1,lty="dashed",col="brown")
abline(v=c(10,30,50,70,90),col = "lightgray", lty = "dotted")
grid()

par(mfrow=c(1,1))
