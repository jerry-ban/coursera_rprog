


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
