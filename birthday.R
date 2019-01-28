
for (year in 1900:1901){
	for (month in 1:12){
		n <- length(sums(c(num=month, den=year), numVals=3))
		print(c(year, month, n))
	}
}
