install.packages(c("brew", "countrycode",
                   "devtools", "ggplot2", "googleVis",
                   "knitr",
                   "repmis",,
                   "rmarkdown", "texreg",
                   "tidyr", "WDI",
                   "xtable", "Zelig","tmaptools", "Rmisc", "naniar","tmap"), repos = "http://cran.us.r-project.org")

packages = c("brew", "countrycode",
             "devtools",
             "ggplot2", "googleVis",
             "knitr",
             "repmis", 
             "rmarkdown", "texreg",
             "tidyr", "WDI",
             "xtable", "Zelig","tmaptools","Rmisc""naniar","tmap")
libdown = lapply(packages, library, character.only = TRUE)
