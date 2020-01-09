---
layout: page
title: Tsetse conflation simulations
---

[This code](/notebook/conflation.R) simulates the results that deMeeus might have gotten if:

* their explicit assumptions were all correct
* their density estimates are measured with error

Here is the “most average” of 1000 simulations:

![Average simulation](/notebook/git_push/conflation.Rout-1.png) 

And here is a histogram of the correlation values observed in all 1000 simulations.
![A histogram of correlation values](/notebook/git_push/conflation.Rout-0.png). 

This is pushed far to the left, but still not as far as deMeeus's reported values (which could possibly indicate that there is some evidence of the effect they think they saw, but they would need to do it right, and worry about other sources of conflation).

[Nicer (pdf) versions of the pictures](/notebook/git_push/conflation.Rout.pdf)
