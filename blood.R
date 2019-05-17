library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
theme_set(theme_bw())

wbc_floor <- 4.5
anc_floor <- 1800

xs <- input_files[[1]]
Tests <- read_excel(xs, sheet=1)
Symptoms <- read_excel(xs, sheet=2)
Shots <- read_excel(xs, sheet=3)

Tests <- (Tests
	%>% mutate(
		wbcNorm = wbc/wbc_floor
		, ancNorm = anc/anc_floor
	)
)

longTests <- (Tests
	%>% select(date, wbcNorm, ancNorm)
	%>% gather("measure", "level", -date)
)

print(
	ggplot(longTests, aes(x=date, y=level, color=measure))
	+ geom_line()
	+ scale_y_log10()
)
