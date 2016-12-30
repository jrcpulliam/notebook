ave <- read.table(input_files[[1]])

with(ave, plot(V1, V2
	, xlab = "Average"
	, ylab = "Min. attempts"
	, type="l"
	, log="y"
))
