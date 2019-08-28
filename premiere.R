set.seed(4)
teams <- 20
reps <- 10000

## Pick win/draw/loss at random for first team, reverse and recode for 
## league points
result <- function(){
	r <- sample (1:3)
	v <- c(r, 4-r)
	return(ifelse(v<3, v-1, v))
}

## Play the games and record the scores
## Play both orders at each distance:
## Each team actually thus actually plays 2 games per distance,
## but we arrange 3 games total using overrides (one game is ignored)
season <- function(teams, dlist){
	m <- matrix(0, nrow=teams, ncol=teams)
	for (i in 0:(teams-1)){
		for (d in c(1, floor(teams/2))){
			j <- (i+d) %% teams
			r <- result()
			m[[i+1, j+1]] <- r[[1]]
			m[[j+1, i+1]] <- r[[2]]
		}
	}
	return(m)
}

tied <- function(m){
	p <- rowSums(m)
	t <- table(p)
	return(max(as.vector(t)))
}

tSeas <- function(teams, dlist){
	return(tied(season(teams, dlist)))
	
}

v <- replicate(reps, tSeas(teams, c(1, teams/2)))

plot(table(v))
print(mean(v>=10))
