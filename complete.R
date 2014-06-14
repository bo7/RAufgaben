complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  
  
  ## number of complete cases
   
  filenames<-list.files(path = directory, pattern =".csv", full.names=TRUE)
  df = data.frame()
  for(i in filenames[id]){
    fdf <- read.csv(i) 
    df <- rbind(df,data.frame(id= max(fdf$ID),nobs=sum(!is.na(fdf$nitrate) & !is.na(fdf$sulfate))))
  }
  df
  #print(max(fdf$ID))
  #print(head(fdf))
  #df <- do.call(rbind.data.frame,lapply(filenames[id], read.csv))
  #df2 <- data.frame()

}

#complete("specdata", 1)
#complete("specdata", c(2, 4, 8, 10, 12))
#complete("specdata", 30:25)
#complete("specdata", 3)

