library(ggplot2)
theme_set(theme_bw())
library(tidyverse)


milli <- function(tf){
	tf <- (tf
		%>% arrange(est)
		%>% mutate(ind=1:nrow(tf))
	)

	return(ggplot(tf, aes(x=ind, y=est, ymin = lower, ymax=upper))
		+ geom_pointrange()
		+ geom_hline(yintercept=0)
		+ xlab("index")
		+ ylab("estimate")
	)
}

slug <- function(tf){
	numEst <- nrow(tf)
	tf <- (tf
		%>% arrange(est)
		%>% mutate(
			estQ=((1:numEst)-1/2)/numEst
			, pos = estQ*(lower-median(lower))
				+(1-estQ)*(upper-median(upper))
		)
		%>% arrange(pos)
		%>% mutate(
			quantile=((1:numEst)-1/2)/numEst
		)
	)

	return(ggplot(tf, aes(x=quantile, y=est, ymin = lower, ymax=upper))
		+ geom_pointrange(alpha=0.2, fatten=0.1)
		+ geom_hline(yintercept=0)
		+ xlab("index")
		+ ylab("estimate")
	)
}


print(slug(normT))
print(slug(expT))
print(slug(normX))

