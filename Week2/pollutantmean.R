#
#
#
#
#

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".

  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used

  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  mergedData <- data.frame()
  fnameV <- paste(formatC(id, width=3, format="d", flag="0"), ".csv", sep="")
  for (fileN in fnameV) {
    fileData <- read.csv(paste(directory, fileN, sep="/"), header=TRUE, sep=",", stringsAsFactors=TRUE)
    mergedData <- rbind(mergedData, fileData)
  }
  ( mean(mergedData[[pollutant]], na.rm=TRUE) )
}
