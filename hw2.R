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
 
