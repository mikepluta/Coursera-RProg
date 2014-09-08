#
#
#
#
#

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0

  ## Return a numeric vector of correlations

  completeData <- complete(directory)
  completeData <- subset(completeData, nobs > threshold)
  corrs <- vector()
  if (nrow(completeData) >= 1) {
    fnameV <- paste(formatC(completeData$id, width=3, format="d", flag="0"), ".csv", sep="")
    for (fileN in fnameV) {
      fileData <- read.csv(paste(directory, fileN, sep="/"), header=TRUE, sep=",", stringsAsFactors=TRUE)
      completeData <- fileData[complete.cases(fileData),]
      corrs <- c(corrs, cor(completeData$nitrate, completeData$sulfate))
    }
  }
  ( corrs )
}
