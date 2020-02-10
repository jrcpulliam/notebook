
library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)
theme_set(theme_bw())

col <- c("#66FF66", "#6666FF", "#FF6666")

wbc_floor <- 4.5
wbc_high <- 13
anc_floor <- 1800
anc_high <- 8000

symPlot <- 2
shotPlot <- 4

xs <- input_files[[1]]
Tests <- read_excel(xs, sheet=1)
Symptoms <- read_excel(xs, sheet=2)
Shots <- read_excel(xs, sheet=3)

Tests <- (Tests
	%>% mutate(
		wbcNorm = wbc/wbc_floor
		, ancNorm = anc/anc_floor
	)
	%>% filter(date > as.POSIXct("2019-03-01"))
)

longTests <- (Tests
	%>% select(date, wbcNorm, ancNorm)
	%>% gather("measure", "level", -date)
)

Symptoms$height <- symPlot
Shots$height <- shotPlot

mainPlot <- (
	ggplot(longTests, aes(x=date, y=level, color=measure))
	+ scale_color_manual(values=col)
	+ scale_size_area()
	+ geom_line()
	+ geom_point()
	+ scale_y_log10()
	+ geom_hline(yintercept=1, linetype="dashed")
	+ geom_hline(yintercept=anc_high/anc_floor
		, linetype="dashed", color=col[1]
	)
	+ geom_hline(yintercept=wbc_high/wbc_floor
		, linetype="dashed", color=col[2]
	)
	+ geom_point(data=Symptoms, aes(color=NULL, y=height, size=illness)
		, color=col[[3]]
	)
	+ geom_point(data=Shots, aes(color=NULL, y=height))
)

print(mainPlot)
print(mainPlot + xlim(c(as.POSIXct("2019-08-01"), NA)))
print(mainPlot + xlim(c(as.POSIXct("2019-12-01"), NA)))

## Does not work because of extra data sets
## print(mainPlot %+% filter(longTests, date>as.POSIXct("2020-01-01")))

print(Shots, n=100)
