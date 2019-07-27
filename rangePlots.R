library(ggplot2)
theme_set(theme_bw())
library(dplyr)

for (tag in names(stats)){
	print(rangePlot(stats[[tag]], title = tag))
	print(rangePlot(stats[[tag]], title = tag, orderFun=blob))
}
