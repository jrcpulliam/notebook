library(tidyverse)

numSims <- 1e4

points <- 8
set.seed(7084)

dat <- list(
	Cauchy = rerun(numSims, rcauchy(points))
)
