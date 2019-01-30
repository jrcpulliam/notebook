library(dplyr)

set.seed(41)

numChildren <- 60
hm <- 120
hsd <- 8
grow <- 0.05
extraGrow <- 0.01
growLS <- 0.1

## Create data

children <- tibble(startHeight = rnorm(numChildren, hm, hsd)
	, treatment = sample(c("A", "C"), numChildren, replace=TRUE)
)

children <- (children 
	%>% mutate(
		expGrow = ifelse(treatment=="C", grow, grow+extraGrow)
		, realGrow = rlnorm(numChildren, log(expGrow), sdlog=growLS)
		, endHeight = startHeight*(1+realGrow)
		, treatment = factor(treatment, levels=c("C", "A"))
	) %>% select(-c(realGrow, expGrow))
)

## Analyze data

children <- (children 
	%>% mutate(growth = endHeight-startHeight
		, propGrowth = endHeight/startHeight
	)
)

m <- lm(propGrowth ~ treatment, data=children)
print(confint(m))
