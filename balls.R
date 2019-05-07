
n <- 1000
d <- 4
enddim <- 1.2
startdim <- 0

x <- matrix(rnorm(n*d)
	, nrow=n
)

sdist <- sort(as.vector(dist(x)))

sn <- seq(round(n^startdim), round(n^enddim)/2)
short <- sdist[sn]

## plot(short, sn)
## plot(short, log(sn))

summary(lm(log(sn)~log(short)))

