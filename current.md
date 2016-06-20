---
layout: post
title: Epidemic tSIR
slug: Epidemic tSIR
---

Cara Brook introduced a [very nice practical SIR experiment using cards](http://mmed2016.ici3d.org/tutorials/Directions_Epidemic_Card_Game.pdf) to [MMED](http://mmed2016.ici3d.org/). But the resulting data were very hard to analyze.

Summary
-------

We assumed that the number of infectious and susceptibles were perfectly known; it therefore seems like it should be pretty easy to infer the one missing parameter (which corresponds to $$R_0$$.

I encountered three problems:

* The log-link binomial approach which seems most natural is unstable. This is because the log link does not constrain the probability to be <1. 
  * This can be solved by using a `cloglog` approach; but see below.

* `lme4` has a lot of trouble solving the `cloglog` model.
  * This seems to be due to initialization bugs and optimizer problems.
  * In response to this problem, Ben Bolker has updated the development version of `lme4` and provided some code with optimizer flags that allows `lme4` to fit these data

* The cards simulations don't match the `cloglog` assumptions. In particular, if we expect 26 infections in a population of 26, _all_ of the susceptibles will be infected with probability 1, which would correspond to an infinitely high $$R_0$$.
  * This matches the assumptions of the (unstable) log-link approach, but not those of the stable `cloglog` approach.
  * I don't guess there is an easy way around it without spinning our own maximum likelihood. I did try adding some second-order terms to the cloglog; this helps a little.
  * I have code which makes data that matches the hazard-based assumptions; the `cloglog` model fits these perfectly, but can't fit the data simulated with the real "cards" assumptions.

Code
----

* [Card simulations](https://github.com/dushoff/scratch/blob/Cards1.0/cards/sim.R)
* [Add an alternative variable for next-step infections (matching the hazard assumptions)](https://github.com/dushoff/scratch/blob/Cards1.0/cards/fakesim.R)
  * [Analyze these pretty data and get nice answers (both fixed-effect and random-effect models)](https://github.com/dushoff/scratch/blob/Cards1.0/cards/binfits.R)
* [Analyze the original simulations (matching the actual cards assumptions) and fail to get nice answers, even with a second-order effort](https://github.com/dushoff/scratch/blob/Cards1.0/cards/cardfits.R)
