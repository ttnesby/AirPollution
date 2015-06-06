# Test reading files

# Directory hosting files
dirFiles <- "Dropbox/Coursera/R Programming/Week2/PExercise/specdata"

# Which files to read and prepend zeros
fileNo <- 98:102
fileNo <- formatC(fileNo, width = 3, format = "d", flag = "0")

# File extension
ext <- "csv"

# Combine directory, files and extension
fileNames <- paste(paste(dirFiles, fileNo, sep ="/"), ext, sep = ".")

pollutant <- "sulfate"

# Read CSV and summarize the means for each

sumMeans <- 0

for (aFileName in fileNames){
     sumMeans <- sumMeans + mean((read.csv(aFileName)[, pollutant]), na.rm = TRUE)
}

totalMean <- sumMeans/length(fileNames)

pollutantmean(dirFiles, pollutant = "sulfate", id = 98:102)
pollutantmean(dirFiles, pollutant = "nitrate", id = 98:102)

pollutantmean(dirFiles, pollutant = "sulfate", id = 47)
pollutantmean(dirFiles, pollutant = "nitrate", id = 47)

pollutantmean(dirFiles, pollutant = "sulfate")
pollutantmean(dirFiles, pollutant = "nitrate")
