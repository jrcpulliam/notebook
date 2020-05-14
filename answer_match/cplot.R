
library("ggplot2")
theme_set(theme_bw())

g0 <- (
	ggplot(mf, aes(x=right, y=wrong))
	# + geom_point()
	+ stat_sum(aes(size=..n..))
	# + scale_size_area()
	+ geom_abline(intercept=40, slope=-1)
	+ labs(
		x = "Shared right answers"
		, y = "Shared wrong answers"
	)
)

print(g0)

print(g0 
	+ geom_point(color="red", data=subset(mf, score>280))
)

print(g0 
	+ scale_size_area()
)

