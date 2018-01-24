
library(dplyr)
#source("rankhospital.R")
rankhospital <- function(state, outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    #rankhospital("MD", "heart attack", "worst")
    #state<- "TX"
    #outcome <- "heart failure"
    #num <- 4
    
    rdata<-read.csv("Assignment3-data/outcome-of-care-measures.csv", stringsAsFactors = FALSE)
    
    
    all_states <- unique(rdata$State)
    if(!is.element(state, all_states)){
        stop("invalid state")
    }
    
    outcome_new <- paste(strsplit(tolower(outcome),"[., ]")[[1]],collapse="")
    outcome_new <-paste(c("hospital30daydeathmortalityratesfrom", outcome_new), collapse = "")
    outcome_new
    col_names <- names(rdata)
    col_names
    col_names_new<- sapply(as.list(col_names), function(x) { paste( strsplit( tolower(x),"[.]")[[1]] , collapse="")} )
    col_names_new
    col_count <- length(col_names)
    #col_find_outcome<-sapply(as.list(col_names_new), function(x) grepl(outcome_new, x))
    col_find_outcome<-sapply(as.list(col_names_new), function(x) outcome_new==x)
    if(sum(col_find_outcome)<1){
        stop("invalid outcome")
    }
    sum(col_find_outcome)
    col_find_death<-sapply(as.list(col_names_new), function(x) grepl("death", x))
    sum(col_find_death)
    col_ids <- 1:col_count
    col_data <- data.frame(col_names, col_names_new, col_find_outcome,col_find_death, col_ids)
    #str(col_data)
    #head(col_data)
    
    find_col<- col_data[which(col_data$col_find_outcome & col_data$col_find_death),]
    find_col
    col_id <-find_col$col_ids[1]
    col_id
    hospital_name_id <-grep("Hospital.Name", colnames(rdata))
    #str(hospital_name_id)
    sdata <- rdata[which(rdata$State==state & rdata$State == state),  ]
    sdata[,col_id] <- suppressWarnings(as.numeric(as.character(sdata[,col_id])))
    summary(sdata)
    
    final_data <- sdata[,c(hospital_name_id,col_id)]
    summary(final_data)
    
    result <- final_data[order(final_data[,2], final_data[,1]), ]
    #rdata[,"Hospital.Name"] <- as.character(rdata[,"Hospital.Name"])
    #head(result)
    #tail(result)
    
    result_cleaned <- result[complete.cases(result),]
    #str(result_cleaned)
    tail(result_cleaned)
    true_length <-nrow(result_cleaned)
    #rdata[,"Hospital.Name"] <- as.character(rdata[,"Hospital.Name"])
    if(tolower(as.character(num))=="best")
    {
        result[1,1]    
    }
    else if (tolower(as.character(num))=="worst")
    {
        result[true_length,1]
    }
    else if(num <= true_length)
    {
        result[num,1]
    }
    else
    {
        myresult<-NA
        myresult
    }
    
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## r
}