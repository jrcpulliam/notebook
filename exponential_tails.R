
## Densities for the exponential example (math and verified numerically)

n <- 200
l <- seq(-2, 2, length.out=n)

t <- exp(l)
r <- 1/t
tm <- (t[-1] + t[-n])/2
rm <- (r[-1] + r[-n])/2

S <- exp(-t)
f <- abs(diff(S)/diff(t))

plot(tm, f,  type="l")
curve(exp(-x), add=TRUE)

g <- abs(diff(S)/diff(r))

plot(rm, g,  type="l")
curve(exp(-1/x)/x^2, add=TRUE)

