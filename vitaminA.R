library(dplyr)

set.seed(41)
set.seed(141)

## Create data
create_data <- function(
	numChildren = 60 , hm = 120 , hsd = 8
	, grow = 0.05 , extraGrow = 0.01 , growLS = 0.1
){

	children <- tibble(startHeight = rnorm(numChildren, hm, hsd)
		, treatment = sample(c("A", "C"), numChildren, replace=TRUE)
	)

	return(children 
		%>% mutate(
			expGrow = ifelse(treatment=="C", grow, grow+extraGrow)
			, realGrow = rlnorm(numChildren, log(expGrow), sdlog=growLS)
			, endHeight = startHeight*(1+realGrow)
			, treatment = factor(treatment, levels=c("C", "A"))
		) %>% select(-c(realGrow, expGrow))
	)
}

## Analyze data

analyze_data <- function(children){
	children <- (children 
		%>% mutate(growth = endHeight-startHeight
			, propGrowth = endHeight/startHeight-1
		)
	)

	m <- lm(propGrowth ~ treatment, data=children)
	return(c(
		lwr = confint(m)["treatmentA", 1]
		, upr = confint(m)["treatmentA", 2]
	))
}

simulation_study <- function(
	numChildren = 60 , hm = 120 , hsd = 8
	, grow = 0.05 , extraGrow = 0.01 , growLS = 0.1
	, reps=1000
){
	sims <- sapply(1:reps, function(r){
		dat <- create_data (numChildren = numChildren
		, hm = hm, hsd = hsd
		, grow = grow, extraGrow = extraGrow, growLS = growLS
		)
		return(analyze_data(dat))
	})
	return(as.data.frame(t(sims)))
}

## Validity: do we give up 95% of the time in the counterfactual when
## literally nothing is going on?

vallist <- simulation_study(extraGrow=0)
print(c(
	toohigh=mean(vallist$lwr>0)
	, toolow=mean(vallist$upr<0)
))

extraGrow <- 0.002
effectSign <- sign(extraGrow)

powerlist <-simulation_study (extraGrow=extraGrow)

print(c(
	## We should be effectSign here somehow but my brain hurts right
	power = mean(powerlist$lwr>0)
	, signErr = mean(powerlist$upr<0)
))

print(c(
	toohigh=mean(powerlist$lwr>extraGrow)
	, toolow=mean(powerlist$upr<extraGrow)
))

numvec <- seq(20, 60, by=10)
pvec <- sapply(numvec, function(numChildren){
	plist <- simulation_study(extraGrow=extraGrow, numChildren=numChildren)
	return(mean(plist$lwr>0))
})

plot(numvec, pvec)
