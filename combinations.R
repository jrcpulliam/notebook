library(gtools)

uniComb <- function(v, r){
	f <- as.factor(v)
}

combs <- function(vals, lengths, l=NULL){
	if(is.null(l)) l <- rep(NA, sum(lengths))
	stopifnot(length(lengths)==length(vals))
	fill <- (1:length(l))[is.na(l)]
	stopifnot(length(fill)==sum(lengths))

	if(length(lengths)==1){
		l[fill] <- vals[[1]]
		return(l)
	}
	places <- combinations(length(fill), lengths[[1]])
}

combs(c(1, 10), c(2, 3))
