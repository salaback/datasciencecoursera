complete <- function(directory, id = 1:332) {
  
  ## Load the full data
  
  dat <- list.files(directory, full.names=TRUE)
  
  ##create data frame with id and nobs
  dat_frame <- data.frame(id = integer(), nob = integer())
  
  ##loop through files to count nobs
  for(i in id){
    ##load file
    file <- read.csv(dat[i])
    
    #Create complete cases vector
    complete <- complete.cases(file)
    
    ##Count nobs
    count <- 0
    for(comp in complete){
      if(comp==TRUE){
        count <- count + 1
      }
        
    }  
    ##save to data frame
    new_row <- data.frame(i, count)
    dat_frame <- rbind(dat_frame, new_row)
  }
  
  ##return data frame
  dat_frame
}