# March 25, 2017

# compare estimates of absolute and relative rank mobility
# for the all cohorts data to the 1986 cohort

# the folling lines of code are useful as an example of how to label points on plots
# Interacting with a scatterplot
# attach(mydata)
# plot(x, y) # scatterplot
# identify(x, y, labels=row.names(mydata)) # identify points
# coords <- locator(type="l") # add lines
# coords # display list 

# read the data for the two cohorts subject to both have $500 of income

CD.data <- read.csv(file="Analysis/Data/CD_mobility_All_cohorts_incomes_above_500.csv",head=TRUE,sep=",")
CD.data.1986 <- read.csv(file="Analysis/Data/CD_mobility_1986_cohorts_incomes_above_500.csv",head=TRUE,sep=",")
oldpar <- par()

a   <- CD.data$rank.intercept
ase <- CD.data$rank.intercept.se

b   <- CD.data$rank.slope
bse <- CD.data$rank.slope.se

a86   <- CD.data.1986$rank.intercept
a86se <- CD.data.1986$rank.intercept.se

b86   <- CD.data.1986$rank.slope
b86se <- CD.data.1986$rank.slope.se

# create a measure of relative mobility
# where relative mobility refers to the difference in expected ranks between
# children with parents at the top of the income distribution and those at the bottom
R     <- b*100
R86   <- b86*100

# create data frame
D <- data.frame(a, ase,
                b, bse,
                a86, a86se,
                b86, b86se,
                R, R86
                )

# Examine relative mobility and the rank-rank slopes
# sort data by the degree of relative mobility in the all cohorts sample
# where relative mobility is understood as the slope of the Rank-Rank regression
DD <- D[order(D$b),]

# plot data and 95% confidence inteval for Relative Mobility
par(las=1,xaxt="s", yaxt="s")
plot(DD$R,cex=0.1,
     xlab="266 Census Divisions ordered from highest to lowest relative mobility",
     ylab="Top - bottom difference in percentile ranks",
     xaxs="r",xaxt="s",frame=1,
     cex.axis=0.7, cex.lab=0.85,)
lines(c(1,266),c(24.2,24.2),lty=2,lwd=1)
text(267,22,"Canada, 24.2",adj=1,cex=0.7)
DD$LL <- DD$R-2*100*DD$bse
DD$UL <- DD$R+2*100*DD$bse
for (i in 1:nrow(DD)){
  lines(x=c(i,i),y=c(DD$LL[i],DD$UL[i]),col="gray")
}
points(DD$R,col="black",cex=0.35,pch=19)
text(267,8,"Vertical lines indicate\n95% confidence interval",adj=1,cex=0.7,col="gray")
grid()

# optional diagnostics to determine if there are
# significant differences between the All Cohort data and the 1986 cohort
# plot 1986 estimates on the same graph
# points(DD$R86,col="red",cex=0.35)
# DD$LL86 <- DD$R86-2*100*DD$b86se
# DD$UL86 <- DD$R86+2*100*DD$b86se
# for (i in 1:nrow(DD)){
#  lines(x=c(i,i),y=c(DD$LL86[i],DD$UL86[i]),col="red")
#}


# this is another alternative
# look at and test for statistically significant difference
# between the intercepts of the two samples

DD$LL86 <- DD$R86-2*100*DD$b86se
DD$UL86 <- DD$R86+2*100*DD$b86se

DD$z <- (DD$b86 - DD$b)/(sqrt(DD$b86se^2 + DD$bse^2))
# plot only the CDs from the 1986 cohort with statistically different intercepts
# this should overlay on the all cohorts intercept graph if there have been no other plots since
for (i in 1:nrow(DD)){
  if (DD$z[i] > 1.96 | DD$z[i] < -1.96) points(i,DD$R86[i],col="red",pch=19,cex=0.35)
}
for (i in 1:nrow(DD)){
  if (DD$z[i] > 1.96 | DD$z[i] < -1.96) lines(x=c(i,i),y=c(DD$LL86[i],DD$UL86[i]),col="red")
}
text(267,2,"Estimate for 1986 cohort\nonly if statistically different",adj=1,cex=0.7,col="red")
