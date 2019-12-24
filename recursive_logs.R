tau <- 6.283

x <- seq(-1, 4, length.out=222)
l <- exp(x) - x^2
a <- acos(x/exp(x))

plot(x, l, type="l"
	, xlim = c(0.2, 0.4)
	, ylim = c(1,1.4)
)
for (m in 0:3){
	lines(x, a+m*tau)
}
