# par(cex=1.8)
par("ps"=18)
year <- 365
beta <- 1.8 # 1/day
D <- 10 # day
L <- 60*year

S <- 8e6 # people
I <- 1 # people
R <- 0 # people

deltaT <- 0.5 # days
FinTime <- 10000 # days

times <- seq(0, FinTime, by=deltaT)

Svec <- Ivec <- Rvec <- Nvec <- numeric(0)

for (i in 1:length(times)){
	N <- S+I+R

	Svec[i] <- S
	Ivec[i] <- I
	Rvec[i] <- R
	Nvec[i] <- N
	
	# Rates [1/day]
	trans=beta*S*I/N 
	recov=I/D
	reinc=R/L

	# Update
	S <- S + deltaT*(reinc-trans)
	I <- I + deltaT*(trans-recov)
	R <- R + deltaT*(recov-reinc)
}

matplot(times, cbind(Svec, Ivec, Rvec)
	, type="l", lty=1, lwd=1.5, col=1:3
	, xlab="Time (days)", ylab="People"
)
