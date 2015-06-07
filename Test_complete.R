# Source the function

source("complete.R")

complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 1:10)
complete("specdata")

source("submitscript1.R")
submit()

