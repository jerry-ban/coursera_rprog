library(dplyr)
best <- function(state, outcome) {
    state<- "TX"
    outcome <- "heart attact"
    rdata<-read.csv("Assignment3-data/outcome-of-care-measures.csv")
    all_states <- unique(rdata$State)
    if(!is.element(state, all_states)){
        warning("invalid state")
        stop()
    }
    sdata <- rdata[which(rdata$State==state & rdata$State == state),]
    tapply(sdata[,11], sdata$Hospital.Name, min)
    sdata[[outcome]]
    ## Read outcome data
    ## Check that state and outcome are valid
    ## Return hospital name in that state with lowest 30-day death
    ## r
}
str(sdata)
head(sdata)
