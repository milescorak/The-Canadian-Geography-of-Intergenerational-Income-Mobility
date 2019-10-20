# exploratory plots of mobility outcomes across two clusters
# absolute and relative income mobility


par(mfrow=c(1,2))

data <- CD.data

with(data, plot(p55,p15,pch=21,las=1,bg="gray", col="black",cex=0.5, cex.axis=0.7, cex.lab=0.9,
                xlab="(a) Cycle of Privilege", font.main=1,cex.main=1,adj=0.5,
                ylab="Rags to Riches",
                xlim=c(0.1,0.6),
                ))
with(data, lines(lowess(p15~p55), col="red"))
with(data, abline(v=0.2,h=0.2,lty=3,col="gray"))

with(data, plot(p11,p15,pch=21,las=1,bg="gray", col="black",cex=0.5, cex.axis=0.7, cex.lab=0.9,
                xlab="(b) Cycle of Poverty", font.main=1,cex.main=1,adj=0.5,
                ylab="Rags to Riches",
                xlim=c(0.1,0.6),
                ))
with(data, lines(lowess(p15~p11), col="red"))
with(data, abline(v=0.2,h=0.2,lty=3,col="gray"))

rm(data)

par(mfrow=c(1,1))