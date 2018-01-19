data<-read.csv("hw1_data.csv")
head(data)
data[47,]
dim(data)
p <-complete.cases(data$Ozone)
a<-data$Ozone
a[p]
mean(a[p])
data[,"month"==5]

ed_exp3 <- data[which(data$Ozone >31, data$Temp>90)]

ex1 <-data[data$Ozone >31,]
ex2 <-ex1[ex1$Temp>90,]
p1 <-complete.cases(ex2$Solar.R)
p1
mean(ex2$Solar.R[p1])
ex2


ex3 <-data[data$Month ==6,]
mean(ex3$Temp)

ex4 <-data[data$Month ==5,]
p4<-complete.cases(ex4$Ozone)
ex4$Ozone[p4]


install.packages("swirl")
install.packages("dplyr")

if(!require(installr)) {
  install.packages("installr"); 
  require(installr)
}
updateR()


list.files("diet_data")
andy<-read.csv("diet_data/Andy.csv")
head(andy)
tail(andy)
length(andy)
dim(andy)
length(andy$Age)
summary(andy)
str(andy)
names(andy)

andy[1,"Weight"]
andy[30, "Weight"]

andy[which(andy$Day ==30),"Weight"]
subset(andy$Weight, andy$Day >25)
subset(andy, andy$Day >20)

andy_start <- andy[1, "Weight"]
andy_end <- andy[30, "Weight"]
andy_loss <- andy_start - andy_end
andy_loss
files <-list.files("diet_data")
files
files[3]
head(read.csv(files[3]))
files_full <-list.files("diet_data", full.names = TRUE)
head(read.csv(files_full[3]))

andy_david <- rbind(andy, read.csv(files_full[2]))
andy_david
andy_david[which(andy_david$day == 25),]
for(i in 1:5) {print (i) }
dat <-data.frame()
for (i in 1:5){
  dat<- rbind(dat, read.csv(files_full[i]))
}
dat

median(dat$Weight)
median(dat$Weight, na.rm=TRUE)
dat_30 <- dat[which(dat[, "Day"] == 30),]
dat_30
median(dat_30$Weight)

summary(files_full)
tmp <- vector(mode = "list", length = length(files_full))
tmp

for (i in seq_along(files_full)) {
  tmp[[i]] <- read.csv(files_full[[i]])
}
str(tmp)

output <- do.call(rbind, tmp)
str(output)
summary(output)
dim(output)

tmp2 <- vector(mode = "list", length = length(files_full))
tmp2 <- lapply(files_full, read.csv)
tmp2

