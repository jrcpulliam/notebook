
for (year in 1800:1900){
	for (month in 1:12){
		if (is.null(sums(c(num=month, den=year), numVals=3, first=TRUE)))
			print(c(year, month))
	}
}
