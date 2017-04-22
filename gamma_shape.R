
days <- 20
steps <- 100
shape <- 20
mean <- 10

t <- (1:steps)*(days/steps)

den <- dgamma(t, shape=shape, scale=mean/shape)

plot(t, den)
