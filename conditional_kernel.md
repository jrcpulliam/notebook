---
layout: page
title: Conditional kernels
---

Framework
=========

We imagine kernels indexed across an aspect space $A$. Thus the unconditional, population-level kernel is:

$$k(\tau) = \int{k_a(\tau) dA}$$

The conditional kernel for an individual is:

$$\hat k(\tau) = k_a(\tau)\exp(-\delta_a \int{k_a(\sigma) d\sigma})$$,

$$\delta$$ is the dilution (one over the degree, or the mean degree or something). Dilution could be individual-specific or not, might as well keep it general.

The conditional kernel for the population is:

$$\hat k(\tau) = \int{\hat k(\tau) dA}$$

SIR
===

SIR corresponds to $$k_D(\tau) = \beta H(D-\tau)$$; $$dA = \gamma\exp(-\gamma D)\,dD$$, where $D$ is the duration of an individual infection.




