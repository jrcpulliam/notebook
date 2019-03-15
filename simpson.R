
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

r1 <- appRange(com1, 40, 1000)

r2 <- appRange(com2, 40, 1000)

print(mean(r1))
print(mean(r2))

print(mean(1/r1))
print(mean(1/r2))

print(hist(1-1/r1, main="Even", xlab="index"))
print(hist(1-1/r2, main="Uneven", xlab="index"))

print(hist(r1, main="Even", xlab="diversity"))
print(hist(r2, main="Uneven", xlab="diversity"))
