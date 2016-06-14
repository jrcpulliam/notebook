---
layout: post
title: Epidemic tSIR
slug: Epidemic tSIR
---

The probability that a susceptible will escape $$R_0 I$$ contacts on a population of size $$N$$ is $$(1-1/N)^{R_0 I}$$ $$\approx \exp(-R_0 I/N)$$.
 Thus, the expected number infected is approximately $$S (1-\exp(-R_0 I/N))$$. I guess this doesn't lend itself well to Poisson, but does lend itself to a cloglog binomial. Should investigate.
