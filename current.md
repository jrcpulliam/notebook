---
layout: post
title: Moment framework
slug: Moment framework
---

A coexistence result I found many years ago for Jeremy Lichstein, with help from Joshua Weitz. Fred Adler thinks that Peter Chesson already knows it.

Imagine a patch model where each species produces propagules with a _distribution_ of qualities, and empty patches are filled by the highest-quality propagule that arrives. Such a system has a strong (and maybe surprising) tendency to coexistence, meaning (roughly) that if two species have different seed-quality distributions, but are roughly equally matched, each will invade the other (rather than each excluding the other).

Conceptually, I think this is because each species' quality density is stronger where it is stronger, so that, all else equal, removing conspecifics (making the environment more like the heterospecific environment) is more likely to help a particular individual take over a site than removing heterospecifics would be.

To show the result, I compute the probability of success of an individual trying to invade an established community, and then show that the sum of cross-invasion probabilities for any two distinct species is greater than the sum of self-invasion probabilities.

Imagine a resident species at equilibrium in a patch model. Any given available patch will be subject to a rain of propagules -- let's say $$i$$ propagules with probability $$p_i$$. We construct the generating function $$P(x) = \sum{p_i x_i}$$.
