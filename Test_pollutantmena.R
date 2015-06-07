# Directory hosting files
dirFiles <- "Dropbox/Coursera/R Programming/Week2/PExercise/specdata"

# Testing different cases

pollutantmean(dirFiles, pollutant = "sulfate", id = 98:102)
pollutantmean(dirFiles, pollutant = "nitrate", id = 98:102)

pollutantmean(dirFiles, pollutant = "sulfate", id = 47)
pollutantmean(dirFiles, pollutant = "nitrate", id = 47)

pollutantmean(dirFiles, pollutant = "sulfate")
pollutantmean(dirFiles, pollutant = "nitrate")

