
for (year in 1800:1900){
	for (month in 1:12){
		n <- length(sums(c(num=month, den=year), numVals=3, first=TRUE))
		if (n==0) print(c(year, month))
	}
}
