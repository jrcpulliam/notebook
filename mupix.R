library(ggplot2)

fulldat <- rbind(
	cbind(ndat, fun="norm")
	, cbind(cdat, fun="cauchy")
)
	
print(fulldat)

print(ggplot(fulldat, aes(d, m, color=fun))
	+ geom_line() + geom_point()
)

