---
layout: page
title: Tsetse conflation simulations
---

[This code](/notebook/conflation.R) simulates the results that deMeeus might have gotten if:

* their explicit assumptions were all correct
* their density estimates are measured with error

![The most average of 1000 simulations](/notebook/git_push/conflation.Rout-0.png) 

![A histogram of the correlation values observed in 1000 simulations](/notebook/git_push/conflation.Rout-1.png). This is pushed far to the left, but still not as far as deMeeus's reported values (which could possibly indicate that there is some evidence of the effect they think they saw, but they would need to do it right, and worry about other sources of conflation).

[Nicer (pdf) versions of the pictures](/notebook/git_push/conflation.Rout.pdf)

There are two natural ways to interpret these points: as pairs of integers, or (cooler) as complex integers (see also [my post about factoring in the complex plane](http://lalashan.mcmaster.ca/theobio/math/index.php/Complex_factoring)). There are three natural ways to think of the points that are not on the axes, and three corresponding ways to decide which points to plot on the axes:

* If we think of the points as representing [Pythagorean triples](https://en.wikipedia.org/wiki/Pythagorean_triple), in the classic sense, the axes should have no points. This is the first way I made the plot, because that was what was suggested.

* If we think of the points as representing points on the integer lattice that are an integral distance from the origin, the points off the axes remain unchanged, but we should put a point at each lattice point on the axes.

* Finally, if we think of the points as representing square numbers in the complex plane, we should put points at square locations on one of the axes (conventionally, the horizontal axis), but not the other.

Now that I write it down, I realize I didn't actually do any of those things! Sorry! Feel free to tweak the code, but this way looks nice. I simply extended a standard Pythagorean triple definition to _not_ exclude 0 (I kind of thought that matched way 3, but now it doesn't.)

Based partly on suggestions from Ethan Bolker, I colored the points:

* black for "imprimitive" triples (ones which can be generated as integer multiples of other triples)
* blue for primitive triples which can be factored into other triples _in the complex plane_
* red for triples which are prime _even in the complex plane_ (ie., they represent complex integers which are squares of primes)

Now arise more questions about how to color points on the axes. But I have to get this post off my desk!
