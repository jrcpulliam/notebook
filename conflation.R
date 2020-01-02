library(ggplot2); theme_set(theme_bw())
library(dplyr)
library(purrr)

## δ = sqrt(1/(π b D))
## b = 1/(π D δ²)
## This is appropriately unitless! One point for deMeeus (or their sources)

datSim <- function(numPoints, D_median, D_spread, D_oe, delta_true, b_oe, ranSeed){
	set.seed(ranSeed)
	return(tibble(
		D_true = rlnorm(numPoints, log(D_median), log(D_spread))
		, D_obs = rlnorm(numPoints, log(D_true), log(D_oe))
		, b_true = 1/(pi*D_true*delta_true^2)
		, b_obs = rlnorm(numPoints, log(b_true), log(b_oe))
		, delta_calc = sqrt(1/(pi*b_obs*D_obs))
	))
}

numPoints = 11
D_median = 100
D_spread = 100
D_oe = 50
delta_true = 0.4
b_oe = 2

seeds <- 1:1000
rhof <- tibble(seeds, rho=map_dbl(seeds, function(r){
	dat <- datSim(numPoints = numPoints
		, D_median = D_median, D_spread = D_spread, D_oe = D_oe
		, delta_true = delta_true, b_oe = b_oe, ranSeed=r
	)
	ct <- with(dat, {
		cor.test(log(D_obs), log(delta_calc))
	})
	return(ct$estimate)
}))

print(
	ggplot(rhof, aes(x=rho))
	+ geom_histogram()
)

rhobar <- rhof %>% summarise(rhobar = median(rho)) %>% as.numeric()
mseed <- rhof %>% summarise(which.min(abs(rho-rhobar))[[1]]) %>% as.numeric()

dat <- datSim(numPoints = numPoints
	, D_median = D_median, D_spread = D_spread, D_oe = D_oe
	, delta_true = delta_true, b_oe = b_oe, ranSeed=rhof$seeds[[mseed]]
)

print(rhobar)
with(dat, {
	cor.test(log(D_obs), log(delta_calc))
})

print(
	ggplot(dat, aes(x=D_obs, y=delta_calc))
	+ scale_y_log10()
	+ scale_x_log10()
	+ geom_point()
	+ geom_smooth(method="lm")

)

## should stop for now until I can see the variation in the D estimates
## They seem to recalculate δ to be consistent with a current value of D, which looks bad
