---
layout: page
title: Conditional kernels
---

We imagine kernels indexed across an aspect space $A$. Thus the unconditional, population-level kernel is:

$$k(\tau) = \int{k_a(\tau) dA}$$

$\hat k$

$k$



The conditional kernel for an individual is:

$$k_a(\tau) = k_a(\tau)\exp(-\delta_a \int{k_a(\sigma) d\sigma})$$,

$\delta$ is the dilution (one over the degree, or the mean degree or something). Dilution could be individual-specific or not, might as well keep it general.
