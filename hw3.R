library(datasets)
data(iris)

dim(subset(rdata, State == "NJ" | State == "NY"))

as.character(subset(r, state == "NJ")$hospital)

apply(iris[,1:4], 2,  mean)

data("mtcars")
tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)
with(mtcars,tapply(mpg, cyl, mean))
head(mtcarsunde)
undebug(ls)


makeVector <- function(x = numeric()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmean <- function(mean) m <<- mean
    getmean <- function() m
    list(set = set, get = get,
         setmean = setmean,
         getmean = getmean)
}

cachemean <- function(x, ...) {
    m <- x$getmean()
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$get()
    m <- mean(data, ...)
    x$setmean(m)
    m
}

