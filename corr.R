
corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        filesc <- list.files(directory)
        corr <- numeric(0)
        
        for (i in 1:length(filesc)) {
                data <- read.csv(file.path(getwd(),directory, filesc[i]))
                data <- data[complete.cases(data),]
                if (nrow(data) >= threshold) {
                        corr <- c(corr,cor(data["sulfate"], data["nitrate"]))
                }
        }
        
        corr
}