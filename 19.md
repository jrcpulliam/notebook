---
layout: page
title: 1/19
---

I was _so_ excited the other night when I realized I had figured out something new and interesting about the decimal expansion of 1/19. Something I hadn't noticed, despite the fact that 1/19 has been one of my favorite decimal expansions for decades.

## Powers of 5

I'll start at the beginning. Repeating decimals tend to have all sorts of cool patterns and properties. A nice simple one about 1/19 is that you can generate it from the powers of 5. More or less.

1/19 is 5/95 = 5/(100-5) ≡ 5/(H-5), where H=100. If we define h=1/H and multiply, then:

1/19 = 5h/(1-5h) = 5 + 5²h + 5³ h² + …

We can try to write that out as:

. 05 25 125 625 3125 … .

Each block here represents a pair of decimal digits, so it's clear that something is wrong: 125 and later entries don't fit. We could arrange them to overlap properly and add:

. 05 26 31 56 … .

But that's pretty unwieldy, and just gets worse and worse. 

The better way is "pre-emptive carrying". Instead of saying "5×5 = 25", we say "5×5 + the 1 that we know we're going to carry in a moment = 26" – and then just carry on as if we always had a 26. Then we multiply 26×5=130, give back the 1 at the beginning, and borrow the 1 that we're about to generate (when we multiply by 5 the next time) to get 31. Pretty wild, but it always works:

```
1/19 = 
.
05        (×5 + 1 = 26) (the one is pre-emptively carried from 131)
26        (×5 + 1 = 131) (the one is pre-emptively carried from 157)
31        (×5 + 2 = 157) (the two is pre-emptively carried from 289)
57        (×5 + 4 = 289) …
89        (×5 + 2 = 447)
47        (×5 + 1 = 236)
36        (×5 + 4 = 184)
84        (×5 + 1 = 421)
21        (×5 + 0 = 105)
05
…
```

### Checking

We can tell it's right because it repeats with the right period (it has to be 18 or a factor of 18, more on that later (probably not, unless someone asks me)), and because it produces the same answer as the other crazy methods we're going to try later.

We can also tell that it's right using `bc`
```
> echo "scale=24; 1/19" | bc -l | perl -pe "s/[0-9]{2}/ $&/g"
. 05 26 31 57 89 47 36 84 21 05 26 31
```

Bizarrely, we _can't_ tell it's right using R:
```
> print(1/19, digits=20)
[1] 0.052631578947368418131
```

R is perfectly willing to give you up to 22 digits, but only seems to get the first 16 right, ever.

### Another power example

Another cool example of pre-emptive carrying, and this sort of series, is 1/49. Try it yourself. This code gives a nice-looking version of the answer, for comparison (or for the lazy)

```
echo "scale=44; 1/49" | bc -l | perl -pe "s/[0-9]{2}/ $&/g"
```

## Dividing by 4

Anyway, that's not the cool part. I've known that forever, thanks largely to Tim Koch.

_Another_ nice way to derive the expansion for 1/19 is by expanding 1/19=21/399.

1/19 = 21/(4H-1) = 21h/(4-h) = 21/4 h + 21/4² h² + …

It would be a huge mess to do this just by blocks, something like:

. 0525 013125 00328125 …

But we can do it neatly with another trick: putting off the remainder. 21/4 = 5, with remainder 1, so we write 05 and then save the 1. For the next step, we put the 1 in front of 05 and 105/4 = 26r1. And so on.

```
1/19 = 
.         21/4 = 5r1
05        105/4 = 26r1
26        126/4 = 31r2 (the 1 is the remainder from the line above)
31        231/4 = 57r3 (the 2 is the remainder from the line above)
57        357/4 = 89r1 …
89        189/4 = 47r1
47        147/4 = 36r3
36        336/4 = 84r0
84        084/4 = 21r0
21        021/4 = 05r1
05
…
```

## Fibonacci style

Same answer. What are the odds‽

But _still_ not the part that got me excited recently. I figured that out decades ago as well.

The reason I'm excited, is that I was recently thinking about [this conversation from 1999](https://groups.google.com/forum/#!search/rec.puzzles$20dushoff$20fibonacci$20repeating$20decimals/rec.puzzles/-0zwc8AS_K4/5U-XavaZZqgJ) (of course). It talks about how:

1/89 = 1/(T² - T - 1) (where T=ten), has an expansion that follows the rules of [the Fibonacci numbers](https://en.wikipedia.org/wiki/Fibonacci_number) (each number is based on the sum of the two before it). So that's cool, but 1/89 is kind of a long expansion, and expanding things in groups of 1 (instead of 2) decimals feels a bit ticky. By the way, there's also a one-digit way to do 1/19: since 19=2T-1, you can expand it by dividing each digit by two (exactly parallel to dividing pairs of digits by 4).  

So the other day, in the shower, I was wondering about 9899 = H² - H -1, and whether it has any nice factors. Imagine my surprise when I found out that 1/19 = 521/9899! That means that we can write the expansion 1/19 using Fibonacci rules.

```
1/19 = 
.         start with the 5 from 521
05        (+ 21 = 26) (the 21 is from 521)
26        (+ 5 = 31)
31        (+ 26 = 57)
57        (+ 31 + 1 = 89) (the one is pre-emptively carried from the next sum)
89        (+ 57 + 1 = 147) …
47        (+ 89 = 136)
36        (+ 47 + 1 = 84)
84        (+ 36 + 1 = 121)
21        (+ 84 = 105)
05
…
```

Yet another fun way to generate the same decimal! I can die happy now.
