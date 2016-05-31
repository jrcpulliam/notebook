## Parameters
beta <- 1.8 ## [1/day]
D <- 10 ## [day]

finTime <- 200 ## [day]
deltaT <- 2 ## [day]

## Initial conditions
S <- 8e6 ## [people]
I <- 1 ## [people]
R <- 0 ## [people]

## Times
times <- seq(0, finTime, by=deltaT)
print(time)

## Simulate

Svec <- Ivec <- Rvec <- Nvec <- numeric(0)

for (i in 1:length(times)){
	N <- S+I+R

	Svec[i] <- S
	Ivec[i] <- I
	Rvec[i] <- R
	Nvec[i] <- N

	trans <- beta*S*I/N
	recov <- I/D

	S <- S + deltaT*(-trans)
	I <- I + deltaT*(trans-recov)
	R <- R + deltaT*(recov)
}

matplot(times, cbind(Svec, Ivec, Rvec)
	, lwd=2, type="l", col = c(1, 2, 4), lty=1
	, xlab = "Time (days)", ylab="People"
)
