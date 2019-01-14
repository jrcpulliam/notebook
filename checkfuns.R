
library(ggplot2)
theme_set(theme_bw())

checkplot <- function(pvec, breaks=seq(0,1,0.05)){
	pval_df <- data.frame(pvals=pvec)
	return(ggplot(pval_df, aes(pvals))
		+ geom_histogram(breaks=breaks)
		+ geom_hline(yintercept=nrow(pval_df)/(length(breaks)-1))
	)
}

print(checkplot(normT$p))
print(checkplot(expT$p))
print(checkplot(normX$p))
