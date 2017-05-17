---
layout: page
title: Hill diversity
---

Hill diversity as mean rarity
=============================

Hill diversity is a set of diversity measures that have simple relationships to the main established measures of diversity, while putting them on a common scale that can be interpreted as an effective number of species.

Hill diversity is typically expressed as a reciprocal of mean average abundance. Here we argue that is simpler to express Hill diversity as a mean "rarity", and also that expressing it this way may clarify some questions related to estimating diversity.

Finite pool size
----------------

The standard estimate for Simpson diversity is

$$\hat r_i = (S-1)/(k_i-1)$$ [label:SimpEst]

(rather than $$\hat r_i = S/k_i = 1/\hat p$$). This means in particular that the estimated rarity of a species with one sample observation $$k=1$$ is infinite. Interestingly, this poses no particular problem for taking harmonic means and estimating the Simpson-Hill diversity. But it does mean that we cannont extend this estimate at all to diversities with $$\ell \ge 0$$ (like Shannon-Hill or richness).

We can ask, is there a simple way to generalize this estimate if we think that the sample is taken from a finite (but large) pool size?

The basis of the rarity estimate is that the probability that two samples chosen without replacement from the sample will match is an unbiased estimate of the probability that two samples chosen from the hypothetical infinite pool will match. If we want to consider the pool as finite, we need to define rarity in terms of the probability that two samples chosen from the larger pool _with replacement_ will match. This is because of the reason.

This probability can be estimated from the sample by imagining that we first pick  a focus of type $$i$$, then pick from the infinite pool by first asking whether the pick is the same individual as the focus, and – if not – picking at random from the other individuals in the sample. This gives a conditional probability estimate of:

$$ \frac{1}{N} + \frac{N-1}{N} \frac{k_i-1}{S-1}.$$

and thus a rarity estimate of: 

$$ \frac{N(S-1)}{N(k-1) + S-k}.$$

We can assume that $$N \gg S$$, so this estimate will be very close to the classical estimate when $$k>1$$; when $$k=1$$, then estimate is $$N$$. These estimates are based on a principled approximation of Simpson diversity, which should correspond to a good (but biased) estimate of Simpson-Hill diversity. The rarities are on the high side, and there may be better values to use when $$\ell > -1$$. On the other hand, these numbers can be used right now to provide an upper estimate that does not (strictly) diverge. It would be interesting to apply to specific cases.
