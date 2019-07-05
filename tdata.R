library(tidyverse)

numSims <- 2e3
tRange <- seq(1, 6, length.out=6)

points <- 8
set.seed(7084)

dat <- list()

for (df in tRange){
	tag <- paste0("t_", df)
	dat[[tag]] <- rerun(numSims, rt(points, df=df))
}
