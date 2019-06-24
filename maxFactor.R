factor <- function (num, m=2, l=NULL){
	if (num==1) return (l)
	can <- m:pmax(2, floor(sqrt(num)))
	fac <- which(num%%can == 0)
	if (length(fac)==0) return(c(l, num)) 
	f <- can[[min(fac)]]
	return(factor(num/f, f, c(l, f)))
}

maxFactor <- function(x){
	return(max(factor(x)))
}

start <- 2
stop <- 1e4
ran <- start:stop
m <- numeric(length(ran))

for (r in ran){
	mf <- maxFactor(r)
	m[[1+r-start]] <- mf
}

hist(m)
hist(log(m))
median(m)
factor(median(m))
plot(ran, m, log="", type="l")
