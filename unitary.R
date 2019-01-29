den <- function(f){ return (f[["den"]])}
num <- function(f){ return (f[["num"]])}

sums <- function(target, numVals, minDen=1, first=FALSE){
	## print(c(target, numVals, minDen))
	if (numVals==1){
		if ((den(target) < minDen) || (num(target)>1))
			return(NULL)
		return(as.vector(den(target)))
	}
	minDen <- pmax(minDen 
		, 1+floor(den(target)/num(target))
	)
	maxDen <- floor(numVals*den(target)/num(target))
	## print(c(target, numVals, minDen, maxDen))
	if (minDen>maxDen) return(NULL)
	l <- list()
	lc <- 0
	for (d in minDen:maxDen){
		new <- sub(target, c(num=1, den=d))
		for (v in sums(new, numVals-1, minDen=d+1, first)){
			lc <- lc+1
			l[[lc]] <- c(d, v)
		}
		if(length(l) > 0 && first) return(l)
	}
	if (length(l) == 0) return(NULL)
	return(l)
}

sub <- function(x, y){
	share <- gcd(den(x), den(y))
	n <- (den(y)*num(x) - den(x)*num(y))/share
	d <- den(y)*den(x)/share
	s <- gcd(n, d)
	return(c(
		num = n/s
		, den = d/s
	))
}

gcd <- function(x, y){
	if (x==0) return(y)
	return(gcd(y%%x, x))
}

print(sums(c(num=3, den=14), 3))
print(sums(c(num=3, den=14), 3, first=TRUE))
## length(sums(c(num=3, den=14), 4))
## length(sums(c(num=1, den=1), 1))
