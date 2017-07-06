I was _so_ excited the other night when I realized I had figured out something new and interesting about the decimal expansion of 1/19. Something I hadn't noticed, despite the fact that 1/19 has been one of my favorite decimal expansions for decades.

I'll start at the beginning. Repeating decimals tend to have all sorts of cool patterns and properties. A nice simple one about 1/19 is that you can generate it from the powers of 5. More or less.

1/19 is 5/95 = 5/(100-5) ≡ 5/(H-5), where H=100. If we define h=1/H and multiply, then:

1/19 = 5/(1-5h) = 5 + 5×5 + 5×5^2 + …

We can try to write that out as:

. 05 25 125 625 3125 … .

Each block here represents a pair of decimal digits, so it's clear that something is wrong: 125 and later entries don't fit. We could arrange them to overlap properly and add:

. 05 26 31 56 … .

But that's pretty unwieldy, and just gets worse and worse. 

The better way is "pre-emptive carrying". Instead of saying "5×5 = 25", we say "5×5 + the 1 that we know we're going to carry in a moment = 26" – and then just carry on as if we always had a 26. Then we multiply 26×5=130, give back the 1 at the beginning, and borrow the 1 that we're about to generate (when we multiply by 5 the next time) to get 31. Pretty wild, but it always works:

```
1/19 = 
.
05        (×5 + 1 = 26)
26        (×5 + 1 = 131)
31        (×5 + 2 = 157)
57        (×5 + 4 = 289)
89        (×5 + 2 = 447)
47        (×5 + 1 = 236)
36        (×5 + 4 = 184)
84        (×5 + 1 = 421)
21        (×5 + 0 = 105)
05
…
```

We can tell it's right because it repeats with the right period (it has to be 18 or a factor of 18, more on that later (probably not, unless someone asks me)), and because it produces the same answer as the other crazy methods we're going to try later. Bizarrely, we _can't_ tell it's right using R:

```
> print(1/19, digits=20)
[1] 0.052631578947368418131
```

R is perfectly willing to give you up to 22 digits, but only seems to get the first 16 right, ever.

Another cool example of pre-emptive carrying, and this sort of series, is 1/49. Try it yourself. This code gives a nice-looking version of the answer, for comparison (or for the lazy)

```
echo "scale=44; 1/49" | bc -l | perl -pe "s/[0-9]{2}/ $&/g"
```
