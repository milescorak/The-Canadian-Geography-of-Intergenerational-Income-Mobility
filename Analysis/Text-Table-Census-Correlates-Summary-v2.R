# create a dataframe of outcomes and CD characterisitcs
# and examine their correlations

# this installs the library with the function corr
# that is used for calculation of weighted correlations
install.packages("boot")
library(boot)
library(xtable)

#CD.data      <- read.csv(file="Analysis/Data/CD_mobility_All_cohorts_incomes_above_500.csv",head=TRUE,sep=",")
# include province acronym with Census Division name to avoid ambiguities
# CD.data$census.division.province.name  <- paste(CD.data$census.division.name, CD.data$province.name)


#create alternative indicators of inequality

CD.data$parent.50.25.ratio <- CD.data$parent.median.income/CD.data$parent.income.p25
CD.data$parent.75.50.ratio <- CD.data$parent.income.p75/CD.data$parent.median.income
CD.data$parent.90.50.ratio <- CD.data$parent.income.p90/CD.data$parent.median.income
CD.data$parent.99.50.ratio <- CD.data$parent.income.p99/CD.data$parent.median.income

x <- matrix(with(CD.data,
                 c(
                   # outcomes
                   beta.intercept, beta.slope, parent.mean.income,
                   rank.intercept, rank.slope, rank.share.above.parents,
                   p15, p11, p55,
                   
                   #income correlates
                   #share.below.lico,
                   #parent.gini,
                   share.between.p25p75,
                   parent.50.25.ratio,
                   parent.75.50.ratio,
                   parent.90.50.ratio,
                   parent.99.50.ratio,
                   
                   # demographic corrlelates
                   share.education.lessthan.highschool,
                   share.lone.parents,
                   share.notborn.canada,
                   share.english.mt,
                   share.french.mt,
                   parent.percent.notmarried,
                   #population,
                   population.25up,
                   parent.percent.filing.french,
                  
                   # social capital correlates
                   share.changing.cd,
                   #share.changing.csd,
                   
                   # labour market correlates
                   share.jobs.manufact,
                   share.jobs.primary,
                   share.jobs.topten.sic
                 )),
            ncol=26)

rownames(x) <- CD.data$census.division.province.name
colnames(x) <- c(
  
  "beta.intercept", "beta.slope", "parent.mean.income",
  "rank.intercept", "rank.slope", "share.above.parents",
  "p15", "p11", "p55",
  
#  "share.below.lico",
#  "parent.gini",
  "share.between.p2575",
  "parent.50.25.ratio",
  "parent.75.50.ratio",
  "parent.90.50.ratio",
  "parent.99.50.ratio",
  
  "share.lessthan.highschool",
  "share.lone.parents",
  "share.notborn.canada",
  "share.english.mt",
  "share.french.mt",
  "parent.percent.notmarried",
#  "population",
  "population25up",
  "parent.percent.filing.french",

  "share.changing.cd",
#  "share.changing.csd",
  
  "share.jobs.manufact",
  "share.jobs.primary",
  "share.jobs.topten.sic"
)

# just in case weighted results are wanted
# the child population becomes the first column
number.children.weighted <- CD.data$number.children.weighted
x <- cbind(number.children.weighted,x)

corr.coeff <- matrix(nrow = 17, ncol=9)

# needed to get the rcorr package
require(Hmisc)

# This code populates the tabel with the partial correlation coefficients
# the least squares estimates use scaled data
# be certain to adjust the xtable title and footnotes accordingly
for(i in 2:10) {
     mystars <- 
       ifelse(summary(lm(scale(x[,i]) ~ 0 + scale(x[,11:27])))$coefficients[1:17,4]
                       < .05, "*", " ")
     
     corr.coeff [,i-1] <- 
       paste(
         mystars,
         round(summary(lm(scale(x[,i]) ~ 0 + scale(x[,11:27])))$coefficients[1:17,1],
                digits = 3),
         sep=""
       )

  }

# This code populates the table with the Pearson Corrleation Coefficients
# be certain to adjust the xtable title and footnotes accordingly

# require(Hmisc) # needed to get the rcorr function
#for(i in 2:9) {
#  for(j in 10:30) {
#   
#    mystars <- ifelse(rcorr(x[,i], x[,j],
#                            type = "pearson")$P[2,1] > .05, "*", " ")
#    
#    corr.coeff [j-9,i-1] <- paste( mystars, signif(rcorr(x[,i], x[,j],
#                                 type = "pearson")$r[2,1], digits = 3),  sep="")
#  }
#}

colnames(corr.coeff) <- c(
  "beta.intercept", "beta.slope", "parent.mean.income",
  "rank.intercept", "rank.slope", "share.above.parents",
  "p15", "p11", "p55")

correlate.name <- c(
  
#  "Poverty rate (below low income cut-off)",
#  "Gini coefficient (parent incomes)",
  "Parents between 25th and 75th percentiles",
  "Parent incomes at 50th to 25th percentile",
  "Parent incomes at 75th to 50th percentile",
  "Parent incomes at 90th to 50th percentile",
  "Parent incomes at 99th to 50th percentile",
  
  "Less than high school",
  "Lone parents",
  "Not born in Canada",
  "English mother tongue",
  "French mother tongue",
  "Parents not married",
#  "Population",
  "Population 25 years and older",
  "Parents filing in french",
  
  "Moved to Census division",
#  "Moved to Census sub division",
  
  "Employment in manufacturing",
  "Employment in primary sector",
  "Employment in top ten 3-digit SICs"
)
corr.coeff <- cbind(correlate.name,corr.coeff)
corr.coeff <- data.frame(corr.coeff)

options(xtable.caption.placement = "top")
options(xtable.timestamp = "")

# create table

print(xtable(corr.coeff,
             caption = "\\emph{Correlates of intergenerational income mobility:
             partial correlation coefficients derived from
             least squares estimation using scaled unweighted data on Census Divisons}",
             align=c("l","l","r","r","r","r","r","r","r","r","r"),
             colnames.format = "multiple",
             digits=c(0,0,3,3,3,3,3,3,3,3,3),
             label="Table-Census-Correlates"
),
comment=FALSE,
include.rownames=FALSE,
include.colnames=FALSE,
format.args=list(big.mark = ","),
scalebox = 0.65,
table.placement ="t",
add.to.row = list(pos = list(-1,-1,-1,-1,-1,0,0,5,13,14,nrow(corr.coeff),nrow(corr.coeff)),
                  command = c(paste("\\toprule \n", "\\\\ \n"),
                              " & \\multicolumn{3}{c}{Income mobility} & \\multicolumn{3}{c}{Rank mobility} & \\multicolumn{3}{c}{Directional mobility} \\\\ \n",
                              " & Absolute & Relative & Average & Absolute & Relative & Above & Rags to & Cycle of  & Cycle of  \\\\ \n",
                              " Census Division Characteristic & income & income & income & rank & rank & parents & riches & poverty & privilege \\\\ \n",
                              " & ($\\alpha_{j}$) & ($\\beta_{j}$) & ($\\bar{Y}_{j}$) & ($a_{j}$) & ($b_{j}$) & ($\\bar{y}_{j}$) & ($P_{1,5}$) & ($P_{1,1}$) & ($P_{5,5}$) \\\\ \n",
                              "\\\\ \n",
                              "\\bottomrule \\\\ \n",
                              "\\\\ \n",
                              "\\\\ \n",
                              "\\\\ \n",
                              "\\\\ \n",
                              paste("\\toprule \n \\multicolumn{9}{l}",
                                    "{\\scriptsize{\\emph{Note: Column entries are
                                    least squares estimates using scaled data on 266 Census Divisions.
                                    * indicates the p-value for a t-test of the null hypothesis of zero is less than 0.05.
                                    }}}  \n",
                                    sep = ""))
),
hline.after = NULL
                  )
