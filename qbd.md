---
layout: page
title: Quantile-based distributions
---

There are various applications where you might want to go from a set of quantiles (and associated probabilities) to an actual approximate distribution.

In particular:

* to propagate error in a meta-analysis or synthesis when you have confidence intervals from a published paper (example, the rabies burden paper)

* to systematically evaluate predictions that are expressed in terms of quantiles (see Johansson's dengue contest stuff, which I cannot find)

There are then two steps:

* parameterizing a distribution that matches (or approximates) the given quantiles

* doing something else, either:
  * calculating a density to attach likelihood to particular values
  * resampling from the distribution

I've been trying two different approaches to this:

* skew normal (there's a wiki page about this, and [I tweeted about it](https://twitter.com/jd_mathbio/status/591371109045534720)). There is working code to parametrize and sample, but I suddenly gave up on the density part because I was frustrated that the skew normal couldn't match things with very high skew. This can match exactly three quantiles (when it can).

* Johnson-SU distributions. In my understanding, these involve sinh transformations of the normal distribution. This can match four quantiles, which will rarely be wanted, so we need some sort of constraint to restrict the parameter space and get a canonical distribution for three quantiles.

Bolker also has code which works using monotonic splines, which seems less elegant (and therefore possibly less defensible, especially for _post hoc_ application), but definitely more flexible (in particular, can be used for either 3 or 5 parameters).

The method should be:

* designed to work on an unbounded scale; thus to match probabilities you should first transform to a log odds scale, and to match positive quantities you should first take the log

* based on the normal distribution (on the transformed scale); in particular, if both the probabilities and quantile values are symmetric on that scale, we should match the normal

* affine; meaning that if two sets of quantiles differ only by location and scale (on the transformed scale), the method should map them to two distributions which also differ only by location and scale.

## Johnson distributions

In my understanding, a deviate $$x$$ from a [Johnson distribution](https://en.wikipedia.org/wiki/Johnson%27s_SU-distribution) is obtained by transforming a deviate $$z$$ from a normal distribution.

I like to write:

$$\frac{x-\mu_J}{\sigma_J} = \sinh(\frac{z-\mu_N}{\sigma_N})$$. 

This makes it (reasonably) clear that $$\mu_J$$ and $$\sigma_J$$ determine the location and scale of the resulting Johnson distribution, and that we therefore need to choose $$\mu_N$$ and $$\sigma_N$$ to determine the shape. If the normal distribution is narrow and centered near zero, the transformation won't do much to it; conversely, we can make it do crazy stuff by making these parameters large.

We only really want one free parameter, so it's tempting to fix one of them, but there seems no natural way to do this. Or, there is a natural way for each parameter, but it doesn't work: holding $$\mu_N=0$$ means that the Johnson distribution is symmetric, which is not at all what we want. Holding $$\sigma_N=1$$ works pretty well, but leads to a bounded amount of skew.

The constraint that I seem to like is $$\mu_N = 1/\sigma_N\equiv\phi$$. This parameterization has the advantage of being symmetric and normal when $$\phi=0$$. I wrote [some code to find φ](https://raw.githubusercontent.com/dushoff/scratch/master/johnson.R) and am working on densities and validation and such.

