	## Measles in London

	## Parameters

	beta <- 1.8 ## [1/day]
	D <- 10 ## (1/γ) [day]

	print(c(R0 = beta*D))

	deltaT <- 0.5 ## [day]

	finTime <- 100 ## [day]

	## State variables

	S <- 8e5 ## People
	I <- 1 ## People
	R <- 0 ## People

	## Transition rates [people/day]

	times <- seq(0, finTime, by=deltaT)

	Sv <- Iv <- Rv <- Nv <- numeric(0)
	for (i in 1:length(times)){
		N <- S+I+R
		Sv[[i]] <- S
		Iv[[i]] <- I
		Rv[[i]] <- R
		Nv[[i]] <- N

		trans <- beta*S*I/N
		recov <- I/D

		S <- S + (-trans)*deltaT
		I <- I + (trans-recov)*deltaT
		R <- R + (recov)*deltaT
	}

	par (cex=1.8)

	matplot(times, cbind(Sv, Iv, Rv)
		, type = "l", lwd=1.8, lty=1, col=c(1, 2, 4)
		, xlab="Time (days)", ylab="People"
	)

	print(c(S, I, R))
