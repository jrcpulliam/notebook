n <- 10000

p <- (2*(1:n)-1)/(2*n)
q <- qgamma(p, shape=0.5)
q <- qlnorm(p)

wt <- exp(-0*q)
T <- sum(wt)

M1 <- sum(q*wt)/T
M2 <- sum(q^2*wt)/T
M3 <- sum(q^3*wt)/T

phi2 <- M2/M1^2-1
phi3 <- M3/(M1*M2)-1

rho <- phi3/phi2

kap3 <- M1*M3/M2^2-1
krho <- kap3/phi2

print(c(rho, krho, kap3))
