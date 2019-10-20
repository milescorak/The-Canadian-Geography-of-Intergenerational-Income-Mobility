# February 21, 2018

# A replication with the Canadian data of Figure IIA in Chetty et al (2014) QJE

# calculate expected child percentile rank for each parent percentile rank
# and plot the result along with a least squares line to highlight
# the degree of non linearity in the data

CDN <- read.csv(file="Analysis/Data/Percentile_transition_matrix_Canada_All_Cohorts_incomes_above_500.csv",head=FALSE,sep=",")

X <- c(1:100)
Y <- 100*(X*CDN)
Y <- apply(Y,2, mean)

plot(X,Y, ylim=c(30,70), typ = "n", pty = "s",
     cex=0.5, cex.axis=0.85, cex.lab=0.85, 
     xlab="Parent percentile income rank", ylab="Expected child percentile income rank",
     las=1)
grid()
abline(lm(Y~X), col="red")
points(X,Y, cex = 0.75, pch=21, bg = "gray", col="black")


text(60, 35, "Least squares estimates:", cex = 0.85)
text(82, 35, "slope,", cex = 0.85, adj = 1)
text(82, 33, "intercept,", cex = 0.85, adj = 1)
text(83, 35, format(lm(Y~X)$coefficients[2],digits=3), cex = 0.85, adj = 0)
text(83, 33, format(lm(Y~X)$coefficients[1],digits=3), cex = 0.85, adj = 0)

