
## Data for checking scripts

library(tidyverse)

points <- 10
reps <- 2000
reps <- 20

norm <- rerun(reps, rnorm(points))

print(norm)
