---
layout: post
title: Quantile-based Johnson
slug: 3-Quantile-based Johnson
---

In my understanding, a deviate $$x$$ from a [Johnson distribution](https://en.wikipedia.org/wiki/Johnson%27s_SU-distribution) is obtained by transforming a deviate $$z$$ from a normal distribution.

I like to write:

$$\frac{x-\mu_J}{\sigma_J} = \sinh(\frac{z-\mu_N}{\sigma_N})$$. 

This makes it (reasonably) clear that $$\mu_J$$ and $$\sigma_J$$ determine the location and scale of the resulting Johnson distribution, and that we therefore need to choose $$\mu_N$$ and $$\sigma_N$$ to determine the shape. If the normal distribution is narrow and centered near zero, the transformation won't do much to it; conversely, we can make it do crazy stuff by making these parameters large.

We only really want one free parameter, so it's tempting to fix one of them, but there seems no natural way to do this. Or, there is a natural way for each parameter, but it doesn't work: holding $$\mu_N=0$$ means that the Johnson distribution is symmetric, which is not at all what we want. Holding $$\sigma_N=1$$ works pretty well, but leads to a bounded amount of skew.

The constraint that I seem to like is $$\mu_N = 1/\sigma_N\equiv\phi$$. This parameterization has the advantage of being symmetric and normal when $$\phi=0$$. I wrote [some code to find φ](https://raw.githubusercontent.com/dushoff/scratch/master/johnson.R) and am working on densities and validation and such.

