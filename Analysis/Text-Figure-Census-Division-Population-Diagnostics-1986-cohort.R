# March 25, 2017

# this is the same as the February 9, 2017 file
# but uses data for only the 1986 cohort

# examine the population in the analytical file
# as a proportion of the Census estimate of the population
# in each Census Division
# and produce a figure ranking each Census Division
# according to coverage

CD.data <- read.csv(file="Analysis/Data/CD_mobility_1986_cohorts_incomes_above_500.csv",head=TRUE,sep=",")

# create and select needed variables

census.division <- CD.data$census.division
province <- CD.data$province
province.name <- CD.data$province.name
CD86 <- CD.data$CD86
census.division.name <- CD.data$census.division.name

number.children          <- CD.data$number.children
number.children.weighted <- CD.data$number.children.weighted
number.children.census   <- CD.data$number.children.census

# create the population ratios
n.census <- number.children/number.children.census
n.weighted.census <- number.children.weighted/number.children.census

rank.slope        <- CD.data$rank.slope
rank.slope.se     <- CD.data$rank.slope.se
rank.intercept    <- CD.data$rank.intercept
rank.intercept.se <- CD.data$rank.intercept.se

p11 <- CD.data$p11
p15 <- CD.data$p15
p55 <- CD.data$p55

number.parent.quintile.1   <- CD.data$number.parent.quintile.1
number.parent.quintile.5   <- CD.data$number.parent.quintile.5
number.children.quintile.1 <- CD.data$number.children.quintile.1
number.children.quintile.5 <- CD.data$number.children.quintile.5

# create data frame
pop.data <- data.frame(
                  census.division,
                  province,
                  province.name,
                  CD86,
                  census.division.name,
                  
                  number.children,
                  number.children.weighted,
                  number.children.census,
                  
                  n.census,
                  n.weighted.census,
                  
                  rank.slope,
                  rank.slope.se,
                  rank.intercept,
                  rank.intercept.se,
                  
                  p11,
                  p15,
                  p55,
                  
                  number.parent.quintile.1,
                  number.parent.quintile.5,
                  number.children.quintile.1,
                  number.children.quintile.5  
                  )

# sort data frame of CDs by the ratio of number of children to Census estimate

pop.data.sorted <- na.omit(pop.data[order(pop.data$n.census),])

# plot data
par(las=1,xpd=FALSE)
plot(pop.data.sorted$n.census,cex=0.45,pch=21,ylim=c(0.2,1.7),col="red",
     cex.axis=0.7, cex.lab=0.85,
     xlab="266 Census Divisions ordered from\nlowest to highest coverage ratio (unweighted data)",
     ylab="Ratio of sample population in tax data to Census estimate",
     xaxs="r",xaxt="s",frame=1)
points(pop.data.sorted$n.weighted.census,cex=0.45, pch=21,col="blue")
grid()

text(210,0.35,"Weighted data",adj=0,cex=0.75,col="blue")
text(210,0.275,"Unweighted data",adj=0,cex=0.75,col="red")
points(205,0.35,pch=1,col="blue",cex=0.75)
points(205,0.275,pch=1,col="red",cex=0.75)


