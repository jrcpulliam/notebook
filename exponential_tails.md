## Exponential example

Imagine we have a single observation from an exponential distribution. Maybe we're watching a small sample of an unknown substance with low levels of radioctivity, and it finally clicked our Geiger counter. What statistical inference should we make about the rate?

Elapsed time is T, so observed rate is r = 1/T.

## Frequentist approach

If we have a single null hypothesis in mind, we want to know the probability of an observation at least as extreme as r (compared to r0). We also need a measure of distance, so we know what we mean by extreme.

f(t) = r0 exp(-r0 t) dt
|f(r) dr| = f(t) dt
f(r) = f(t) |dt/dr| = f(t)/t² = f(t) r² = f(t) exp(-(r0/r)) 
	= r² exp(-(r0/r)) 

Given r0, the probability density of r is r exp(-rt), and the cumulative density is 1-exp(-rt). If we define distance in the standard way (|r-r0|), then we would say the "closest" 95% of this distribution is 

