library(emdbook)
library(dplyr)
library(tidyr)
library(ggplot2); theme_set(theme_bw(base_size=20))

R <- seq(4, 1, length.out=200)
cutPoint <- 0.4

redFun <- function(v){
	return((v[[1]]-v)/v[[1]])
}

peak <- (R-1-log(R))/R
total <- 1 + lambertW(-R*exp(-R))/R

reduce <- tibble(
	R = redFun(R)
	, peak = redFun(peak)
	, total = redFun(total)
)

longReduce <- (reduce %>% pivot_longer(
	peak:total, names_to="Outcome", values_to="Reduction"
))

bigPlot <- (ggplot(longReduce, aes(R, Reduction, color=Outcome))
	+ geom_line()
	+ xlab("Reduction in transmission")
	+ ylab("Reduction in cases")
	+ scale_y_reverse(labels = scales::percent)
	+ scale_x_continuous(labels = scales::percent)
)

print(bigPlot)

print(bigPlot
	%+% filter(longReduce, R<=cutPoint)
)
