ave <- read.table(input_files[[1]])

with(ave, plot(V1, V2
	, xlab = "Batting average"
	, ylab = "Min. attempts"
	, type="l"
	, log="y"
))
