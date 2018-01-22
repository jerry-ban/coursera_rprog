
### a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data from the directory specified in the 'directory' argument and returns the mean of the pollutant across all of the monitors, ignoring any missing values coded as NA
pollutantmean<-function(directory, pollutant, id=NULL){
    #directory <- "specdata"
    #id<- 1:10
    #pollutant<-"sulfate"
    file_full_names <- c()
    if(is.null(id)){
        file_full_names <-list.files(directory, full.names = TRUE)
    } else{
        counter <-0
        for(i in id){
            counter<-counter+1
            i_str<-paste("000",i, sep="")
            monitor <- substr(i_str,nchar(i_str)-3+1,nchar(i_str))
            file_name <- paste(directory,"/", monitor,".csv",sep="")
            file_full_names[counter]<-file_name
        }
    }
    
    data <- data.frame()
    for(file_name in file_full_names)
    {   
        data <-rbind(data, read.csv(file_name))
        
    }    
    mean(data[[pollutant]], na.rm = TRUE)
}
