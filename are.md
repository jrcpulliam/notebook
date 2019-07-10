---
layout: page
title: Are distributions
---

This was useful, but is not careful enough about spinoffs (how many individuals are actually created at different levels). Be careful!

The Are distribution and the link to tsetse loops

$$r$$ is the probability of reaching the loop; $$\ell$$ is the probability of looping.

* The probability of $$k$$ offspring is $$ P_k = r (1-\ell) \ell^k$$
* The associated generating function is $$ φ(x) = 1-r + \frac{r(1-\ell)}{1-\ell x}$$
* The reproductive number is $$ R = φ'(1)/r = \ell/(1-\ell)$$
* $$ E = φ(E)$$ is solved by $$E = 1$$ _or_ $$\frac{1-rp}{\ell}$$

Solve for $$\ell = \frac{R}{R+r}$$ and substitute:

* $$ E = \frac{R+r-rR}{R} $$

This becomes interpretable if we write the "forever" probability $$F=1-E$$

* $$ F = \frac{r(R-1)}{R}$$:

it's the probability of reaching the loop times the probability of surviving forever once the loop is reached.
