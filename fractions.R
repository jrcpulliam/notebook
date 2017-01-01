reps <- 10

fracList <- list(c(0, 1), c(1, 0))
print(fracList[[1]] + fracList[[2]])

newList <- function(l){
	nl <- list(l[[1]])
	for (i in 2:length(fracList)){
		nl[[2*i-2]] <- l[[i-1]]+l[[i]]
		nl[[2*i-1]] <- l[[i]]
	}
	return(nl)
}

plot(NULL, NULL
	, xlim = c(1/reps, reps)
	, ylim = c(1, reps)
	, log = "xy"
)

for (l in 1:reps){
	fracList <- newList(fracList)
}

