num <- 10

y1 <- rnorm(num)
y2 <- rnorm(num)
x <- rnorm(num)

library(nlme)

n <- lme(cbind(y1, y2) ~ x)
summary(n)
