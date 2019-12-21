set.seed(1232)
nobs <- 100

## Additive case


samples <- 1000
xnoise <- 0.8
ynoise <- 0.8

x <- rnorm(samples)
y <- x+ynoise*rnorm(samples)
z <- y-x

## xnoise <- 0
numPoints <- 11
density_median <- 100
density_spread <- 100
pi <- 3.1416
delta_true <- 0.4
density_oe <- 100
b_oe <- 100 ## No real hook for this

## δ = sqrt(1/(π b D))
## b = 1/(π D δ²)
## This is appropriately unitless! ONe point for deMeeus (or their sources)

density_true <- rlnorm(numPoints, log(density_median), log(density_spread))
density_obs <- rlnorm(numPoints, log(density_true), log(density_oe))

b_true <- 1/(pi*density_true*delta_true^2)
b_obs <- rlnorm(numPoints, log(b_true), log(b_oe))

lm(log(b_obs)~log(density_obs))

delta_calc <- sqrt(1/(pi*b_obs*density_obs))

summary(lm(log(delta_calc)~log(density_obs)))

