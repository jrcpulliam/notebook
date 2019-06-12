---
layout: page
title: Insect geometry
---

## Assumptions

We assume
* there are three important points in the tsetse life cycle: deposition (as a larva); emergence (as a young adult); and ovulation
* the ovulation loop is constant with age

## Model

We don't decide in advance when we count tsetses: it could be at any of three key points. We are going to construct a model that should work for any counting point in that range.

The key parameters are:
* $$p_c$$, the probability of survival from deposition to counting time
* $$p_o$$, the probability of survival from counting time to ovulation
* $$p_\ell$$, the probability of successfully completing a loop

Some notes:
* $$p_c$$ should include the probability of being female, since we're only going to count females. We are therefore not particularly interested in the case $$p_c=1$$.
* We suspect that we _are_ particularly interested in the case $$p_o=1$$, however (corresponding to not counting flies until they ovulate).
* Changing the counting time should correspond to changing $$p_c$$ and $$p_o$$, but keeping their product $$p_r=p_cp_o$$ the same.

## Hypotheses

* We can explicitly link John's framework to this framework

* We should recover the same reproductive number R and extinction probability from 1 female (assuming sufficient males) for different decompositions of $$p_r=p_cp_o$$.

* If we set $$p_o=1$$, corresponding to counting females already on the loop, we should recover the regular geometric distribution. Otherwise, we have a composed Bernoulli-geometric distribution (which we can provisionally call the Are distribution).

## Next steps

* Elisha should attempt to confirm, challenge or refute each of the hypotheses.
