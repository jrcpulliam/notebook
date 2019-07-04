
## Failure! (confused a with c)

a <- 1
b <- seq(-3*a, 3*a, length.out=61)
c_lin <- -(a+b)
c_quad <- ifelse(b<0 & b > -2*a, b^2/(4*a), NA)

plot(b, c_lin, type="l"
	, ylab="c"
)
abline(h=0, lty=2)
abline(v=0, lty=2)
lines(b, c_quad)
