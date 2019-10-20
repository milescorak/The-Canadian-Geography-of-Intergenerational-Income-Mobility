
#CD.data <- read.csv(file="Analysis/Data/CD_mobility_All_cohorts_incomes_above_500.csv",
#                  head=TRUE,sep=",")
par(pty="s")

# this deletes the rows with missing data
# share.below.lico is missing for Yukon and NWT
# reducing sample size by six

CD.data.complete <- CD.data
#CD.data.complete <- CD.data[complete.cases(CD.data), ]
x <- with(CD.data.complete, 100*parent.gini)
y <- with(CD.data.complete, p11)

X <- "Income inequality in the parent's generation\n(Gini coefficient among parents in the Census Division)"
Y <- "Probability of intergenerational poverty"

ylim <- c(min(y),0.5)
xlim <- c(29,50)

# set up plot area
plot(x,y, type="n", ylab="", xlab = X, las=1, cex.lab=0.85, font.lab=2,
     ylim = ylim, xlim= xlim,
     xaxt="n" , bty="n")
text(xlim[1]-3.25, ylim[2]+0.03*ylim[2],
     expression(bold("Probability of\nintergenerational poverty")),
     cex=0.85,adj=0,xpd=TRUE)
# this formats x axis labels to have commas
myTicks = axTicks(1)
axis(1, at = myTicks, labels = prettyNum(myTicks, big.mark = ','),cex.axis=1)
grid()
# draw circles with area proportional to population
# radius <- sqrt( CD.data.complete$number.children.weighted/ pi )
radius <- sqrt( CD.data.complete$number.children.quintile.1/ pi )
symbols(x, y, circles=radius, inches=0.4,
        fg="white", bg="gray", add=TRUE)
# add lowess line
#lines(lowess(y~x), col="red", lwd=2)
#lines(lm(y~x), col="red", lwd=2)
#reg.line.weighted <- lm(y~x, weights = number.children.weighted)
reg.line <- lm(y~x)
abline(reg=reg.line,col="red", lwd=2)
#abline(reg=reg.line.weighted,col="gray", lwd=2)
#cor(y,x)

# add legend
#create legend
legPop <- c( 50000, 10000, 1000 )
legRad <- sqrt( legPop / pi )
hin <- par('pin')[2]
burgPerInch <- ( ylim[2] - ylim[1] ) / hin
radPerInch <- max(radius)/0.4
heightAdj <- legRad/radPerInch*burgPerInch
symbols( rep(47.5,3), rep(0.2,3) + 1.0*heightAdj, circles = legRad, inches = 0.4, add = TRUE)
tAdj <- strheight('50,000', cex=0.5)
text(rep(47.5,3), rep(0.2, 3) + heightAdj*2.2 + 0.3*tAdj,
     c('50,000','10,000','1,000'), cex=0.5)

#symbols( rep(7500,3), rep(0.2,3) + 0.55*heightAdj, circles = legRad, inches = 0.4, add = TRUE)

#text(7500, 0.245, "100,000", cex=0.5)
#text(7500, 0.233, "50,000", cex=0.5)
#text(7500, 0.216, "10,000", cex=0.5)
text(47.5, 0.275, expression(bold("Number of Children\nin bottom quintile families")),
     cex=0.65,adj=0.5)

# useful for colour coding
#i <- factor(CD.data$)
#c <- c("red", "blue")
