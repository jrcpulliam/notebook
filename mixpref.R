
### Functions

symMat <- function(m){
	stopifnot(class(m) == "matrix")
	stopifnot(nrow(m) == ncol(m))

	return((m+t(m))/2)
	
}

pref2mix <- function(phi, T=NULL){

	phi <- symMat(phi)

	B <- rep(1, nrow(phi))
	if(is.null(T)) T <- B
	p <- T/sum(T)
	sig <- as.vector(1 - phi %*% p)
	D <- sum(p*sig)
	rho <- diag(T) %*% (outer(sig, sig)/D + phi) %*% diag(p)
	return(rho)
}

mix2pref <- function(rho
	, delta=1, alpha=0.1
	, iterations=20, verbose=FALSE
){
	rho <- symMat(rho)
	nr <- nrow(rho)
	T <- rowSums(rho)

	phi <- alpha*matrix(rep(1, nr^2)
		, nrow = nr
	) + (delta-alpha)*diag(rep(1, nr))

	for (i in 1:10){
		rhoc <- pref2mix(phi, T)
		if(verbose) print(rhoc)
		phi <- phi*rho/rhoc
	}
	
	return(phi)
}

mixAdj <- function(rho, Tnew
	, delta=1, alpha=0.1
	, iterations=20, verbose=FALSE
){
	rho <- symMat(rho)

	T <- rowSums(rho)
	phi_est <- mix2pref(rho, delta, alpha, iterations, verbose)
	return(pref2mix(phi_est, Tnew))
}

### Values

phi <- matrix(
	c(
		1, 0, 0
	 , 0, 1, 0
	 , 0, 1, 1
	), nrow=3, byrow=TRUE
)

T <- c(1, 1, 2)
Tnew <- c(1, 2, 2)

## Run

rho <- pref2mix(phi, T)
print(rho)

print(mixAdj(rho, T, Tnew))
print(mixAdj(rho, T, Tnew, alpha=0.5))
