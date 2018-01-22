#date is reped by Date class, time is represented by POSIXct or the POSIXlt class
# dates are stored internally as # of days since 1970-01-01
# time are stored internally as # of seconds since 1970-01-01
 x<- as.Date("1970-01-01")
x 
unclass(x)
x<- as.Date("1970-01-02")
unclass(x)
x+3
class(x)

y<-Sys.time()
y
p<-as.POSIXlt(y)
names(unclass(p))
unclass(p)
p$sec
 y2<-Sys.time()
y2 
p2<-unclass(y2)
p2$sec
p3<-as.POSIXlt(y2)
p3$sec

datestring<-c("January 10, 2012 10:40", "December 9, 2011 9:10")
x<-strptime(datestring, "%B %d, %Y %H:%M")
x
class(x)


x<- as.Date("1970-01-02")
y<- Sys.time()
x-y
as.POSIXlt(x) -y


x<- as.Date("2012-03-01")
y<- as.Date("2012-02-28")
z<- as.Date("2012-03-02")
x-y
z-x

ints<-sample(10) 
ints
ints>5
which(ints>7)  # return a vector of index that meet the condition) )
any(ints >7)
all(ints>7)

f <- function(x) {
    g <- function(y) {
        y + z
    }
    z <- 4
    x + g(x)
}
z<-10
f(3)