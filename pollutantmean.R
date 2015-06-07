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
     ## NOTE: Do not round the result!
     
     # Prepend id with zeros for getting fixed width 3
     fileNo <- formatC(id, width = 3, format = "d", flag = "0")
     
     # Build full filenames by combining directory, fileNo and extension
     fileNames <- paste(paste(directory, fileNo, sep ="/"), "csv", sep = ".")
     
     # Iterate all files, add non-na data to meansVector
     meansVector <- vector(mode="numeric", length=0)
     
     for (aFileName in fileNames){
          # Read csv file
          fileData <- read.csv(aFileName)
          # Extract non-na data for given pollutant
          fileData <- fileData[!is.na(fileData[, pollutant]), pollutant]
          
          # Add to meanVector iff contributing 
          if (length(fileData) == 0) 
          {
               next
          }
          
          meansVector <- append(meansVector, fileData)
     }
     
     # Return the mean of the pollutant across all given monitors
     if (length(meansVector) > 0) 
     {
          mean(meansVector)
     }
     else 
     {
          NA
     }
}