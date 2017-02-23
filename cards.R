
size <- 4:16

deck <- round(factorial(size)/exp(1))/factorial(size)
guess <- ((size-1)/size)^(size)

print(data.frame(size, guess, deck))

diff <- function(v){
	return(abs(log(exp(1)*v)))
}

ddiff <- diff(deck)
gdiff <- diff(guess)

plot(size, guess, type="b",
	, xlab = "Size of deck"
	, ylab = "Probability of missing"
	, ylim = c(min(guess), max(deck))
	, log = "y"
)
lines(size, deck, type="b", pch=3)
abline(h=exp(-1))

plot(size, gdiff, type="b",
	, xlab = "Size of deck"
	, ylab = "Absolute proportional difference"
	, ylim = c(min(ddiff), max(gdiff))
	, log = "y"
)
lines(size, ddiff, type="b", pch=3)

print(ddiff)

cards <- 8
reps <- 1e3
# reps <- 1e1

dw <- gw <- 0

print(round(factorial(1:10)/exp(1)))

for (n in 1:reps){
	deck <- sample(1:cards, cards, replace=FALSE)
	guess <- sample(1:cards, cards, replace=TRUE)
	if (sum(deck==1:cards)>0) dw <- dw+1
	if (sum(guess==1:cards)>0) gw <- gw+1
}

print(c(dw=dw, gw=gw, iw=reps*(1-exp(-1))))
