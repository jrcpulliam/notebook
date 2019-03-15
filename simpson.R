
mini <- 100
seed <- 100

set.seed(seed)

sExact <- function (com){
	c <- com/sum(com)
	return(1/(sum(c^2)))
}

sApp <- function(samp){
	n <- sum(samp)
	return(1/(
		sum((samp/n)*((samp-1)/(n-1)))
	))
}

cSamp <- function(com, size){
	sp <- sample(1:length(com), size=size, prob=com, replace=TRUE)
	tab <- table(sp)
	return(as.vector(tab))
}

appRange <- function(com, size, reps){
	app <- numeric(reps)
	for (i in 1:reps){
		app[[i]] <- sApp(cSamp(com, size))
	}
	return(app)
}

com1 <- c(1, 1, 1, 1)
com2 <- c(1, rep(1/(mini-1), mini))

print(mean(appRange(com1, 10, 1000)))
print(mean(appRange(com2, 10, 1000)))

