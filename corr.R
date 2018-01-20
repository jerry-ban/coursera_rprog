
### a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0.
corr<- function(directory, threshold = 0){
    #directory <- "specdata"
    #threshold <- 150
    file_full_names <-list.files(directory, full.names = TRUE)
    
    corrs <- c()
    valid_count <- 0L
    
    for(filename in file_full_names){
        mydata <- data.frame()
        mydata <- read.csv(filename)
        yes_no<-complete.cases(mydata)
        nobs<-sum(yes_no)
        
        is_valid <- nobs>threshold
        
        if(is_valid){
            valid_count<- valid_count+1L
            data_ok <- mydata[yes_no,]
            corrs[valid_count]<-cor(data_ok$sulfate, data_ok$nitrate )
        }
        
    }
    
    corrs
}