
# create table of sample size totals for provinces

options(xtable.caption.placement = "top")
options(xtable.timestamp = "")

# create table
PR.data.income <- PR.data[1:13,c("province.name", "beta.intercept", "beta.slope", "parent.mean.income")]

# this function will round a number x to the nearest value of base
# used to round table entries to the nearest 50 before printing
mround <- function(x,base){
  base*round(x/base)
} 

PR.data.income$parent.mean.income  <- as.integer(mround(PR.data.income$parent.mean.income,1))

# PR.data.income$child.predicted.mean.income <- exp(PR.data.income$beta.intercept)*(PR.data.income$parent.mean.income)^(PR.data.income$beta.slope)
# PR.data.income$child.predicted.mean.income <- as.integer(mround(PR.data.income$child.predicted.mean.income,50))

print(xtable(PR.data.income,
             caption = "\\emph{Intergenerational income mobility: absolute income mobility,
             relative income mobility, and average parental community income}",
             align=c("l","l","c","c","c"),
             colnames.format = "multiple",
             digits=c(0,0,2,3,0),
             label="Table-Income-Estimates"
),
comment=FALSE,
include.rownames=FALSE,
include.colnames=FALSE,
format.args=list(big.mark = ","),
scalebox = 0.9,
table.placement ="t",
add.to.row = list(pos = list(-1,-1,-1,-1,0,0,nrow(PR.data.income)-1,nrow(PR.data.income)),
                  command = c(paste("\\toprule \n", "\\\\ \n"),
                              "  & Absolute & Relative & Average \\\\ \n",
                              " Province / Territory & mobility & mobility & income  \\\\ \n",
                              " & ($\\alpha_{j}$) & ($\\beta_{j}$) & ($\\bar{Y}_{j}$) \\\\ \n",
                              "\\\\ \n",
                              "\\bottomrule \\\\ \n",
                              "\\\\ \n",
                              paste("\\toprule \n \\multicolumn{4}{l}",
                                    "{\\scriptsize{\\emph{Note: First two columns are
                                    least squares estimates.}}}  \n",
                                    sep = ""))
),
hline.after = c(nrow(PR.data.income)-1)
)
