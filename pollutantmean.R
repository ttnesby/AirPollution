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
     
     # Iterate all files, calc mean for each file and summarize means
     sumMeans <- 0
     
     for (aFileName in fileNames){
          sumMeans <- sumMeans + mean((read.csv(aFileName)[, pollutant]), na.rm = TRUE)
     }
     
     # Return the total mean of the pollutant across all given monitors
     sumMeans/length(fileNames)
}