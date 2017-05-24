library(ggplot2)
theme_set(theme_bw())
dat <- read.table(input_files[[1]], header=TRUE)
print(
	ggplot(dat,aes(x,y))
	+ geom_point()
	+ scale_y_continuous(trans="log1p")
)

