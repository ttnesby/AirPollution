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

     # Prepend id with zeros for getting fixed width 3
     fileNo <- formatC(id, width = 3, format = "d", flag = "0")
     
     # Build full filenames by combining directory, fileNo and extension
     fileNames <- paste(paste(directory, fileNo, sep ="/"), "csv", sep = ".")
     
     # Iterate all files, add non-na data to nobsVector
     nobsVector <- vector(mode="integer", length=0)
     
     for (aFileName in fileNames){
          # Read csv file
          fileData <- read.csv(aFileName)
          # Extract non-na data for both pollutants
          fileData <- fileData[complete.cases(fileData$sulfate, fileData$nitrate), ]
          # Append to 
          nobsVector <- append(nobsVector, nrow(fileData))
     }
     # Create data.frame
     data.frame(id = id, nobs = nobsVector)
}