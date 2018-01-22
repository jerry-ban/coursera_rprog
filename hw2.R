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

z<-5
while(z>=3 && z<=10){
  coin<- rbinom(1,1,0.5)
  if(coin ==1){ 
    z<-z+1
  } else{
    z<-z-1
  }
  print(z)
  
}

numeric(3)
integer(4)

args(lm)

myplot <- function(x,y,type ="l", ...){
    plot(x,y, type = type, ...)
}

#generic function
mean
args(paste)
args(cat)
paste(1,2,3, sep = ":")

lm <- function (x){ x*x}
search()
library()
# R uses lexical scoping or static scoping, a common alternative is dynamic scoping
#how local variable, formal argument, and the free variable evaluated
make.power<-function(n){
  pow<-function(x){
    x^n
  }
  pow
}

cube<-make.power(3)
square<-make.power(2)
cube(9)
ls(environment(cube))
get("n", environment(cube))


