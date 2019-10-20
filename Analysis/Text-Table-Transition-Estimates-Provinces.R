
# create table of sample size totals for provinces

options(xtable.caption.placement = "top")
options(xtable.timestamp = "")

# create table
PR.data.prob <- PR.data[1:13,c("province.name", "p15", "p11", "p55", "p33")]

print(xtable(PR.data.prob,
             caption = "\\emph{Intergenerational directional mobility based on selected transition probabilities:
             rags to riches, intergenerational cycle of poverty, and the intergenerational cycle of privilege}",
             align=c("l","l","c","c","c","c"),
             colnames.format = "multiple",
             digits=c(0,0,3,3,3,3),
             label="Table-Transition-Estimates"
),
comment=FALSE,
include.rownames=FALSE,
include.colnames=FALSE,
format.args=list(big.mark = ","),
scalebox = 0.9,
table.placement ="t",
add.to.row = list(pos = list(-1,-1,-1,0,0,nrow(PR.data.prob)-1,nrow(PR.data.prob)),
                  command = c(paste("\\toprule \n", "\\\\ \n"),
                              "  & Rags to riches & Cycle of poverty & Cycle of privilege & \\\\ \n",
                              " Province / Territory & ($P_{1,5}$) & ($P_{1,1}$) & ($P_{5,5}$) & ($P_{3,3}$) \\\\ \n",
                              "\\\\ \n",
                              "\\bottomrule \\\\ \n",
                              "\\\\ \n",
                              paste("\\toprule \n \\multicolumn{5}{l}",
                                    "{\\scriptsize{\\emph{Source: Selected entries from the quintile transition matrix
                                    calculated using Statistics Canada, Intergenerational Income Data.}}}  \n",
                                    sep = ""))
),
hline.after = c(nrow(PR.data.prob)-1)
)
