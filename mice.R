library(mice)

data <- airquality
data[4:10,3] <- rep(NA,7)
data[1:5,4] <- NA

data <- data[-c(5,6)]

tempData <- mice(data)

library(dplyr)

set.seed(1344)
numSamp <- 100

b_x <- 0.2
b_y <- -0.3
b_z <- 1

x <- rnorm(numSamp)
y <- rnorm(numSamp)
z <- rnorm(numSamp)

out <- b_x*x + b_y*y + b_z*z

## These are the complete data
## z is unmeasurable; out is the outcome variable
dat <- tibble(
	x=x, y=y, out=out
)
summary(lm(out ~ x+y, data=dat))

## Now create sets with missing data and try to impute them

censor <- function(v, d, z0, zx=0, zy=0, zout=0, seed=432){
	lo <- z0 + zx*d$x + zy*d$y + zout*d$out
	c <- rbinom(nrow(d), size=1, prob=plogis(lo))
	return(ifelse(c==1, NA, v))
}

car <- (dat
	%>% mutate(x=censor(x, dat, z0=-2))
)

summary(car)
summary(lm(out ~ x+y, data=car))

car_mice <- mice(car)

summary(car_mice)

pm <- (pool(
	with(car_mice, lm(out ~x+y))
))

class(pm)
summary(pm)

