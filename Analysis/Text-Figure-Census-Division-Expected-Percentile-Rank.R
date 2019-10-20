# February 10, 2017

# make plot of expected rank outcomes
# for Census Divisions ordered by absolute mobility for bottom half children
# and contrasting with expected ranks of top half children
# and bottom fifth children

# this code is useful as an example of how to label points on plots
# Interacting with a scatterplot
# attach(mydata)
# plot(x, y) # scatterplot
# identify(x, y, labels=row.names(mydata)) # identify points
# coords <- locator(type="l") # add lines
# coords # display list 

# CD.data <- read.csv(file="Analysis/Data/CD_mobility_All_cohorts_incomes_above_500.csv",head=TRUE,sep=",")

# create and select needed variables

census.division <- CD.data$census.division
province <- CD.data$province
province.name <- CD.data$province.name
CD86 <- CD.data$CD86
census.division.name <- CD.data$census.division.name

number.children          <- CD.data$number.children
number.children.weighted <- CD.data$number.children.weighted
number.children.census   <- CD.data$number.children.census

rank.slope        <- CD.data$rank.slope
rank.slope.se     <- CD.data$rank.slope.se
rank.intercept    <- CD.data$rank.intercept
rank.intercept.se <- CD.data$rank.intercept.se

# create a measure of absolute mobility
# where absolute mobility refers to the expected percentile rank of those
# in the botoom half, bottom fifth, and top half of the income distribution
rank.expected.bottom.fifth <- rank.intercept + rank.slope*10
rank.expected.top.fifth    <- rank.intercept + rank.slope*90
rank.expected.bottom.half  <- rank.intercept + rank.slope*25


# create data frame
D <- data.frame(
  census.division,
  province,
  province.name,
  CD86,
  census.division.name,
  
  number.children,
  number.children.weighted,
  number.children.census,
  
  rank.slope,
  rank.slope.se,
  rank.intercept,
  rank.intercept.se,
  
  rank.expected.bottom.half,
  rank.expected.bottom.fifth,
  rank.expected.top.fifth
)

#DD <- D[order(D$rank.expected.top.fifth),]
DD <- D[order(D$rank.expected.bottom.fifth),]

# plot data and confidence inteval for Absolute Mobility
plot(DD$rank.expected.bottom.fifth,cex=0.35,pch=19,cex.axis=0.85, cex.lab=0.85,
     ylim=c(10,90),
     xlab="266 Census Divisions ordered from\nlowest to highest rank mobility for bottom fifth children",
     ylab="Expected percentile rank of children",
     xaxs="r",xaxt="s",frame=1,
     las=1)
lines(c(1,266),c(PR.data.rank$child.predicted.rank[13],
                 PR.data.rank$child.predicted.rank[13]),lty=2,lwd=1)
text(267,42,"Canada",adj=1,cex=0.75)

points(DD$rank.expected.bottom.fifth,cex=0.45, pch=19,col="red")
points(DD$rank.expected.top.fifth,cex=0.45, pch=19,col="blue")

text(190,21,"Parents in the top fifth",adj=0,cex=0.75,col="blue")
text(190,18,"Parents in the bottom fifth",adj=0,cex=0.75,col="red")

grid()