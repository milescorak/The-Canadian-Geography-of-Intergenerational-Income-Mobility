# April 12, 2016

# plot the average income for parents and children
# by Census Division
# as a square plot

# create data frame
parent  <- CD.data$parent.mean.income
child <- CD.data$child.mean.income
census.division <- CD.data$census.division
province <- CD.data$province
province.name <- CD.data$province.name
CD86 <- CD.data$CD86
census.division.province.name <- CD.data$census.division.province.name 
beta.slope <- CD.data$beta.slope
beta.intercept <- CD.data$beta.intercept

data <- data.frame(
  census.division,
  province,
  province.name,
  CD86,
  census.division.province.name,
  child,
  parent,
  beta.slope,
  beta.intercept
)

# sort data frame by parent mean income

data.sorted <- data[order(data$parent),]

# difference between child parent incomes to use in text
diff <- data.sorted$child - data.sorted$parent
i <- factor(data.sorted$child > data.sorted$parent)
c <- c("white", "gray")

# plot data
par(las=1,xpd=FALSE,pty="s")
plot(data.sorted$parent,data.sorted$child,
     cex=0.75,pch=21, bg = c[i],
     ylim=c(min(min(data.sorted$parent,data.sorted$child)),
            max(max(data.sorted$parent,data.sorted$child))),
     xlim=c(min(min(data.sorted$parent,data.sorted$child)),
            max(max(data.sorted$parent,data.sorted$child))),
     col="black",cex.axis=0.85, cex.lab=0.85,
     xlab="Average parent income in each Census Division\n(2014 constant dollars)",
     ylab="Average child adult income\n ",
     xaxs="r",xaxt="n",yaxt="n",frame=1
)
# this formats the axis labels to have commas after the thousands
myTicks = axTicks(1)
axis(1, at = myTicks, labels = prettyNum(myTicks, big.mark = ','),cex.axis=0.85)
myTicks = axTicks(2)
axis(2, at = myTicks, labels = prettyNum(myTicks, big.mark = ','),cex.axis=0.85)

grid()
abline(0,1, col="gray")
text(25000,69000,
     "Average income\nis higher for children",
     cex=0.85)
text(max(data.sorted$parent),min(data.sorted$child),
     "Average income\nis higher for parents",
     cex=0.85)