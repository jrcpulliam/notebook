library(dplyr)

itop <- 99
jtop <- 99
rtop <- 9999
ss <- function(x,sep=""){
	return(strsplit(x, sep)[[1]])
}

rev10 <- function(x){
	return(x
		%>% as.character %>% ss()
		%>% rev() %>% paste(collapse="") %>% as.numeric()
	)
}

for (i in 1:itop){
	for(j in (i+1):jtop){
		ir <- rev10(i)
		if (ir >= i){
			jr <- rev10(j)
			rr <- rev10(i**2+j**2)
			if ((rr == rev10(i)**2+rev10(j)**2) && (rr<=rtop)){
				print(c(i, j))
			}
		}
	}
}

print(37**2)
