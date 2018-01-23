str(ls)
ls()
m<- matrix(rnorm(12), 3,4)
str(m)

library(datasets)
str(airquality)


rnorm() # simulate normal variates
dnorm() # evaluate the Normal probability density(with given mean/sd) at a point(or vector points)
pnorm() # evaluate the cumulative dist for a normal dist
rpois() # simulate random Poisson variates with given rate

# for any distribution, usually 4 function: d/r/p/q(for quantile function)

dnorm(x, mean =0, sd =1, log = FALSE)

# to simulate random number, usually need to set.seed() to reproduce same instances
set.seed(1)
rnorm(10,5,1)
rnorm(10,5,1)
set.seed(1)
rnorm(10,5,1)
rnorm(10,5,1)


rpois(10, 1) # 10 randoms, with rate 1
rpois(10, 2)
rpois(10, 10)

ppois(4,2)  # rate 2 , posb<=4

# simulate random numbers from linear model
set.seed(20)
x<-rnorm(100)
e<-rnorm(100,0,2)
y<- 0.5 + 2*x + e
summary(y)
plot(x,y)

set.seed(10)
x<-rbinom(100,2, 0.5) # n=1, p = 0.5
e<-rnorm(100,0,2)
y<- 0.5 + 2*x + e
summary(y)
plot(x,y)

set.seed(3)
x<- rnorm(100) # n=1, p = 0.5
log.mu<- 0.5 +0.3*x
y<-rpois(100,exp(log.mu))
summary(y)
plot(x,y)

# sample function
set.seed(1)
sample(1:10,4) # 4 numbers from 1:10
sample(letters, 4)
sample(1:10) # permutation
sample(1:10,replace=TRUE) # 4 numbers


# R profiler
# profiling is a systematic way to examine how much time is spend in different parts of a program, 
# it is useful when trying to optimize code, 
# oftern code runs fine once, but what if put it into a loop for 1000 iterations? still fast?
# profiling is better than guessing


system.time() # return object is class: proc_time
system.time(colMeans(data("airquality")))

system.time(readLines("http://www.sohu.com")) # elapsed time because network comm time

hilbert<-function(n){
    i<- 1:n
    1/outer(i-1,i,"+")
}
x<- hilbert(1000)

system.time(svd(x))  # 


system.time({
    n<-1000
    r<-numeric(n)
    for(i in 1:n){
        x<-rnorm(n)
        r[i] <- mean(x)
    }
})


# when not sure where to check, use Rprof, and R must be compiled wih profiler support
# summaryRprof() summarizes the output from  Rprof()(otherwise it is not readable
# default sample time is 0.02 seconds
# DO NOT use system.time() together with Rprof(), or will be sad
# 

# summaryRprof() has 2 normalizing  way: by.total and by.self

set.seed(1)
rpois(5, 2)

set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e

library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)