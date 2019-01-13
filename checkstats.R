
multTest <- function(datList, test){
	return(as.data.frame(t(sapply(datList, function(d){
		t <- test(d)
		return(c(p=t$p.value, ci=t$conf.int))
	}))))
}

normT <- multTest(normList, t.test)
expT <- multTest(expList, t.test)
normX <- multTest(repList, t.test)

