install.packages(c("brew", "countrycode",
                   "devtools", "dplyr",
                   "ggplot2", "googleVis",
                   "knitr", "MCMCpack",
                   "repmis", "RCurl",
                   "rmarkdown", "texreg",
                   "tidyr", "WDI",
                   "xtable", "Zelig"), repos = "http://cran.us.r-project.org")

packages = c("brew", "countrycode",
             "devtools", "dplyr",
             "ggplot2", "googleVis",
             "knitr", "MCMCpack",
             "repmis", "RCurl",
             "rmarkdown", "texreg",
             "tidyr", "WDI",
             "xtable", "Zelig")
libdown = lapply(packages, library, character.only = TRUE)

