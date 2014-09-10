#
#
#
#
#

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used

  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases

  ids <- vector()
  nobs <- vector()
  fnameV <- paste(formatC(id, width=3, format="d", flag="0"), ".csv", sep="")
  for (fileN in fnameV) {
    fileData <- read.csv(paste(directory, fileN, sep="/"), header=TRUE, sep=",", stringsAsFactors=TRUE)
    completeData <- fileData[complete.cases(fileData),]
    ids <- c(ids, completeData$ID[1])
    nobs <- c(nobs, nrow(completeData))
  }
  ( data.frame(id=ids, nobs=nobs) )
}
