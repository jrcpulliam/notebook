---
layout: page
title: Simple fits for non-exponential epidemics
---

The standard equation for fitting a growing epidemic is $$\dot x = \lambda x$$, yielding

$$x(t) = x_0 \exp(\lambda t).$$

The next simplest thing (or at least, one alternative for the next simplest thing), is $$\dot x = \lambda x^{1-b}$$, yielding

$$x(t) = (\lambda t + x_0^b)^{1/b}.$$

These match if we take the limit as $$b\to 0$$. If $$b>0$$, we get sub-exponential growth, whereas $$b<0$$ leads to super-exponential growth (and should lead to finite-time divergence, but I don't see why yet!)
