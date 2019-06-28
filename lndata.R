
library(tidyverse)

numSims <- 2e3
sdlogRange <- seq(0.01, 0.51, length.out=11)

points <- 20
set.seed(7084)

dat <- list()

for (sdlog in sdlogRange){
	tag <- paste0("sdlog_", sdlog)
	dat[[tag]] <- rerun(numSims, rlnorm(points, sdlog=sdlog))
}
