getwd()
setwd("c:/_research/coursera_rprog")

as.integer("1")
as.complex(1+2i)
as.logical((1))

x<-c(1+2i, 3-0i)
x<-vector("numeric", length =10)
y<-c(1.7, "a")
y

lx <- list(1, "a", TRUE, 2-1i)
lx

m<- matrix(nrow=2, ncol=3)
m
dim(m)
dimnames(m)
attributes(m)

m<-1:10

x<-1:3
y = 10:12
cbind(x,y)
rbind(x,y)


xf <- factor(c("yes","yes","no","yes","no"))
xf
table(xf)
unclass(xf)

xf <- factor(c("yes","yes","no","yes","no"), levels = c("yes", "no"))
xf

xf <- factor(c(5,5,2,3), levels = c(5,3,2))
xf


dim(m)<- c(2,5)
m

x <- c(1,2,3)
x <- 1:3
x<-c(TRUE, FALSE)  #
c(x %in% 1:5)

is.na(NAN)
is.nan(NaN)


aa<- data.frame(foo=1:4, bar=c(T,T,F,F))
aa
nrow(aa)
ncol(aa)


names(x)<-c("foo", "bar", "norf")
x

y<-list(a=1,b=2,c=3)
y

m <-matrix(1:6, nrow=2, ncol=3)
dimnames(m) <- list(c("r1","r2"), c("c1","c2","c3"))
m


read.table(), read.csv()#read tabular data
readLines() #read test file
source() # for reading R code file(multi objects in it), inverset of dump
dget() # for reading R code file(one object in it), inverse of dput
load() #for reading in saved workspaces binary
unserialize() #for reading single R objects in binary format

write.table() 
writeLines()
dump ()  # parse multiple objects to file
dput() #parse one object to file
save()
serialize()

#read.tables() parameters:
file, header, sep,  colClasses, nrows, comment.char, skip, 
stringsAsFactors

#small data
data<-read.table("foo.txt")

#iMB == 2^20 bytes
# if large data with read.table,  if data requires memory > RAM, stop here
# set comment.char = "" if no commented lines in file
# READ help info about the command
# use colClasses
initial <- read.table("bigdatatable.txt", nrows =100)
classes <- sapply(initial, class)
tabAll <- read.table("bigdatatable.txt", colClass = classes)

#**Textual Formats**
#dump and dput preserve the metadata, to another user
#doesn't have to specify'it all over again

# another to pass data around is parsing R object with dput then reading it back with dget
y<-data.frame("a" = c(1,10), b=c(2,20))
y 
dput(y)
dput(y, file = "y.R")
new.y <-dget("y.R")
new.y

x<- "foo"
y<-data.frame(a=1, b="a")
dump(c("x", "y"), file = "test_dump_data.R")
rm(x,y)
source("test_dump_data.R")
y


#**** INterfaces to outside 
# file, gzfile, bzfile, url
str(file)
# open parameters "r", "w", "a", "rb","wb", "ab" b means binary

conn <- file("y.txt", "r")
data<-read.csv(conn)
close(conn)

#act the same as below
data<-read.csv("y.txt")


conn <-gzfile("words.gz")
x<-readLines(conn,10)
#read 10 lines

con<-url("http://www.jhsph.edu", "r")
x<-readLines(con)
head(x)
close(con)


#*****subsetting
# [ : return an object(s) of the same class
# [[ : extract elements of a list or a data frame. 
# $ : to extract elements of a list or data frame by name
x<- c("a","b","c","c","d","a", "b")
x[1]
x{1:4]
x[c(1,2,5)]
x[x>"b"]
x>"b"
x[c(FALSE, FALSE,  TRUE,  TRUE,  TRUE, FALSE, FALSE)]



x<-list(foo =1:4, bar = 0.6, baz = "hello")
x[1]
x$foo
x[[1]]
x[["foo"]]

# to extract multiple
x[c(1,3)]
x[c("foo", "baz")]

elemName <-"foo"
x[[elemName]]

x <-list(list(10,12,14), c(1.3, 4.6))
x[[c(1,2)]]
x[[1]][[2]]


x<- matrix(1:6, 2,3)
x
x[1,3]
x[1,]
x[1, c(2,3)]
x[,2]

x[1,3]  #return vector
x[1,3, drop = FALSE]  # return matrix

x[1,] #return vector
x[1,, drop=FALSE] #return matrix


#****partial Matching***********#  with $ or [[ with exact =FALSE
x<-list(aardvark = 1:5)
x$a
x[["a"]]
x[["a", exact = FALSE]]



#******removing NA values *************#
x<- c(1,2,NA, 4,NA,5)
bad<-is.na(x)
x[!bad]

x<- c(1,2,NA, 4,NA, 6)
y<-c("a", "b", NA, "d", NA, "f")
z<- c(10,20,NA, NA,NA, NA)
x
y
good <-complete.cases(x,y)
good
x[good]
good2 <-complete.cases(x,y,z)
good2
x[good2]


m <- cbind(x,y,z)
m
good3 <- complete.cases(m)
good3
m[good3]
m[good3,]


#****vectorized operations*********#
x<-1:5
y<-5:1
x*y
x/y
x>y

x<-matrix(1:4, 2,2)
y <- matrix(10, 2,2)
x
y
x*y

x%*% y
