file_names <-list.files("Assignment3-data", full.names = TRUE)

object.size(plants)
names(plants)
table(plants$Active_Growth_Period) # show how many time each value of a factor/categorical variable

flips<- sample(c(0,1), 100, replace=TRUE, prob=c(0.3,0.7))
#an unfair two-sided coin with  0.3 probability of 'tails' and a 0.7 for  'heads',
# draw sample of size 100 from the vectorc(0,1), with prob parameter = c(0.3,0.7),
# in the vector, the 1st is tails, and 2nd is the heads

rbinom(1, size=100, p=0.7) # number of success in trials, here heads, 100 times, and prob of success
my_pois<-replicate(100, rpois(5,10)) # simulate 100 groups of random numbers, 
# each group has 5 poisson dist with mean 10
cm<-colMeans(my_pois)
hist(cm)


#base graphics
data(cars)
summary(cars)
plot(cars)
plot(dist ~ speed, cars)
plot(x=cars$speed, y=cars$dist, xlab="Speed", ylab="Stopping Distance")
plot(cars, main="title", sub="sub title", col=2) #color is red
plot(cars, xlim = c(10,15)) #limiting the x-axis to 10 through 15. 
plot(cars, pch=2) # change dot shape to triangle

data(mtcars)
#  tilde ("~") 
boxplot(mpg~cyl, mtcars)

