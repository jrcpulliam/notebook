library(ggplot2)
library(dplyr)
theme_set(theme_bw())

checkplot <- function(stats, breaks=seq(0,1,0.05), tag="", Wmin=0){
	stats <- filter(stats, W>Wmin)
	return(ggplot(stats, aes(p))
		+ geom_histogram(breaks=breaks)
		+ geom_hline(yintercept=nrow(stats)/(length(breaks)-1))
		+ ggtitle(tag)
	)
}
for (tag in names(stats)){
	W = mean(stats[[tag]]$W)
	print(checkplot(stats[[tag]], tag=paste(tag, "W =", W)))
	print(checkplot(stats[[tag]], Wmin=0.95, tag=paste(tag, "largeW")))
}
