library(ggplot2)
library(dplyr)
theme_set(theme_bw())

Wmin = 0.95

for (tag in names(stats)){
	W = sprintf("%4.2f", mean(stats[[tag]]$W))
	print(checkplot(stats[[tag]], tag=paste(tag, "W ≈", W)))
	print(checkplot(stats[[tag]], Wmin=Wmin, tag=paste(tag, "W > ", Wmin)))
}
