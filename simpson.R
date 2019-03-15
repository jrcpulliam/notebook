
mini <- 100
seed <- 100

set.seed(seed)

sExact <- function (com){
	c <- com/sum(com)
	return(1/(sum(c^2)))
}

sApp <- function(samp){
	
}

cSamp <- function(com, n){
	sp <- sample(1:length(com), size=n, prob=com, replace=TRUE)
	tab <- table(sp)
	return(as.vector(tab))
}

com1 <- c(1, 1, 1, 1)
com2 <- c(1, rep(1/(mini-1), mini))

print(cSamp(com2, 20))
