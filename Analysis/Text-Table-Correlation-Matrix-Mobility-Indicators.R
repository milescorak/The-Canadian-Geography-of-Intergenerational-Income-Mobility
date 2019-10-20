
# create table of the pearson correlation coefficients
# for the eight indicators of mobility across the Census Divisions
# go to https://www.r-bloggers.com/elegant-correlation-table-using-xtable-r-package/
# for more information to complete this code and calculate significance levels.


# select variables, calculate correlation matrix, and extract the lower half

x <- matrix(with(CD.data,
                 c(
                   beta.intercept, beta.slope, parent.mean.income,
                   rank.intercept, rank.slope, rank.share.above.parents,
                   p15, p11, p55
                 )),
            ncol=9)

require(Hmisc)
correlation.matrix <- rcorr(x, type="pearson")
pearson.coeff <- round(correlation.matrix$r,3)
p <- correlation.matrix$P

#mystars <- ifelse(p < .01, "**", ifelse(p < .1, "* ", "  "))
mystars <- ifelse(p < .05, "*", " ")

Rnew <- matrix(paste( mystars, pearson.coeff,  sep=""), ncol = 9)
diag(Rnew) <- "1.00"
#diag(Rnew) <- paste(diag(Rnew), " ", sep="")

upper<- Rnew
upper[upper.tri(Rnew)]<-""
pearson.coeff <- upper

rownames(pearson.coeff) <- c(
  "Absolute income mobility",
  "Relative income mobility",
  "Average parent income",
  "Absolute rank mobility",
  "Relative rank mobility",
  "Share above parents",
  "Rags to riches",
  "Cycle of poverty",
  "Cycle of privilege"
)

rm(upper, Rnew, mystars, x)

pearson.coeff <- as.data.frame(pearson.coeff)

options(xtable.caption.placement = "top")
options(xtable.timestamp = "")

# create table

print(xtable(pearson.coeff,
             caption = "\\emph{Pearson correlation coefficients between nine indicators
             of intergenerational income mobility across 266 Census Divisions}",
             align=c("l","r","r","r","r","r","r","r","r","c"),
             colnames.format = "multiple",
             #digits=c(0,3,3,3,3,3,3,3,3,3),
             label="Table-Correlation-Matrix"
),
comment=FALSE,
include.rownames=TRUE,
include.colnames=FALSE,
#format.args=list(big.mark = ","),
scalebox = 0.74,
table.placement ="t",
add.to.row = list(pos = list(-1,-1,-1,-1,-1,0,0,3,6,nrow(pearson.coeff),nrow(pearson.coeff)),
                  command = c(paste("\\toprule \n", "\\\\ \n"),
                              " & \\multicolumn{3}{c}{Income mobility} & \\multicolumn{3}{c}{Rank mobility} & \\multicolumn{3}{c}{Directional mobility}\\\\ \n",
                              " & Absolute & Relative & Average & Absolute & Relative & Above & Rags to & Cycle of & Cycle of\\\\ \n",
                              " & income & income & income & rank & rank & parents & riches & poverty & privilege\\\\ \n",
                              " & ($\\alpha_{j}$) & ($\\beta_{j}$) & ($\\bar{Y}_{j}$) & ($a_{j}$) & ($b_{j}$) & ($\\bar{y}_{j}$) & ($P_{1,5}$) & ($P_{1,1}$) & ($P_{5,5}$)\\\\ \n",
                              "\\\\ \n",
                              "\\bottomrule \\\\ \n",
                              "\\\\ \n",
                              "\\\\ \n",
                              "\\\\ \n",
                              paste("\\toprule \n \\multicolumn{10}{l}",
                                    "{\\scriptsize{\\emph{Note: Column entries are
                                    Pearson correlation coefficients. * indicates 
                                    the p-value for a t-test of the null hypothesis of zero is less than 0.05.}}}  \n",
                                    sep = ""))
),
hline.after = NULL
                  )

