rstep <- function(n, r, scale){
	return(rpois(1, n*r*exp(-n/scale)))
}

rtrajectory <- function(r, scale, n0=NULL, steps=200){
	n <- numeric(steps)
	if (is.null(n0)) n0 <- scale
	n[[1]] <- n0
	for (i in 2:steps){
		n[[i]] <- rstep(n[[i-1]], r, scale)
	}
	return(n)
}

plotDynamics <- function(r, scale, n0=NULL, steps=200, start=NULL){
	n <- rtrajectory(r, scale, n0=NULL, steps=200)/scale
	if (is.null(start)) start=steps-50
	plot(start:steps, n[start:steps]
		, xlab = "Generation"
		, ylab = "Density"
		, type = "l"
	)
	title (main = paste("Time: r =", r, "; scale =", scale))

	plot(n[(start:steps)-1], n[start:steps]
		, xlab = "Generation"
		, ylab = "Density"
	)
	title (main = paste("Phase: r =", r, "; scale =", scale))
}

plotSet <- function(rlist, slist, n0=NULL, steps=200, start=NULL){
	for(r in rlist){
		for (s in slist){
			plotDynamics(r, s, n0, steps, start)
		}
	}
}

par(mfrow=c(2,2))
plotSet(rlist=c(5, 10, 15, 20, 25, 30)
	, slist = c(1e1, 1e2, 1e3, 1e4)
)
