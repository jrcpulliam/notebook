---
layout: page
title: Pythagorean triples plot
---

Talking with David Earn and Ben Bolker about simple, mathy programs that make nice pictures (for pedagogical reasons).

David suggested plotting Pythagorean triples. He said to reduce them to rationals, but I couldn't figure out a good way to do that (the natural way just produces points on a circle), so I stuck with the integers.

[This code](/notebook/pythagoras.R) plots (a, b) from Pythagorean triples $$a^2+b^2=c^2$$, for $$c\leq50$$. The circles get bigger at rate $$\sqrt{c}$$ (chosen arbitrarily and kind of looks nice). The box goes from (-50, 50) on each axis. It has some nice patterns.

There are two natural ways to interpret these points: as pairs of integers, or (cooler) as complex integers (see also [my post about factoring in the complex plane](http://lalashan.mcmaster.ca/theobio/math/index.php/Complex_factoring)). There are three natural ways to think of the points that are not on the axes, and three corresponding ways to decide which points to plot on the axes:

* If we think of the points as representing [Pythagorean triples](https://en.wikipedia.org/wiki/Pythagorean_triple), in the classic sense, the axes should have no points. This is the first way I made the plot, because that was what was suggested.

* If we think of the points as representing points on the integer lattice that are an integral distance from the origin, the points off the axes remain unchanged, but we should put a point at each lattice point on the axes.

* Finally, if we think of the points as representing square numbers in the complex plane, we should put points at square locations on one of the axes (conventionally, the horizontal axis), but not the other.

Now that I write it down, I realize I didn't actually do any of those things! Sorry! Feel free to tweak the code, but this way looks nice (I simply extended a standard Pythagorean triple definition to _not_ exclude 0; I kind of thought that matched way 3, but it doesn't.)

Based partly on suggestions from Ethan Bolker and myself, I colored the points:

* black for "imprimitive" triples (ones which can be generated as integer multiples of other triples)
* blue for primitive triples which can be factored into other triples _in the complex plane_
* red for triples which are prime _even in the complex plane_ (ie., they represent complex integers which are squares of primes)

Now arise more questions about how to color points on the axes. But I have to get this post off my desk!

![Plot of points from Pythagorean triples](/notebook/git_push/pythagoras.Rout.png)

[pdf version](/notebook/git_push/pythagoras.Rout.pdf)
