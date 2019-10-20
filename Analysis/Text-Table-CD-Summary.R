
# create table of sample size totals for provinces

options(xtable.caption.placement = "top")
options(xtable.timestamp = "")

# create table
CD.data.numbers <- subset(CD.data, select = c(province, number.children.weighted))

Canada.summary <- dplyr::summarise(CD.data.numbers, count = n(),
                              average.pop = as.integer(round(mean(number.children.weighted))),
                              min.pop = as.integer(min(number.children.weighted)),
                              max.pop = as.integer(max(number.children.weighted))
)

by_province <- group_by(CD.data.numbers, province)
CD.summary.stats <- dplyr::summarise(by_province,
                      count = n(),
                      average.pop = as.integer(round(mean(number.children.weighted))),
                      min.pop = as.integer(min(number.children.weighted)),
                      max.pop = as.integer(max(number.children.weighted))
                              )

province.names <- c("Newfoundland and Labrador",
                    "Prince Edward Island",
                    "Nova Scotia",
                    "New Brunswick",
                    "Quebec",
                    "Ontario",
                    "Manitoba",
                    "Saskatchewan",
                    "Alberta",
                    "British Columbia",
                    "Yukon",
                    "Northwest Territories, Nunavut"
                    )

CD.summary.stats$province <- province.names
Canada.summary$province <- "Canada"
CD.summary.stats <- rbind(CD.summary.stats, Canada.summary)

print(xtable(CD.summary.stats,
             caption = "\\emph{Number of Census Divisions by province and territory, and
             number of children per Census Division}",
             align=c("l","l","c","r","r","r"),
             colnames.format = "multiple",
             #digits=c(0,0,2,3,0,0),
             label="Table-Census-Division-Sample-Size"
),
comment=FALSE,
include.rownames=FALSE,
include.colnames=FALSE,
format.args=list(big.mark = ","),
scalebox = 0.9,
table.placement ="t",
add.to.row = list(pos = list(-1,-1,-1,0,0,0,nrow(CD.summary.stats)-1,nrow(CD.summary.stats)),
                  command = c(paste("\\toprule \n", "\\\\ \n"),
                              " & Number of & \\multicolumn{3}{c}{Number of children} \\\\ \n",
                              " Province / Territory & Census & \\multicolumn{3}{c}{per Census Division} \\\\ \n",
                              " & Divisions & Average & Minimum & Maximum \\\\ \n",
                              "\\\\ \n",
                              "\\bottomrule \\\\ \n",
                              "\\\\ \n",
                              paste("\\toprule \n \\multicolumn{5}{l}",
                                    "{\\scriptsize{\\emph{Note: Number of children is based on weighted totals per Census Division.}}}  \n",
                                    sep = ""))
),
hline.after = c(nrow(CD.summary.stats)-1)
)

