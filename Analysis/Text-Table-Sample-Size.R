
# create table of sample size totals for provinces

options(xtable.caption.placement = "top")
options(xtable.timestamp = "")

# create table
PR.data.numbers <- PR.data[1:13,c("province.name", "number.children.weighted", "number.children", "number.children.census")]

# this function will round a number x to the nearest value of base
# used to round table entries to the nearest 50 before printing
mround <- function(x,base){
  base*round(x/base)
} 

PR.data.numbers$number.children  <- as.integer(mround(PR.data.numbers$number.children,50))
PR.data.numbers$number.children.weighted  <- as.integer(mround(PR.data.numbers$number.children.weighted,50))
PR.data.numbers$number.children.census  <- as.integer(mround(PR.data.numbers$number.children.census,50))

PR.data.numbers$ratio <- PR.data.numbers$number.children.weighted/PR.data.numbers$number.children.census
PR.data.numbers$ratio <- mround(PR.data.numbers$ratio,0.01)

print(xtable(PR.data.numbers,
             caption = "\\emph{Number of children born between 1963 and 1970: weighted and unweighted
             Intergenerational Income Data sample sizes compared to estimates from the 1986 Census}",
             align=c("l","l","r","r","r","c"),
             colnames.format = "multiple",
             #digits=c(0,0,2,3,0,0),
             label="Table-Sample-Size"
),
comment=FALSE,
include.rownames=FALSE,
include.colnames=FALSE,
format.args=list(big.mark = ","),
scalebox = 0.9,
table.placement ="t",
add.to.row = list(pos = list(-1,-1,-1,0,0,nrow(PR.data.numbers)-1,nrow(PR.data.numbers)),
                  command = c(paste("\\toprule \n", "\\\\ \n"),
                              " & \\multicolumn{2}{c}{Administrative Data} & 1986 Census & Ratio weighted \\\\ \n",
                              " Province / Territory & Weighted & Unweighted & Total &  to Census \\\\ \n",
                              "\\\\ \n",
                              "\\bottomrule \\\\ \n",
                              "\\\\ \n",
                              paste("\\toprule \n \\multicolumn{5}{l}",
                                    "{\\scriptsize{\\emph{Note: All numbers are rounded to the nearest 50.}}}  \n",
                                    sep = ""))
),
hline.after = c(nrow(PR.data.numbers)-1)
)

