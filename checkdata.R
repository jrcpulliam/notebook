
## Data to check with checking scripts

library(tidyverse)

points <- 8
reps <- 20
reps <- 2000

normList <- rerun(reps, rnorm(points))
expList <- rerun(reps, rexp(points)-1)

repList <- lapply(normList, function(v){return(c(v, v, v))})
