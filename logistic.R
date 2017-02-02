colfun <- function(x){
	l <- length(unique(x))
	if (l==2) {return ("black")}
	if (l==3) {return ("red")}
	if (l==4) {return ("green")}
	if (l==8) {return ("yellow")}
	if (l==10) {return ("orange")}
	return("blue")
}

lfun <- function(x, r, steps){
	xt <- numeric(steps)
	for(i in 1:steps)
		xt[[i]] <- x <- r*x*(1-x)
	return(xt)
}


x0 <- 0.4
cut <- 4000
view <- 80
start <- 3
end <- 4
rr <- 1001

steps <- cut+view
look <- seq(cut+1, steps)
plot(NULL, NULL
	, xlim=c(start, end), ylim=c(0, 1)
	, ylab="Long-term density", xlab="R0"
)

i <- 1
cv <- numeric(rr)
for(r in seq(start, end, length.out=rr))
{
	xt <- lfun(x0, r, steps)
	win <- xt[look]
	points(rep(r, length(look)), win, pch=19, cex=0.2, col=colfun(win))
}

