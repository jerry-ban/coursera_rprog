setwd("D:/repos/coursera_rprog")
list.files("Assignment3-data", full.names = TRUE)
data1<-read.csv("Assignment4-data/hospital-data.csv")
outcome<-read.csv("Assignment4-data/outcome-of-care-measures.csv")
head(outcome)
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])

str(outcome)
best("SC", "heart attack")
