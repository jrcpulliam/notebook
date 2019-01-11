library(tidyverse)

as.data.frame(t(sapply(norm, function(v){
	t <- t.test(v)
	return(c(p=t$p.value, ci=t$conf.int))
})))
