library(dplyr)

itop <- 99
jtop <- 100
rmin <- 10000
rmax <- 99999
ss <- function(x,sep=""){
	return(strsplit(x, sep)[[1]])
}

rev10 <- function(x){
	return(sprintf("%8.0f", x)
		%>% as.character %>% ss()
		%>% rev() %>% paste(collapse="") %>% as.numeric()
	)
}

rev10(100003)

ct <- 0
for (i in 1:itop){
	for(j in (i+1):jtop){
		ir <- rev10(i)
		jr <- rev10(j)
		if (ir > i || (ir=i && jr >= j)){
			rr <- rev10(i**2+j**2)
			## print(c(i, j, rr))
			if (
				(rr == rev10(i)**2+rev10(j)**2)
				&& (rr<=rmax) && (rr>=rmin)
			){
				ct <- ct+1
			}
		}
	}
}

print(ct)
