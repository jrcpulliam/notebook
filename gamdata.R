library(tidyverse)

numSims <- 2e3
kRange <- seq(0.01, 0.51, length.out=11)

points <- 8
set.seed(7084)

dat <- list()

for (k in kRange){
	tag <- paste0("k_", k)
	dat[[tag]] <- rerun(numSims, rgamma(points, shape=1/k))
}
