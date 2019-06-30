library(ggplot2)
library(dplyr)
theme_set(theme_bw())

for (tag in names(stats)){
	W = mean(stats[[tag]]$W)
	print(checkplot(stats[[tag]], tag=paste(tag, "W =", W)))
	print(checkplot(stats[[tag]], Wmin=0.95, tag=paste(tag, "largeW")))
}
