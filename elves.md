---
layout: page
title: Advent of Elves
---

Walt sent [this problem from Advent of Code](http://adventofcode.com/2016/day/19), and also this follow up:

    Realizing the folly of their present-exchange rules, the Elves agree
    to instead steal presents from the Elf directly across the circle. If
    two Elves are across the circle, the one on the left (from the
    perspective of the stealer) is stolen from. The other rules remain
    unchanged: Elves with no presents are removed from the circle
    entirely, and the other elves move in slightly to keep the circle
    evenly spaced.

    Which Elf now gets all the presents?

I solved the first one in the shower, and the second on a piece of paper on a long car trip. Walt (and therefore I) had to deal with ~3e6 elves.

I got excited about the second one, and wrote [this perl script](/notebook/elves.pl), which calculates my pattern-based formula (peek for a spoiler), and also runs a fairly slick (IMO) recursive function to calculate the answer. I wish I could say I was all excited that they gave the same output, but in reality, I got verification from Walt just as soon as I did the paper-pencil version, so got little additional validation from the sim.

I should _really_ write similar sim and calc code for the adjacent elves, and may at some point… in fact, I'll leave this in current for a while and hope that I do that.
