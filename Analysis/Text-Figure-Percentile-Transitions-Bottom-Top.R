install.packages("scatr",repos = "http://cran.us.r-project.org")
install.packages("reshape2",repos = "http://cran.us.r-project.org")
library(scatr)
library(reshape2)


# Create figure for the percentile ranks of children according
# percentile rank of the parents

# depict selected rows from the percentile transition matrix

# input the chosen percentile and choose the appropriate
# row from the percentile transition matrix
# graph child percentile outcomes for bottom percentile parents
i=1

X = c(1:100)
Y = 100*All[,i]

XY = cbind(X,Y)
XY = as.data.frame(XY)
# set parameter for maximum of y axis
y = 10
if (max(Y) < 5) y = 5
i = 5
Y1 = 100*All[,i]
X_data = cbind(XY,Y1)
colnames(X_data) = c("X","Fifth percentile parents","Bottom percentile parents")
X.data = reshape2::melt(X_data, id.vars = "X", measure.vars = c("Fifth percentile parents","Bottom percentile parents"))

g1 = ggplot(X.data, aes(x = X, y = value, color = variable))+
                geom_point()+ 
                ylim(0,y)+
                scale_x_continuous(breaks = seq(0,100,10))+
                        labs(title = "a) Children of bottom one and of bottom fifth percentile parents", y = "Percentage of children (%)",x = " ")+
                        theme(legend.title = element_blank(),legend.position=c(0.7,.75))
                        
                
# 
# graph child percentile outcomes for top percentile parents
i = 100

X = c(1:100)
Y2 = 100*All[,i]
# set parameter for maximum of y axis
y = 10
if (max(Y2) < 5) y = 5
XY2 = cbind(X,Y2)
XY2 = as.data.frame(XY2)
g2 = ggplot(XY2,aes(X,Y2),shape = 1) +
        geom_point(color = "steelblue") +
        scale_y_continuous(breaks = seq(0,y,2)) +
        scale_x_continuous(breaks = seq(0,100,10))+
        labs(title = "(b) Children of top percentile parents", y = "Percentage of children (%)", x = "")+
            geom_hline(yintercept = 1, linetype = "dashed")     
        
multiplot(g1,g2, cols = 1)
