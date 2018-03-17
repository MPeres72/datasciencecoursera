# First Practice in the R Programming Course of Coursera

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the 
  ## mean; either "sulfate" or "nitrate"
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant lectures across all 
  ## monitors list in the 'id' vector (ignoring NA values)
  
  ## create a vector to consolidate the valid lectures
  totmeds <- vector(mode = "numeric", length = 0)
  
  ## the archives' directory must be in the Worckdirectory
  dir <- paste(getwd(),"/",directory,"/",sep="")
  
  ## read the files, clean the NA data and put the lectures in the consolidated 
  ## vector totmed
  for (i in id) {
    vettst <- read.csv(paste(dir, sprintf("%03d",i),".csv",sep=""))
    polut <- vettst[pollutant]
    toclean <- is.na(polut)
    polut <- polut[!toclean]
    totmeds <- append(totmeds,polut)
  }
  
  mean(totmeds)
  
}
