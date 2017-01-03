max <- 20

nums <- matrix(c(0, 1, 1, 0), nrow=2)

supp <- function(n, max){
	s <- 0
	nr <- nrow(n)
	nn <- matrix(n[1, ], nrow=2*nr-1, ncol=2 )
	for (i in 2:nr){
		new <- n[i-1, ] + n[i, ]
		if (sum(new)<=max){
			nn[i+s, ] <- new
			s <- s+1
		}
		nn[i+s,] <- n[i, ]
	}
	return(nn[1:(nr+s), ])
	return(nn)
}

plot(NULL, NULL
	, xlab = "Value"
	, ylab = "Size"
	, xlim = c(1/max, max)
	, ylim = c(2, max)
	, log = "xy"
)

for (l in 1:max){
	print(nums)
	nums <- supp(nums, max)
	nf <- as.data.frame(nums)
	names(nf) <- c("n", "d")
	nf <- within(nf, {
		val <- n/d
		size <- n+d
	})
	with (nf, points(val, size, pch=19, cex=1/size, col="blue"))
	with (nf, lines(val, size, lwd=1/size))
}
print(nums)

