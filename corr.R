corr <- function(directory, threshold = 0) {
     ## 'directory' is a character vector of length 1 indicating
     ## the location of the CSV files
     
     ## 'threshold' is a numeric vector of length 1 indicating the
     ## number of completely observed observations (on all
     ## variables) required to compute the correlation between
     ## nitrate and sulfate; the default is 0
     
     ## Return a numeric vector of correlations
     ## NOTE: Do not round the result!
     
     # Get completed cases for all monitors (files) and isolate all IDs above threshold
     completeCases <- complete(directory, id = 1:332)
     completeIDs <- completeCases[completeCases$nobs > threshold, "id"]
     
     # Empty correlation vector
     corVector <- vector(mode="numeric", length=0)
     
     # Return empty correlation vector if no monitors complied with threshold
     if (length(completeIDs) == 0){
          return(corVector)
     }
     
     # Create full file names with dir, fileNo and ext
     fileNo <- formatC(completeIDs, width = 3, format = "d", flag = "0")
     fileNames <- paste(paste(directory, fileNo, sep ="/"), "csv", sep = ".")
     
     # Iterate monitors and calc correlation, append to corVector
     for (aFileName in fileNames){
          fileData <- read.csv(aFileName)
          # Extract non-na data for both pollutants
          fileData <- fileData[complete.cases(fileData$sulfate, fileData$nitrate), c("sulfate", "nitrate")]
          corVector <- append(corVector, cor(fileData$nitrate, fileData$sulfate))
     }

     corVector
}
