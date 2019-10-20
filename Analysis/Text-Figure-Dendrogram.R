# create dendogram
# using hierarchical clustering and Euclidean distance

x <- matrix(with(CD.data,
                 c(
                   parent.mean.income,
                   beta.slope,
                   beta.intercept,
                   rank.slope,
                   rank.intercept,
                   rank.share.above.parents,
                   p11, p15, p55
                 )),
            ncol=9)
rownames(x) <- CD.data$census.division.province.name
colnames(x) <- c("parent.mean.income",
                 "beta.slope",
                 "beta.intercept",
                 "rank.slope",
                 "rank.intercept",
                 "share.above.parents",
                 "p11","p15","p55"
)
x <- scale(x)

hc <- hclust(dist(x), method ="complete")
plot(hc, labels = FALSE, axes = FALSE, hang = 0.25, main = "",xlab = "",ylab="",sub = "")

# y holds the cluster of each observation
# one for each cuttree given by the column number
# for up to n.cluster groups

n.cluster <- 15
y <- cutree(hc, k=1:n.cluster)

# the rest of this code
# graphs the dendrogram so that leaves in cluster 2 are coloured red
# but this cannot be done without also printing the y axis
# which the above plot avoids

#l <- 3.1 # branch length, this needs to be played
         # with so that colours replace original black
#z <- y[,2]
#z.colour <- ifelse(z == 1, "gray50", "red") 

#dendrogram.title  <- ""

#ColorDendrogram(hc, y = z.colour, labels = FALSE, #y[,2]
#                main = dendrogram.title,
#                xlab="",ylab="",sub="",
#                branchlength = l
#)
