# Testing different cases

# Load functions
source("complete.R")
source("corr.R")

cr <- corr("specdata", 150)
head(cr)
summary(cr)

cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)

cr <- corr("specdata")
summary(cr)
length(cr)


source("submitscript1.R")
submit()
