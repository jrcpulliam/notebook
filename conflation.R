set.seed(2129)
nobs <- 100

d <- rlnorm(nobs)
b <- 1/d
dobs <- d*rlnorm(nobs)

k <- b*dobs

summary(lm(k~dobs))
summary(lm(b~dobs))
summary(glm(k~dobs, family=gaussian(link="log")))
summary(glm(b~dobs, family=gaussian(link="log")))

plot(d, b)
plot(dobs, b)
