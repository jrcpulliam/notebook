# Started from https://github.com/maw501/ISLR-R-Labs/blob/master/
# … which is not longer there. NOt so clear what this was for. Delete?
# 2019 Jan 11 (Fri)

library(ISLR)
library(boot)

set.seed(1)

alpha.fn = function(data,index){
    X=data$X[index]
    Y=data$Y[index]
    return((var(Y)-cov(X,Y))/(var(X)+var(Y)-2*cov(X,Y)))
}

alpha.fn(Portfolio,1:100) # test function using initial data set
# test one random trial
alpha.fn(Portfolio,sample(100,100,replace=T))
# now test 1000 using bootstrap
b <- boot(Portfolio, alpha.fn, R = 1000)
b # gives mean estimate for the statistic and std error
plot(b) # histogram and QQ plot of bootstrap

print(boot)
