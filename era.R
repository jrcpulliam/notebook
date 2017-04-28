era <- read.table(input_files[[1]])

with(era, plot(V1, V2
	, xlab = "ERA"
	, ylab = "Min. outs"
	, type="l"
	, log="y"
))
