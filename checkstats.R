
multT <- function(datList){
	df <- as.data.frame(t(sapply(datList, function(d){
		t <- t.test(d)
		p <- (1-sign(t$statistic)*(1-t$p.value))/2
		return(c(p, t$est, t$conf.int))
	})))
	names(df) <- c("p", "est", "lower", "upper")
	return(df)
}

normT <- multT(normList)
expT <- multT(expList)
normX <- multT(repList)

