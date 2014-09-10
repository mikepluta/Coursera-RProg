<<<<<<< HEAD
cube <- function(x, n) {
  x^3
}setwd("~/Dropbox/Apps/01 Markdown/21 TeamLeada and Other Learnings/Coursera/R Programming/Week2")
=======
setwd("~/Dropbox/Apps/01 Markdown/21 TeamLeada and Other Learnings/Coursera/R Programming/Week2")
>>>>>>> 6e57a1e8c7738fadeda7a52e59374ef1599c5226

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
<<<<<<< HEAD


x <- 1:10
if(x > 5) {
  x <- 0
}


f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}


x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}
=======
>>>>>>> 6e57a1e8c7738fadeda7a52e59374ef1599c5226
