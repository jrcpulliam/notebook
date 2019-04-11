library(ggplot2)

set.seed(444332)

reps <- 5e2
dmax <- 4
reps <- 5e3
dmax <- 20

mu <- function(D){
	return(((min(D) + median(D))/max(D))-1)
}

msamp <- function(dim, rfun){
	if(dim==Inf){
		bl <- abs(rfun(4))
		D <- c(bl[[1]]+bl[[3]]
			, bl[[1]]+bl[[4]]
			, bl[[3]]+bl[[4]]
		)
	}
	else{
		vm <- matrix(rfun(3*dim), nrow=3)
		D <- as.vector(dist(vm))
	}
	return(mu(D))
}


msim <- function(dim, reps, rfun=rnorm){
	return(sapply(1:reps, function(r){
		return(msamp(dim, rfun))
	}))
}

mcurve <- function(dmax, reps, rfun=rnorm){
	lc <- sapply(c(1:dmax, Inf), function(d){
		s <- msim(d, reps, rfun)
		return(c(d=d, m = mean(s), σ=sd(s)))
	})
	lc <- as.data.frame(t(lc))
	return(lc)
}

print(msamp(4, rnorm))

ndat <- mcurve(dmax, reps)
cdat <- mcurve(dmax, reps, rcauchy)

print(ndat)
print(cdat)
