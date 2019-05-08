set.seed(2134)

wait <- function(st, p=0.5){
	st <- as.integer(st)
	stopifnot(identical(0*st, st*(1-st)))
	l <- length(st)
	v <- rbinom(l, 1, p)
	i <- l
	while (!isTRUE(all.equal(st, v))){
		i <- i+1
		v <- c(v[-1], rbinom(1, 1, p))
	}
	return(i)
}

multWait <- function(st, p=0.5, reps=1e4){
	return(replicate(reps, wait(st, p)))
}

print(mean(multWait(c(1, 1, 1), p=1/3)))
print(mean(multWait(c(1, 1, 1, 0), p=1/3)))
print(mean(multWait(c(0, 1, 1, 1, 0), p=1/3)))
