
## This is stupid because integers will quickly get too large!

base <- function(n){
	for(i in 1:8){
		r <- 10^i
		if (r^2>n) return(r)
	}
}

splitss <- function(n){
	b <- base(n)
	x <- floor(n/b)
	y <- n%%b
	return(x^2 + y^2)
}

check <- function(n){
	stopifnot(splitss(n)==n)
	return("Yay!")
}

check(5882353)
check(94122353)

check(10100)
check(990100)
check(9901009901)
check(99009900990100)

## R cannot be trusted beyond here!!


