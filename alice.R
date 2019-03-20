numtrials = 50000
set.seed(2222)
alice <- 7
bob <- 8
finish <- 7
 
roll <- function(){
	return(sum(sample(1:6, 2, replace=TRUE)))
}
 
game <- function(){
	lastRoll <- 0
	while(1){
		currRoll <- roll()
		if (((lastRoll==alice) | (lastRoll==bob))
			& (currRoll==finish)
		) return(lastRoll)
		lastRoll <- currRoll
	}
}
 
winners <- as.vector(replicate(numtrials, game()))
 
print(mean(winners==alice))
