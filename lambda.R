set.seed(444332)
reps <- 5e3

euclid <- function(v1, v2){
	return(sqrt(mean((v1-v2)^2)))
}

lam <- function(vlist){
	D <- sapply (2:4, function(first){
		other <- vlist[-c(1, first)]
		return(euclid(vlist[[1]], vlist[[first]]) 
			+ euclid(other[[1]], other[[2]])
		)
	})
	return((max(D)-median(D))/min(D))
}

lsamp <- function(dim){
	vl <- list()
	for(i in 1:4){
		vl[[i]] <- rnorm(dim)
	}
	return(lam(vl))
}

lsim <- function(dim, reps){
	return(sapply(1:reps, function(r){
		return(lsamp(dim))
	}))
}

for (d in 1:12){
	s <- lsim(d, reps)
	print(c(m = mean(s), σ=sd(s)))
	## print(hist(s))
}


