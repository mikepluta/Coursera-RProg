setwd("~/Dropbox/Apps/01 Markdown/21 TeamLeada and Other Learnings/Coursera/R Programming/Week2")

source('pollutantmean.R')
source('complete.R')
source('corr.R')
source('rprog-scripts-submitscript1.R')

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)


complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)


cr <- corr("specdata", 150)
head(cr)
summary(cr)
length(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)
length(cr)

cr <- corr("specdata", 5000)
head(cr)
summary(cr)
length(cr)

cr <- corr("specdata")
head(cr)
summary(cr)
length(cr)


# -----

submit()
