
### a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA
pollutantmean<-function(directory, pollutant, id){
    #directory <- "specdata"
    #id<- 1:10
    #pollutant<-"sulfate"
    #file_full_names <-list.files(directory, full.names = TRUE)
    
    data <- data.frame()
    for(i in id)
    {   i_str<-paste("000",i, sep="")
        monitor <- substr(i_str,nchar(i_str)-3+1,nchar(i_str))
        file_name <- paste(directory,"/", monitor,".csv",sep="")
        data <-rbind(data, read.csv(file_name))
        
    }    
    mean(data[[pollutant]], na.rm = TRUE)
}



### a function that reads a directory full of files and reports the number of completely observed cases in each data file. The function should return a data frame where the first column is the name of the file and the second column is the number of complete cases
complete<-function(directory, id){
    ids <- 1: length(id)
    #directory <- "specdata"
    #id<- c(2, 4, 8, 10, 12)
    nobs<-integer(length(id)) * 0
    #file_full_names <-list.files(directory, full.names = TRUE)
    mydata <- data.frame()
    for(index in ids){
        i <- id[index]
        i_str<-paste("000",i, sep="")
        monitor <- substr(i_str,nchar(i_str)-3+1,nchar(i_str))
        file_name <- paste(directory,"/", monitor,".csv",sep="")
        mydata <- read.csv(file_name)
        yes_no<-complete.cases(mydata)
        nobs[index]<-sum(yes_no)
    }
    
    data.frame(id=id, nobs =nobs )
    
}

### a function that takes a directory of data files and a threshold for complete cases and calculates the correlation between sulfate and nitrate for monitor locations where the number of completely observed cases (on all variables) is greater than the threshold. The function should return a vector of correlations for the monitors that meet the threshold requirement. If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0.
corr<- function(directory, threshold = 0){
    file_full_names <-list.files(directory, full.names = TRUE)
    mydata <- data.frame()
    corrs <- c()
    valid_count <- 0
    for(filename in file_full_names){
        mydata <- read.csv(file_name)
        yes_no<-complete.cases(mydata)
        nobs<-sum(yes_no)
        is_valid <- nobs>threshold
        valid_count<- as.integer(valid_count)+1
    }
    
    if (valid_count < 1){
        corrs <- 0
    }
}
