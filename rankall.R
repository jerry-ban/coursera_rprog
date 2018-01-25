
library(dplyr)
#source("rankhospital.R")
rankall <- function(outcome, num = "best") {
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with the given rank
    ## 30-day death rate
    #rankhospital("MD", "heart attack", "worst")
    #state<- "TX"
    #outcome <- "heart attack"
    #num <- 20
    
    rdata<-read.csv("Assignment3-data/outcome-of-care-measures.csv", stringsAsFactors = FALSE)
   
    all_states <- unique(rdata$State)
    all_states <- all_states[order(all_states)]
    
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
    state_col_id <-grep("State", colnames(rdata))
    sdata <- rdata # rdata[which(rdata$State==state & rdata$State == state),  ]
    sdata[,col_id] <- suppressWarnings(as.numeric(as.character(sdata[,col_id])))
    summary(sdata)
    
    final_data <- sdata[,c(hospital_name_id,col_id,state_col_id)]
    summary(final_data)
    
    result <- final_data[order(final_data[,3], final_data[,2], final_data[,1]), ]
    #result_cleaned <- result[complete.cases(result),]
    result_cleaned <- result
    
    result2 <- data.frame()
    candidates<- split(result_cleaned[,c(3,1,2)], result_cleaned$State)
    candidates
    # convert list to dataframe
    # df <- data.frame(matrix(unlist(l), nrow=132, byrow=T),stringsAsFactors=FALSE)
    
    getCompleteCases<- function(x, num){
        class(x)
        state_name<-x[1,1]
        state_name
        xd<-x
        #xa <- xd[ xd[,3]== min(xd[,3],na.rm=TRUE),]
        xa<-xd[order(xd[,3], xd[,2], xd[,1]), ]
        xa
        xb<-xa[complete.cases(xa),]
        xb
        if(nrow(xa) <1){
            xa[1,] <- c(state_name,NA,NA)
        }
        colnames(xa)<-c("state", "hospital", "score")
        true_length = nrow(xa)
        if(tolower(as.character(num))=="best")
        {
            xb<-xa[1,]
        }
        else if(tolower(as.character(num))=="worst")
        {
            xb<-xa[true_length,]
        }
        else if(num<=true_length)
        {
            xb <- xa[num,]
        }
        else
        {
            xb<-data.frame("state"=c(state_name),"hospital" =c(NA), "score" = c(NA) )
        }
        row.names(xb) <- c(state_name)
        xb
    }
    
    
    final_candidates<- lapply(candidates, function(x) {  getCompleteCases(x, num) } )
    final_candidates
    result <-data.frame()
    for( x in final_candidates)
    {
        result <- rbind(result, x[1,])
        
    }
    final_result <- result #lapply( final_candidates, function(x, result) rbind(result, x[[1]]))

    summary(final_result)
    
    aa<-final_result#[order(c("State","Hospital.Name"),]
    
    #rdata[,"Hospital.Name"] <- as.character(rdata[,"Hospital.Name"])
    #head(result)
    #tail(result)
    aa
    
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## r
}
