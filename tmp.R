
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
theme_set(theme_bw())

col <- c("#CC6666", "#9999CC", "#66CC99")

wbc_floor <- 4.5
wbc_high <- 13
anc_floor <- 1800
anc_high <- 8000

symPlot <- 2

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

Symptoms$height <- symPlot

print(
	ggplot(longTests, aes(x=date, y=level, color=measure))
	+ geom_line()
	+ scale_y_log10()
	+ geom_hline(yintercept=1, linetype="dashed")
	+ geom_hline(yintercept=anc_high/anc_floor
		, linetype="dashed", color=col[1]
	)
	+ geom_hline(yintercept=wbc_high/wbc_floor
		, linetype="dashed", color=col[2]
	)
	+ geom_point(data=Symptoms, aes(x=date, y=height, size=score))
)
