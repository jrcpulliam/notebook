library(ggplot2)
library(dplyr)
theme_set(theme_bw())

Wmin = 0.95

for (tag in names(stats)){
	print(checkplot(stats[[tag]], tag=tag))
}
