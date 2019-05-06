
wait <- function(p, num, mult=10){
	max <- round(mult/(p^num))
	v <- numeric(max)
	for (i in 1:max){
		v[[i]] <- rbinom(n=1, size=1, prob=p)		
		if (i >= num)
			if(sum(v[seq(i, by=-1, length.out=num)])==num) return(i)
	}
	stop("Maxed out")
}

wv <- replicate(1e5, wait(0.25, 3, mult=20))
print(mean(wv))
