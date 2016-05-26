n <- 10000

p <- (2*(1:n)-1)/(2*n)
q <- qlnorm(p)
q <- qgamma(p, shape=0.5)

wt <- exp(-1*q)
T <- sum(wt)

M1 <- mean(q*wt)/T
M2 <- mean(q^2*wt)/T
M3 <- mean(q^3*wt)/T

phi2 <- M2/M1^2-1
phi3 <- M3/(M1*M2)-1

rho <- phi3/phi2

print(rho)
