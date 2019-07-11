---
layout: page
title: Are distributions
---

Get a copy of a diagram (or diagram code) from Elisha

My current thought is that we should have:

* $$p_r$$ is the probability that a deposited larva reaches the ovulation loop. this is a product, $$p_r$$ = $$p_c p_m$$
	* $$p_c$$ is the probability that a deposited larva reaches whatever stage we imagine counting at
	* $$p_m$$ is the probability that a counted larva reaches the ovulation loop
* $$p_\ell$$ is the probability of successfully completing the loop
* $$p_d$$ is the probability of depositing an egg, given loop completion

Results:

* R should depend on $$p_r$$ but not on $$p_c$$ or $$p_m$$
* Extinction probability $$E$$ _should_ depend on where we count:
	* Forever probability $$F=1-E$$ should be $$\frac{p_m(R-1)}{R}$$
