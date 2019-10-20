
# create table of sample size totals for provinces

options(xtable.caption.placement = "top")
options(xtable.timestamp = "")

# create table
#PR.data.rank <- PR.data[1:13,c("province.name", "rank.share.above.parents", "rank.intercept", "rank.slope")]
PR.data.rank <- PR.data[1:13,c("province.name", "rank.intercept", "rank.slope")]

# read in data for 31 and 32 year olds 
# taken from the xl spreadsheet template_v2_sample2b_3132.xlsx
# this appears to be only for the 1986 cohort, so need to double check

PR.data.31.32  <- repmis::source_data("https://raw.githubusercontent.com/milescorak/The-Canadian-Geography-of-Intergenerational-Income-Mobility/master/Data/PR_mobility_1986_Cohort_31_32.csv")
PR.data.rank.31.32 <- PR.data.31.32[1:13,c("rank.intercept", "rank.slope")]

PR.data.rank$child.predicted.rank <-
  PR.data.rank$rank.intercept + PR.data.rank$rank.slope*25

PR.data.rank$rank.intercept.31.32 <- PR.data.rank.31.32$rank.intercept
PR.data.rank$rank.slope.31.32 <- PR.data.rank.31.32$rank.slope

PR.data.rank$child.predicted.rank.31.32 <-
  PR.data.rank$rank.intercept.31.32 + PR.data.rank$rank.slope.31.32*25

# print(xtable(PR.data.rank,
#              caption = "\\emph{Intergenerational rank mobility: absolute rank mobility,
#                         relative rank mobility, and the estimated percentile
#                         rank for a child raised by the average parents
#                         in the bottom half of the income distribution}",
#              align=c("l","l","c","c","c","c","c","c","c"),
#              colnames.format = "multiple",
#              digits=c(0,0,3,1,3,1,1,3,1),
#              label="Table-Rank-Estimates"
#              ),
#       comment=FALSE,
#       include.rownames=FALSE,
#       include.colnames=FALSE,
#       format.args=list(big.mark = ","),
#       scalebox = 0.82,
#       table.placement ="t",
#      # add.to.row = comment,
#       add.to.row = list(pos = list(-1,-1,-1,-1,0,0,nrow(PR.data.rank)-1,nrow(PR.data.rank)),
#                         command = c(paste("\\toprule \n", "\\\\ \n"),
#                                     " & Above & \\multicolumn{3}{c}{At 38 to 45 years of age} & \\multicolumn{3}{c}{At 31 and 32 years of age} \\\\ \n",
#                                     " Province / Territory & Parents & Absolute & Relative & Expected & Absolute & Relative & Expected \\\\ \n",
#                                     " & ($\\bar{y}_{j}$) &($a_{j}$) & ($b_{j}$) & Rank & ($a_{j}$) & ($b_{j}$) & Rank \\\\ \n",
#                                     "\\\\ \n",
#                                     "\\bottomrule \\\\ \n",
#                                     "\\\\ \n",
#                                     paste("\\toprule \n \\multicolumn{7}{l}",
#                                     "{\\scriptsize{\\emph{Source: Sample shares, and least squares estimates and predictions
#                                     using Statistics Canada, Intergenerational Income Data.}}}  \n",
#                                     sep = ""))
#       ),
#       hline.after = c(nrow(PR.data.numbers)-1)
# )

print(xtable(PR.data.rank,
             caption = "\\emph{Intergenerational rank mobility: absolute rank mobility,
                        relative rank mobility, and the estimated percentile
                        rank for a child raised by the average parents
                        in the bottom half of the income distribution}",
             align=c("l","c","c","c","c","c","c","c"),
             colnames.format = "multiple",
             digits=c(0,3,1,3,1,1,3,1),
             label="Table-Rank-Estimates"
),
comment=FALSE,
include.rownames=FALSE,
include.colnames=FALSE,
format.args=list(big.mark = ","),
scalebox = 0.82,
table.placement ="t",
# add.to.row = comment,
add.to.row = list(pos = list(-1,-1,-1,-1,0,0,nrow(PR.data.rank)-1,nrow(PR.data.rank)),
                  command = c(paste("\\toprule \n", "\\\\ \n"),
                              " & Above & \\multicolumn{3}{c}{At 38 to 45 years of age} & \\multicolumn{3}{c}{At 31 and 32 years of age} \\\\ \n",
                              " Province / Territory & Parents & Absolute & Relative & Expected & Absolute & Relative & Expected \\\\ \n",
                              " & ($\\bar{y}_{j}$) &($a_{j}$) & ($b_{j}$) & Rank & ($a_{j}$) & ($b_{j}$) & Rank \\\\ \n",
                              "\\\\ \n",
                              "\\bottomrule \\\\ \n",
                              "\\\\ \n",
                              paste("\\toprule \n \\multicolumn{7}{l}",
                                    "{\\scriptsize{\\emph{Source: Sample shares, and least squares estimates and predictions
                                    using Statistics Canada, Intergenerational Income Data.}}}  \n",
                                    sep = ""))
),
hline.after = c(nrow(PR.data.numbers)-1)
)

