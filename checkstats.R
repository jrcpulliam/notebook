
multT <- function(datList){
	return(as.data.frame(t(sapply(datList, function(d){
		t <- t.test(d)
		p <- (1-sign(t$statistic)*(1-t$p.value))/2
		return(c(p=p, ci=t$conf.int))
	}))))
}

normT <- multT(normList)
expT <- multT(expList)
normX <- multT(repList)

