Intro
-----

Thinking about how to model hazard in a population with heterogeneous
susceptibility. Strongly related to the work done specifically for moth
viruses, and specifically for the gamma distribution, at [gamma
speculations](gamma_speculations "wikilink"). Note that the
\"Approximation\" section makes an approximation that is exactly
equivalent to assuming gamma distributions.

### Links

-   [Generalized exponential](Generalized_exponential "wikilink") shows
    that this works perfectly for gammas, but worse than expected for
    other distributions. I think.
-   [Heterogeneous susceptibility
    simulations](Heterogeneous_susceptibility_simulations "wikilink")
    seems to have nothing good.

Framework
---------

Imagine a population of \"surviving\" individuals, with heterogeneous
susceptibility distribution \$\$N(s)\$\$ that is exposed to a force of
infection \$\$f(t)\$\$ such that an individual with susceptibility
\$\$s\$\$ experiences hazard \$\$s f(t)\$\$.

Definitions
-----------

\$\$N\_k \\equiv \\int{s\^k N(s)\\,ds}\$\$. Thus, \$\$N \\equiv N\_0\$\$
is the size of the surviving population. \$\$N\_1\$\$ would be the total
amount of susceptibility, which is awkward, and inspires our next set of
moments:

\$\$s\_k \\equiv N\_k/N\$\$. Thus, \$\$\\bar s \\equiv s\_1\$\$ is the
mean susceptibility in the surviving population. \$\$s\_2\$\$ is
\$\$\\bar s\^2 + \\sigma\_s\^2\$\$, which is awkward, and inspires the
definition:

\$\$\\kappa \\equiv s\_2/\\bar s\^2 - 1\$\$. \$\$\\kappa\$\$ is the
squared coefficient of variation of susceptibility in the surviving
population.

\$\$F \\equiv \\int{f(t)\\,dt}\$\$ is the cumulative force of infection
experienced.

Dynamics
--------

The distribution of surviving individuals will obey the \"master
equation\":

\$\$\\frac{dN(s)}{dF} = -sN(s)\$\$.

Integrating over \$\$s\$\$ gives:

\$\$\\frac{dN}{dF} = -sN(s)\$\$ \$\$= -N\_1\$\$ \$\$=-\\bar s N\$\$,
which is nice and makes sense: the instantaneous change in the number of
survivors is predicted by the *mean* susceptibility.

The cool part is that we can multiply the master equation by
\$\$s\^k\$\$ and get a chain of moment equations:

\$\$\\frac{s\^k dN(s)}{dF} = -s\^{k+1}N(s)\$\$, and integrating gives

\$\$\\frac{dN\_k}{dF} = -N\_{k+1}\$\$ \$\$=-s\_{k+1} N\$\$.

In particular, when \$\$k=1\$\$, we can calculate how the mean
susceptibility changes:

\$\$\\frac{dN\_1}{dF} = -s\_2 N\$\$.

Using the quotient rule:

\$\$\\frac{d\\bar s}{dF} = -s\_2 + \\bar s\^2 = -\\kappa\\bar s\^2\$\$.

We could continue the moment chain, but we will stop here by making an
approximation. We assume that the unitless squared CV \$\$\\kappa\$\$
remains constant (this will be exactly true if \$\$N(s)\$\$ is gamma
distributed).

Approximation
-------------

### How susceptibility changes {#how_susceptibility_changes}

Using the approximation of constant \$\$\\kappa\$\$, we can solve the
dynamics of \$\$\\bar s\$\$:

\$\$\\bar s = \\frac{s\_0}{1+\\kappa Fs\_0}\$\$. We can also set
\$\$s\_0\$\$ to 1, by calibrating \$\$F\$\$ to be equivalent to the mean
hazard for the starting population. Then

\$\$\\bar s = \\frac{1}{1+\\kappa F}\$\$.

### Survival

The proportion surviving follows:

\$\$\\frac{dN}{dF} = -\\bar s N = \\frac{N}{1+\\kappa F}\$\$,

which is solved by what I call the [generalized
exponential](generalized_exponential "wikilink"):

\$\$N/N\_0 = (1+\\kappa F)\^{-1/\\kappa} \\equiv X(F; \\kappa)\$\$

### Susceptibility vs. survival {#susceptibility_vs._survival}

What is the relationship between mean susceptibility and proportion
surviving? Should this be suggested as an alternative to Granich
heterogeneity?

The answer looks like \$\$\\bar s = X\^\\kappa\$\$; in Granich terms,
something like \$\$\\beta \\propto (1-P)\^\\kappa\$\$.
