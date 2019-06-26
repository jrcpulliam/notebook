num <- 10

y1 <- rnorm(num)
y2 <- rnorm(num)
x <- rnorm(num)

library(nlme)

## Need a grouping term for lme
## n <- lme(cbind(y1, y2) ~ x)
## summary(n)
