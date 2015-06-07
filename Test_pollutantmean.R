# Testing different cases

source("pollutantmean.R")

pollutantmean("specdata", pollutant = "sulfate", id = 98:102)
pollutantmean("specdata", pollutant = "nitrate", id = 98:102)

pollutantmean("specdata", pollutant = "sulfate", id = 47)
pollutantmean("specdata", pollutant = "nitrate", id = 47)

pollutantmean("specdata", pollutant = "sulfate", id = 291:294)
pollutantmean(dirFiles, pollutant = "nitrate", id = 291:294)

pollutantmean("specdata", pollutant = "sulfate")
pollutantmean("specdata", pollutant = "nitrate")

pollutantmean("specdata", "sulfate", 1:10)

#source("submitscript1.R")
#submit()