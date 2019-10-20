
# May 9 2016
# Miles Corak

# load libraries used in mapping and analysis
# of intergenerational inocme mobility
# of Census Divisions and Census Sub Divisions

# install libraries needed for mapping

MapLibraries <- c("sp",
                  "maptools",
                  "gpclib",
                  "maps",
                  "mapdata",
                  "sfsmisc",
                  "mapproj",
                  "raster",
                  "rgeos",
                  "scales",
                  "mapplots",
                  "RgoogleMaps",
                  "plotGoogleMaps",
                  "ggmap",
                  "GEOmap",
                  "plotrix", "sf"
)

lapply(MapLibraries, library, character.only = TRUE)

library(xtable)
library(plyr)   # allows use of the rename function to change variable names
library(dplyr)
library(sparcl) # colors the leaves of a dendrogram https://rpubs.com/gaston/dendrograms
library(Hmisc)

# this library is for colour templates discussed at
# http://stat545-ubc.github.io/block018_colors.html#rcolorbrewer
library(RColorBrewer)

#read shape files, and Census Division data

#CD = source_url("https://github.com/milescorak/The-Canadian-Geography-of-Intergenerational-Income-Mobility/raw/master/ShapeFiles/CD1986_SHAPE.shp")
#CD  <- st_read("ShapeFiles/CD1986_SHAPE.shp")
#CSD <- st_read("ShapeFiles/CSD1986.shp")
#CMA <- st_read("ShapeFiles/CMACA1986.shp")


CD.data <- repmis::source_data("https://raw.githubusercontent.com/milescorak/The-Canadian-Geography-of-Intergenerational-Income-Mobility/master/Data/CD_mobility_All_cohorts_incomes_above_500.csv")
#CD.data <- read.csv(file="Data/CD_mobility_All_cohorts_incomes_above_500.csv",header=TRUE,sep=",")
# include province acronym with Census Division name to avoid ambiguities
CD.data$census.division.province.name  <- paste(CD.data$census.division.name, CD.data$province.name)

CD.data.boys <- repmis::source_data("https://raw.githubusercontent.com/milescorak/The-Canadian-Geography-of-Intergenerational-Income-Mobility/master/Data/CD_mobility_All_cohorts_incomes_above_500_Boys.csv")
# include province acronym with Census Division name to avoid ambiguities
CD.data.boys$census.division.province.name  <- paste(CD.data.boys$census.division.name, CD.data.boys$province.name)

CD.data.girls <- repmis::source_data("https://raw.githubusercontent.com/milescorak/The-Canadian-Geography-of-Intergenerational-Income-Mobility/master/Data/CD_mobility_All_cohorts_incomes_above_500_Girls.csv")
# include province acronym with Census Division name to avoid ambiguities
CD.data.girls$census.division.province.name  <- paste(CD.data.girls$census.division.name, CD.data.girls$province.name)

CSD.data <- repmis::source_data("https://github.com/milescorak/The-Canadian-Geography-of-Intergenerational-Income-Mobility/raw/master/Data/CSD_mobility_All_cohorts_incomes_above_500.csv")

PR.data  <- repmis::source_data("https://raw.githubusercontent.com/milescorak/The-Canadian-Geography-of-Intergenerational-Income-Mobility/master/Data/PR_mobility_1986_cohorts_incomes_above_500.csv")
PR.data.boys  <- repmis::source_data("https://raw.githubusercontent.com/milescorak/The-Canadian-Geography-of-Intergenerational-Income-Mobility/master/Data/PR_mobility_All_cohorts_incomes_above_500_Boys.csv")
PR.data.girls  <- repmis::source_data("https://raw.githubusercontent.com/milescorak/The-Canadian-Geography-of-Intergenerational-Income-Mobility/master/Data/PR_mobility_All_cohorts_incomes_above_500_Girls.csv")

All <- repmis::source_data("https://raw.githubusercontent.com/milescorak/The-Canadian-Geography-of-Intergenerational-Income-Mobility/master/Data/Percentile_transition_matrix_Canada_All_Cohorts_incomes_above_500.csv")
Boys <-repmis::source_data("https://raw.githubusercontent.com/milescorak/The-Canadian-Geography-of-Intergenerational-Income-Mobility/master/Data/Percentile_transition_matrix_Canada_All_Cohorts_incomes_above_500_Boys.csv")
Girls <-repmis::source_data("https://raw.githubusercontent.com/milescorak/The-Canadian-Geography-of-Intergenerational-Income-Mobility/master/Data/Percentile_transition_matrix_Canada_All_Cohorts_incomes_above_500_Girls.csv")

# create factor variable to represent membership in a group
# for the rags to riches movement
QuintileProbGroups <- cut(CD.data$p15, breaks= c(-0.01, 0.02499, 0.04999, 0.09999, 0.1499, 0.1999, 0.9),
                          labels = c("less than 0.025",
                                     "0.025 up to 0.05",
                                     "0.05 up to 0.10",
                                     "0.10 up to 0.15",
                                     "0.15 up to 0.20",
                                     "0.20 or more"))
# for the cycle of poverty
QuintileProbGroupsP11 <- cut(CD.data$p11, breaks= c(-0.01, 0.1999, 0.2499, 0.2999, 0.3499, 0.3999, 0.9),
                          labels = c("less than 0.20",
                                     "0.20 up to 0.25",
                                     "0.25 up to 0.30",
                                     "0.30 up to 0.35",
                                     "0.35 up to 0.40",
                                     "0.40 or more"))