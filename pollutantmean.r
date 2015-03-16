pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".

  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ## Add full names of files to object
  files_list <- list.files(directory, full.names=TRUE)
  
  ##Create data fram with all data
  dat <- data.frame()
  for(i in id){
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  
  ##Calculate mean of data for pollutant
  mean(dat[, pollutant], na.rm=TRUE)
}
  
