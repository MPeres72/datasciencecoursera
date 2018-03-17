complete <- function(directory, id = 1:332) {
  
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
  
        ## 'id' is a integer vector indicating the monitor ID numbers
        ## to be used
        
        ## the archives' directory must be in the Worckdirectory
        dir <- paste(getwd(),"/",directory,"/",sep="")
        casesob <- data.frame()
        
        ## read the files, clean the NA data and put the lectures in the consolidated 
        ## vector totme
        for (i in id) {
            casefile <- read.csv(paste(dir, sprintf("%03d",i),".csv",sep=""))
            condtst <- ((!is.na(casefile["nitrate"]) & (!is.na(casefile["sulfate"]))))
            vetnovo <- subset(casefile,condtst)
            totfilecases <- data.frame("id" = i, "nobs" = nrow(vetnovo))
            casesob <- rbind(casesob, totfilecases)
        }  
        return(casesob)
        
}
