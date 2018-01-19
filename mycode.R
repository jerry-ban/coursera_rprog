myfunction <-function(){ 
	x<-rnorm(100)
	mean(x)
}


second <- function(x){
	x = rnorm(length(x))
}


weightmedian <- function(directory, day) { 
  files_list <-list.files(directory, full.names = TRUE)  
  files_count <- length(files_list)
  dat<-data.frame()
  for(i in 1: files_count){
    dat<- rbind(dat, read.csv(files_list[i]))
  }
  data_subset <- dat[which(dat[,"Day"] == day), ]
  median(data_subset$Weight, na.rm = TRUE)
}
