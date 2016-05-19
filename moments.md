---
layout: page
title: Moment framework
slug: Moment framework
---

Working with Daniel Park on generalized exponentials (in theory), but we've gotten deeply into a bunch of moment stuff related to my thesis. On the bus today, while I was missing the stop, I started thinking yet again about terminology.

I think I want to try writing $$Y_o(v; D)$$ for T**y**pe, **o**rder, **v**ariable, **D**omain.

My first type is total, $$T$$. Specifically, $$T_o(v; D) = \int v(a)^o D(a) da$$.

Examples:

* $$T_0(.;S)\equiv T(S)$$ is the total number of susceptibles ($$v$$ doesn't affect anything when $$o=0$$). 

* $$T_1(\sigma; I)$$ is the total _amount_ of susceptibility to infection in the infectious population


## SI example

I want to integrate:
$$
\dot S(a) = -\Lambda \sigma(a) S(a)
$$

$$a$$ is an abstract "aspect variable" that indexes the population.

to get:

$$\dot T_0(\sigma; S) \equiv \dot S = -\Lambda T_1(\sigma; S)$$

More generally, I can multiply both sides by $$\sigma^i$$ and integrate to get:

$$\dot T_i(\sigma; S) \equiv \dot S = -\Lambda T_{i+1}(\sigma; S)$$

Now define:

$$M_i(.) = T_i(.)/T_0(.)$$.

Then: $$\dot M_i = \frac{\dot T_i}{T_0} - M_i\frac{\dot T_0}{T_0}$$.

Thus: $$\dot M_i(\sigma; S) = -\Lambda \left(M_{i+1}(\sigma; S) - M_i(\sigma; S) M_1(\sigma; S)\right) $$.

In particular, we define $$M\equiv M_1$$ and suppress the arguments to write:

$$ \dot S = -\Lambda MS. $$

$$ \dot M = -\Lambda(M_2 - M^2). $$

The Dwyer-Dushoff assumption is that $$M_2 = (1+\kappa) M^2$$, with κ constant. This closes the chain, and we can then integrate to find: 

$$M = \hat M S^\kappa$$. $$\hat M$$ is the value of $$M$$ when everyone is susceptible; observed values are lower.

We can define $$κ = κ_2$$ and extend this idea to $$\kappa_i = \frac{M_iM_{i-2}}{M_{i-1}^2} - 1.$$

[[Equation chain for the κs]]. Can we get some understanding from the equation for κ itself?

## SIS model

[[Can we extend the above to cover this case?]]
