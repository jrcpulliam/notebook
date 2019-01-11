library(ggplot2)
theme_set(theme_bw())

checkplot <- function(pvals){
	statframe <- data.frame(pvals=pvals)
	return(ggplot(statframe, aes(pvals))
		+ geom_histogram(breaks=seq(0,1,0.05))
	)
}

pvals <- runif(2000)

print(checkplot(pvals))
