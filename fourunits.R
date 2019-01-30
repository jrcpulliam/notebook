first <- function(numVals, imax=2000){
	for (i in 2:imax){
		## for (j in 1:(i-1)){
		for (j in 1:2){
			if(is.null(sums(c(num=j, den=i), numVals=numVals, first=TRUE)))
				return(c(num=j, den=i))
		}
	}
}

print(first(3))
