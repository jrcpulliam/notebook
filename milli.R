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

print(milli(normT))
print(milli(expT))
print(milli(normX))

