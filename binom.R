library(tidyverse); theme_set(theme_bw())

set.seed(7082)
numSims <- 1e4
n <- 10
prob <- 0.27

## Sim
dat <- rbinom(numSims, n, prob)

## Analyze
## The way to get good CI is unfortunately from two-sided tests
## My head hurts!
multBinom <- function(dat, prob0, n){
	df <- map_df(dat, function(d){
		bt <- binom.test(d, n, p=prob0, alternative="less")
		gt <- binom.test(d, n, p=prob0, alternative="greater")
		cp <- bt$p.value
		rp <- cp + runif(1)*(1-gt$p.value-cp)
		return(data.frame(est=d/n, cp, rp))
	})
	return(df)
}

for (prob in c(0.05, 0.3, 0.48)){
	dat <- rbinom(numSims, n, prob)
	plist <- multBinom(dat, prob, n)$rp
	print(pianoPlot(plist, tag=paste("prob=", prob)))
}

