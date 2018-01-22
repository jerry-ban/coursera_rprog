#  if else
if(TRUE){
    ##
} else if(FALSE){
  ##
} else{
  ##
}
x<-5
y<-if(x>3){TRUE} else {FALSE}

y
#  for
x<-c("a","b","c","d")
for(i in 1:4) {
  print(x[i])
}
for(i in 1:4) print(x[i])

seq_len((10))
seq_along(2:10)
for (i in seq_along(x)){
  print(x[i])
}
for (letter in x){
  print(letter)
}
#  while
#  repeat : execute an inlinite loop
#   break : break a loop
#   next : skip the  iteration of a loop
#   return: exit a function
 set.seed(1)
 normals<-rnorm(100,1,2)
normals
summary(normals)
sd(normals)

x<-seq(1.7,1.9, len=11)
y<- sapply(x, function(y){y*y})
y
plot(x, exp(-(y-min(y))),type = "l")
