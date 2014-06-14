corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
 # id = 1:3
  filenames<-list.files(path = directory, pattern =".csv", full.names=TRUE)
  df = data.frame()
  fdf = data.frame()
  vcorr = numeric()
  for(i in filenames){
    fdf <-read.csv(i)
    if (sum(!is.na(fdf$nitrate) & !is.na(fdf$sulfate)) > threshold){
      vcorr <- c(vcorr,cor(fdf$nitrate, fdf$sulfate,use="pairwise.complete.obs"))
    } 
  }
  #df <- rbind(df,data.frame(id= max(fdf$ID),nobs=sum(!is.na(fdf$nitrate) & !is.na(fdf$sulfate))))
  
  vcorr
}

#c <- corr("specdata", 1)
cr <- corr("specdata", 150)
#head(cr)