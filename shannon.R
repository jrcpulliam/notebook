reps <- 1e4
wts <- 1:10
size <- 10

shannon <- function(wts){
	wts <- wts[wts>0]
	wts <- wts/sum(wts)
	return(-sum(wts*log(wts)))
}

subshannon <- function(s){
	s <- s[s>0]
	N <- sum(s)
	return(-sum((s/N)*(digamma(s)-digamma(N))))
}

sampshannon <- function(wts, size){
	samp <- sample(1:length(wts), size=size, prob=wts, replace=TRUE)
	swts <- as.vector(table(samp))
	return(subshannon(swts))
}

r <- replicate(reps, sampshannon(wts, size))
print(mean(r))
print(shannon(wts))
