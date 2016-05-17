---
layout: post
title: Martini glass
slug: Martini glass
---

Timothy Peeters asks:

> It’s Friday. You’ve kicked your feet up and have drunk enough of your martini that, when the conical glass is upright, the drink reaches some fraction p of the way up its side. When tipped down on one side, just to the point of overflowing, how far does the drink reach up the opposite side?

It's a good thing I misunderstood this question. I looked at the diagrams Tim posted, and started thinking of a _triangular_ martini glass. Otherwise, I would certainly have given up. I almost did anyway, but I was stuck in the shower, and didn't have anything else to think about, so I stuck with it. I came up with the answer, and went to sleep feeling very pleased with myself, but woke up suddenly worried about whether the martini glass was really triangular (it's not).

## The 2-dimensional solution.

Let the area of the whole glass be 1. Then the area filled by the martini is $$p^2$$ (both the base and height of the filled triangle are $$p$$ as great as the whole triangle).

Let the proportion of the opposite side covered be $$q$$. When $$q=1$$, the area also has to be 1 (the glass is full). So we only need to know how the area _scales_ with $$q$$

Let the proportion of the opposite side covered be $$q$$. When $$q=1$$, the area also has to be 1 (the glass is full). So we only need to know how the area _scales_ with $$q$$. The answer is that the area is simply _proportional_ to $$q$$ -- we can treat the full side as the base of the triangle, and then it makes sense that perpendicular should be proportional to the distance the triangle extends on the other side. There's also some theorem about area if you know an angle and the sides adjacent to it -- we don't need to know the exact theorem (probably $$ab\sin(\theta)/2$$) to know that it must scale in proportion to each side. So the filled area is $$p^2$$ of the whole area, and also $$q$$ of the whole area, so $$q=p^2$$

## The real problem

So I woke all worried about this. It's obvious in the three-dimensional case that the proportion of the _volume_ filled is $$p^3$$. The volume filled when you tilt seems like it should either be $$q$$ or $$q^2$$. I went through the cabinets looking for anything shaped like a martini glass while cooking breakfast, but couldn't find anything. My best guess is that the volume is proportional to $$q$$, but I'm not feeling very confident. It would be nice to have a cone to play with.
