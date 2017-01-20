cards <- 8
reps <- 1e5

dw <- gw <- 0

for (n in 1:reps){
	deck <- sample(1:cards, cards, replace=FALSE)
	guess <- sample(1:cards, cards, replace=TRUE)
	if (sum(deck==1:cards)>0) dw <- dw+1
	if (sum(guess==1:cards)>0) gw <- gw+1
}

print(c(dw=dw, gw=gw, iw=reps*(1-exp(-1))))
