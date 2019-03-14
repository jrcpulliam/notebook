---
layout: post
title: Permutation binomial
---


Binomial tests
--------------

The standard frequentist binomial test can be conceptualized by a
permutation test. This conceptualization can be expanded to more
difficult problems (like risk ratios in a 2x2 table).

Imagine that we have a group of people who were given a vaccine. 7
showed a positive serological response, and 10 did not. What is our
confidence interval for the proportion of vaccine responders in the
population from which they were drawn?

The standard approach takes each possible value of the underlying
proportion *p*, and calculates the (one-tailed) probability of observing
a result as or more “extreme” (different from the expectation) as the
observed data. If the probability is  &gt; *α*/2, then the hypothesized
*p* is in the confidence interval.

    x <- 7
    n <- 17
    seed <- 946
    t <- binom.test(x, n)
    print(t)

    ## 
    ##  Exact binomial test
    ## 
    ## data:  x and n
    ## number of successes = 7, number of trials = 17, p-value = 0.6291
    ## alternative hypothesis: true probability of success is not equal to 0.5
    ## 95 percent confidence interval:
    ##  0.1844370 0.6707528
    ## sample estimates:
    ## probability of success 
    ##              0.4117647

In practice, this probability is calculated using the binomial formula.
We can confirm this by taking the values kicked out by the test above
and testing them using the binomial formula.

    print(lim <- t$conf.int)

    ## [1] 0.1844370 0.6707528
    ## attr(,"conf.level")
    ## [1] 0.95

    print(pbinom(size=n
        , q=c(x, x-1) 
        , prob=c(lim[[2]], lim[[1]]))
    )

    ## [1] 0.025 0.975

Permutation binomials
---------------------

If we didn’t know the binomial formula, we could do the same thing by
simulating (it’s not clear what the point is, since we ‘’do’’ know the
binomial formula, but I’ll get back to that). For each hypothetical
value of *p*, we could simulate the process of randomly deciding who
showed a positive response 10,000 or so times, and get an accurate
estimate of the desired probability.

Besides having no clear point, this idea seems impractical, since we
want to do these thousands of calculations for each possible value of
*p*. We can solve this by re-conceptualizating the simulation. A
standard way to think about simulating a binomial outcome is to compare
the success probability *p* to a uniform random number *U*<sub>*i*</sub>
(from 0-1) for each individual *i*: if your random number
*U*<sub>*i*</sub> &lt; *p*, then you have a positive vaccine response,
otherwise not. But we can choose the *U*<sub>*i*</sub> values ‘’first’’,
and then decide what *p* is. This will have the same result – and we can
essentially test every value of *p* at once, since once we’ve chosen the
values of *U*<sub>*i*</sub>, we know which values of *p* are consistent
with, or else too large or too small for, our observed result.

So, for example, if we chose the numbers below:

    set.seed(seed)
    print(sort(runif(n)))

    ##  [1] 0.1504365 0.1520689 0.2132614 0.2693327 0.3031454 0.5300384 0.5593599
    ##  [8] 0.6378020 0.6648721 0.6688387 0.6738862 0.7145173 0.7524999 0.7926780
    ## [15] 0.8474203 0.8989262 0.9031163

our observation (7 “successes”) would be consistent with *p* between the
seventh value (0.559) and the eighth (0.638).

A permutation binomial test
---------------------------

If we do this thousands of times, and take the 0.025 quantile of the
lower limit and the 0.975 quantile of the upper limit, we get a very
good approximation of the standard binomial test.

    sprob <- function(x, n){
        vals <- c(0, sort(runif(n)), 1)
        return(c(low=vals[x+1], high=vals[x+2]))
    }

    btest <- function(x, n, reps=5000, P=0.025){
        r <- replicate(reps, sprob(x=x, n=n))
        offset <- floor(reps*P)
        return(c(
            low=sort(r["low", ])[offset],
            high=sort(r["high", ])[1+reps-offset]
        ))
    }

    btest(x, n)

    ##       low      high 
    ## 0.1859107 0.6742275

This is suspiciously close to the answer above. So now we have an
interesting conceptualization, and also a reasonably fast, accurate
method of estimating binomial confidence intervals which could be used
in the event that all of the copies of the binomial formula were
destroyed in some sort of freak accident.

The question is: can we apply this idea to do something practical?
