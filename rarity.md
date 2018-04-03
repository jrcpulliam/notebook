---
layout: page
title: Hill diversity
---

Diversity as mean rarity
=============================

Diversity is widely seen as an important ecosystem metric. Diversity can be measured in different ways, and different measures may be useful for different purposes. The simplest diversity metric is species richness: the total number of species in an ecosystem (or in a particular guild). Richness has an important conceptual limitation, and an important practical limitation. The conceptual limitation is that the number of species alone often does not capture important aspects of functional diversity. An ecosystem with ten species of vascular plant may be dominated by a single species, or it may have large number of each species, and a correspondingly larger amount of interspecific interaction going on. The practical limitation is that richness is particularly hard to measure from finite sample.

however: suffers from Diversity measures jcan combine different aspects of functional diversity (how blikely are interacting individuals span a range, roughly, from richness (which reflects only the total number of species) to can consider number of species present, or can be describes as ranging

Hill diversity is a set of diversity measures that have simple relationships to the main established measures of diversity, while putting them on a common scale that can be interpreted as an effective number of species.

Hill diversity is typically expressed as a reciprocal of mean average abundance. Here we argue that is simpler to express Hill diversity as a mean "rarity", and also that expressing it this way may clarify some questions related to estimating diversity.

The Hill diversity is defined as:
$$
\left(
	\sum{p_i^q}
\right)^{1/(1-q)}.
$$

Where $$p_i$$ is the proportion of the sampled population consisting of species $$i$$, and $$q$$ is an index. Hill diversities are interesting because they are "effective species numbers" (see below) and because the most common diversity measures (Simpson diversity, Shannon diversity and richness) can all be transformed to Hill numbers (with different indices).

We here choose to interpret Hill diversity as a weighted, filtered mean over the population. We do this by writing $$\ell = 1-q$$, and rewriting the Hill diversity as a power mean:
$$
\left(
	\sum{p_i r_i^\ell}
\right)^{1/\ell}.
$$
This works when $$r_i = 1/p_i$$ -- that is, the Hill diversity is a weighted, filtered mean of the _rarity_ of species in the community.

* Richness (total number of species) now corresponds to $$\ell=1$$: the _arithmetic_ mean of rarity (it's really cool how this works out)

* Shannon-Hill diversity corresponds to $$\ell=0$$: the _geometric_ mean.

* Simpson-Hill diversity corresponds to $$\ell=-1$$: the _harmonic_ mean.

This intuition can blah blah.

Estimation
--------

In addition to helping intuition, this perspective potentially provides insight into estimation. In particular, if we are interested in estimating diversity from a sample, we will in general want to set $$\hat p_i$$, our estimate of $$p_i$$ to be equal to the observed proportion, but in general we will _not_ want to set $$\hat r_i = 1/p_i$$ (for most estimators $$\hat r_i$$ will be larger than $$1/p_i$$, reflecting the fact that our best guess at diversity is larger than the diversity observed in a sample).


Finite pool size
----------------

The standard estimate for Simpson diversity is

$$\hat r_i = (S-1)/(k_i-1)$$ [label:SimpEst]

(rather than $$\hat r_i = S/k_i = 1/\hat p$$). This means in particular that the estimated rarity of a species with one sample observation $$k=1$$ is infinite. Interestingly, this poses no particular problem for taking harmonic means and estimating the Simpson-Hill diversity. But it does mean that we cannont extend this estimate at all to diversities with $$\ell \ge 0$$ (like Shannon-Hill or richness).

We can ask, is there a simple way to generalize this estimate if we think that the sample is taken from a finite (but large) pool size?

The basis of the rarity estimate is that the probability that two samples chosen without replacement from the sample will match is an unbiased estimate of the probability that two samples chosen from the hypothetical infinite pool will match. If we want to consider the pool as finite, we need to define rarity in terms of the probability that two samples chosen from the larger pool _with replacement_ will match. This is because of the reason.

This probability can be estimated from the sample by imagining that we first pick  a focus of type $$i$$, then pick from the large pool by first asking whether the pick is the same _individual_ as the focus, and – if not – picking at random from the other individuals in the sample. This gives a conditional probability estimate of:

$$ \frac{1}{N} + \frac{N-1}{N} \frac{k_i-1}{S-1}.$$

and thus a rarity estimate of: 

$$ \frac{N(S-1)}{N(k-1) + S-k}.$$

We can assume that $$N \gg S$$, so this estimate will be very close to the classical estimate when $$k>1$$; when $$k=1$$, then estimate is $$N$$. These estimates are based on a principled approximation of Simpson diversity, which should correspond to a good (but biased) estimate of Simpson-Hill diversity. The rarities are on the high side, and there may be better values to use when $$\ell > -1$$. On the other hand, these numbers can be used right now to provide an upper estimate that does not (strictly) diverge. It would be interesting to apply to specific cases.
