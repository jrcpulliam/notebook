# notebook (gh-pages branch, which is the only one I use)
# http://localhost:4111/notebook/are.html
# http://localhost:4111/notebook/
# http://dushoff.github.io/notebook/
# make serve ##

## Suppress pandoc (don't want to pandoc here, we want to make serve instead)

## URL problem:
## Use relative pathnames for plain pages; /notebook/ for posts.
## Move on!

### Hooks for the editor to set the default target
current: target
-include target.mk

-include makestuff/perl.def

######################################################################

## COVID curves with Bolker

# flattening.Rout.pdf.gp:
## http://dushoff.github.io/notebook/git_push/flattening.Rout.pdf
flattening.Rout: flattening.R

######################################################################

recursive_logs.Rout: recursive_logs.R

## Statistical foundations/philosophy

Sources += exponential_tails.md

exponential_tails.Rout: exponential_tails.R


######################################################################

StochasticModels_Lab1.Rout: StochasticModels_Lab1.R
## Crazy stats (error and conflation)
## Inspired by the tsetse

Ignore += tsetse
tsetse: dir=~/Dropbox
tsetse:
	$(alwayslinkdir)
tsetse_density.Rout: tsetse/deMeeus.csv tsetse_density.R
conflation.Rout: conflation.R
Sources += conflation.md
conflation_products: conflation.Rout-0.png.gp conflation.Rout-1.png.gp conflation.Rout.pdf.gp

######################################################################

## Levin sums

powerSum.Rout: powerSum.R

powerSum.out: powerSum.pl
	$(PUSH)

## Adler palindromes

alpal.Rout: alpal.R

######################################################################

## Bolker-style google sheet doodle poll
## I spent too much time on this, but did it wrong
## Dates and times should be unitary, so that it can calculate 
## when it's tomorrow somewhere
## Or else, just add an asterisk?
## That would be better for matching the current mixed line format

## See google spreadsheets (QMEE 2019, Theobio lab, searched for times of day)
Ignore += doodle.csv
Sources += doodle.in
doodle.csv: doodle.in doodle.pl
	$(PUSH)

######################################################################

## EPL table insanity

premiere.Rout: premiere.R

imputation.Rout: imputation.R

ind_ricker.Rout: ind_ricker.R

## Baseball hit streaks (inefficient confirmation of easy algebra)
streak.Rout: streak.R

## And how does identical work?
identical.Rout: identical.R

Sources += $(wildcard *.mac)
Ignore += *.out
max = maxima < $< | tee $@

## Binomial random effects
## I don't know why I thought this integral was doable
randInt.out: randInt.mac
	$(max)

## What is a correlation matrix?
correlate.Rout: correlate.R rclean.pl
	R --vanilla < $< | perl -wf rclean.pl > $@

######################################################################

## Share on twitter or somewhere?
## Developed from Brent D.
## Moved here for Mike R.

colors.Rout: colors.R
colors.Rout.png: colors.R
Ignore += colors.small.png
colors.small.png: colors.Rout.png
	convert -scale 10% $< $@

######################################################################

## Elisha and tsetse

Sources += are.md

######################################################################

## Is this whole section about dimension and Susan Holmes?

## Li's lambda
lambda.Rout: lambda.R
lampix.Rout: lambda.Rout lampix.R

## Magnificent mu
mu.Rout: mu.R
mupix.Rout: mu.Rout mupix.R

## What is dimension?
balls.Rout: balls.R

######################################################################

## Knitting (hybrid ideas brought together 2019 Jun 25 (Tue))

mre.md: mre.rmd
	Rscript -e "knitr::knit('$<')"

mre.rmd.md: mre.md
	Rscript -e 'library("rmarkdown"); render("$<", output_format="md_document", output_file="$@")'

## Wiki import dev

%.rmd: %.wikitext wtrmd.pl
	$(PUSH)

## rmd ⇒ md pipeline

## ebolaRisk.rmd: ebolaRisk.wikitext wtrmd.pl
## nomogram.md: nomogram.rmd
## permBinom.md: permBinom.rmd
## permTables.md: permTables.wikitext; pandoc -f mediawiki -o $@ $<

Ignore += *rmd_files

%.rmd.md: %.rmd
	Rscript -e 'library("rmarkdown"); render("$<", output_format="md_document", output_file="$@")'

%.yaml.md: %.rmd
	perl -nE "last if /^$$/; print; END{say}" $< > $@

%.md: %.yaml.md %.rmd.md
	$(cat)

######################################################################

## Bail on googlesheets package because it requires "publishing"
maya.Rout: maya.R

## ln -s ~/Dropbox/maya ##
Ignore += maya
## https://docs.google.com/spreadsheets/d/1qTYPV7PXb_5EVyG2SoxuAdlzXRfvJxgRUOwAgbYwS7s/edit#gid=581089094
## downcall maya/blood.xlsx ##
blood.Rout: maya/blood.xlsx blood.R
## maya/notes.txt

######################################################################

## mkdir MMEDaccounts ##
Ignore += MMEDaccounts

## downcall MMEDaccounts/2019.xlsx ##
mmed2019.Rout: MMEDaccounts/2019.xlsx MMEDaccounts.R
	$(run-R)

######################################################################

# Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl

Ignore += *.post
## colors.post: 
%.post: %.post.md post.pl
	$(PUSH)
	$(shell_execute)
%.post.md: %.md
	perl -npe 's/layout:\s+page/layout: post/' $< > $@

## sucker bet

alice.Rout: alice.R

##################################################################


## Early Trapman-interval math. Should be subsumed by Park et al. MS
# http://localhost:4111/notebook/conditional_kernel.html
conditional_kernel.html: conditional_kernel.md

combinations.Rout: combinations.R

## This was a live-coding statistical sampling session; not sure why it was ever here or if I ever put it somewhere good.
vitaminA.Rout: vitaminA.R

## Unitary fractions game (with Gavin)
unitary.Rout: unitary.R
birthday.Rout: unitary.Rout birthday.R
fourunits.Rout: unitary.Rout fourunits.R

## A numeric check about volumes in a martini glass (a problem which confused me)
martini.Rout: martini.R

## It seems impossible that this was ever useful
quiz.Rout: quiz.R

## pandigital fibs
pf.Rout: pf.R
pf.out: pf.pl
	$(PUSH)

## Testing the RData pipeline??
## Answer: you need better documentation
## Also: RData is generally hidden in wrapR, since it's meant to be called indirectly
wrap.Rout: wrap.R
unwrap.Rout: wrap.Rout unwrap.R

gamma_shape.Rout: gamma_shape.R

# Log-plus-one as a scale
log1p.Rout: log1p.ssv log1p.R

Sources += walt.in
walt.out: walt.in walt.pl
	$(PUSH)

######################################################################

## checkplots and millipedes

Sources += checkplots.Rmd

####### Modularized diagnostic plots
## checkFuns.R ##

### Sets of fake data

lndata.Rout: lndata.R
gamdata.Rout: gamdata.R
tdata.Rout: tdata.R
cauchy.Rout: cauchy.R

## Stats on a list of lists of fake data (or something)

lndata.liststats.Rout:
%.liststats.Rout: %.Rout liststats.R
	$(run-R)

## checkplot
## http://dushoff.github.io/notebook/git_push/lndata.listplots.Rout.pdf
## lndata.listplots.Rout: listplots.R
## gamdata.listplots.Rout: listplots.R
## tdata.listplots.Rout: listplots.R
## cauchy.listplots.Rout: listplots.R
%.listplots.Rout: %.liststats.Rout checkFuns.Rout listplots.R
	$(run-R)

## lndata.pianoPlots.Rout: pianoPlots.R
## gamdata.pianoPlots.Rout: pianoPlots.R
## tdata.pianoPlots.Rout: pianoPlots.R
## cauchy.pianoPlots.Rout: pianoPlots.R
%.pianoPlots.Rout: %.liststats.Rout checkFuns.Rout pianoPlots.R
	$(run-R)

## tdata.rangePlots.Rout: rangePlots.R
%.rangePlots.Rout: checkFuns.Rout %.liststats.Rout rangePlots.R
	$(run-R)

## lndata.slugPlots.Rout: slugPlots.R
## gamdata.slugPlots.Rout: slugPlots.R
## tdata.slugPlots.Rout: slugPlots.R
## cauchy.slugPlots.Rout: slugPlots.R
%.slugPlots.Rout: checkFuns.Rout %.liststats.Rout slugPlots.R
	$(run-R)

## tdata.rangePlots.Rout: rangePlots.R
%.rangePlots.Rout: %.liststats.Rout checkFuns.Rout rangePlots.R
	$(run-R)

## What is this??
roswellCheck.Rout: roswellCheck.R

### How to do the binomial?

binom.Rout: checkFuns.Rout binom.R

blaker.Rout: blaker.R

### The simplest example
freqPiano.Rout: checkFuns.Rout freqPiano.R

######################################################################

## Constrained quadratic
## Arising from rubella project

cq.Rout: cq.R

meeus.Rout: meeus.R

######################################################################

## materials and products are both deprecated for git_push; wonder if anything there matters
## Materials

allmd = $(wildcard *.md)
rmd = $(wildcard *.rmd)
rmdmd = $(rmd:rmd=md)

notmd += $(wildcard *.post.md *.yaml.md *.rmd.md) $(rmdmd)
sourcemd = $(filter-out $(notmd), $(allmd))

Sources += $(rmd) $(sourcemd) updates.html
Ignore += $(notmd)

# Sources += $(wildcard materials/*.*)
Sources += $(wildcard _drafts/*.md)

## Things made here that we want to be visible
# Sources += $(wildcard products/*.*)
products:
	mkdir $@

products/%: % products
	$(CP) $< $@

## sublime and excellent models
## sublime.md
## sublime.Rout: sublime.R

Sources += sublime.in
sublime.out: sublime.in sublime.pl
	$(PUSH)


######################################################################

## Boot camp

## mkdir boot ##
## downcall boot/ ##
Ignore += $(wildcard boot/*)

############## simple incidence -- bailed for time (and dis-modularity of old work flow)
incidence.Rout: boot/inc01.xls fitting_code/routines.Rout incidence.R
	$(run-R)

pardirs += fitting_code

Ignore += $(pardirs)

######################################################################

# Scripts

Sources += $(wildcard *.R *.pl)

filledCircle.Rout: filledCircle.R

pythagoras.Rout: pythagoras.R

cards.Rout: cards.R

logistic.Rout: logistic.R

19.html: 19.md

nmds_comp.Rout: nmds_comp.R

islr_boot.Rout: islr_boot.R

# Ongoing
moments.html: moments.md
moments.Rout: moments.R

######################################################################

# http://localhost:4111/notebook/diversity.html: diversity.md

## Branch text, hopefully for a manuscript
Ignore += rarity.html
rarity.html: rarity.md

## Playing with Simpson
simpson.Rout: simpson.R
checkplot.Rout: checkplot.R

## Shannon samples
## Terrible scattershot approach; not sure this will ever work
## Idea was to come up with an formula for expected sample Shannon diversity
## to make better fake diversity communities
shannon.Rout: shannon.R

######################################################################

# Developing
sir.Rout: sir.R
tmp.Rout: tmp.R
lecture.Rout: lecture.R

# Simple fitting of growing-epidemic data (Chowell, Bernardin)
genFit.md:
genFit.Rout: genFit.R

##################################################################

## Testing

deriv.Rout: deriv.R

### Rec math (other stuff?)

elves.out: elves.pl
	$(PUSH)
elves.html: elves.md

## Batting averages
Ignore += average.out
average.out: average.pl
	$(PUSH)
average.md:
average.Rout: average.out average.R

### Hmm. this all seems a bunch of nonsense. Understand (document?) before trying to hack.
Ignore += era.out
era.out: era.pl
	$(PUSH)
era.Rout: era.out era.R

## Fractions
fractions.Rout: fractions.R

##################################################################

## MRE about R craziness

## Can't reproduce which.max craziness from 3SS!
which.Rout: which.R

##################################################################

# Blogging
## CP raw html suppresses mathjax (somehow)
## CP rendered html doubles mathjax (fix by hand?)
## Blogger is just absolutely fricking crazy about <p>, <br> and <div> tags. No easy fix for this, either.

# Maybe just give up on blogger…

Ignore += *.cp.html
## pythagoras.cp.html: cp.pl
%.cp.html: _site/%.html cp.pl
	$(PUSH)

######################################################################

## Studying imputation

## Learn about MICE

mice.Rout: mice.R

Sources += mice.md

######################################################################

## A probably stupid attempt to process information about airline movies
## Actually, could be useful for taking a list of movies to look up on rt and not worrying so much about Air Canada nonsense.
## Could modularize AC parsing and RT linking. In theory.
## … interrupted in the middle to do work

# http://localhost:4111/notebook/ac.html
## ac.md: ac.dump rotten.pl; $(PUSH)

# Images

# Things we want pushed and referred to
LocalImages = $(ImageTargets:%=images/%)
Sources += $(LocalImages)
$(LocalImages): images/%: %
	$(copy)

# Aesthetics

# Notebook picture
Sources += notebook.jpg
banner.jpg: notebook.jpg
	convert $< -crop 4096x1600+0+350 $@

# Jekyll

not:
	$(RMF) about.md feed.xml

## Using underscore because we don't want to track .lock file
Sources += _config.yml $(wildcard Gemfile_*)
Sources += _includes/* _layouts/* css/* _sass/*

Ignore += .sass-cache/ Gemfile Gemfile.lock _site/

Gemfile:
	/bin/ln -s Gemfile_sb $@

######################################################################

### Makestuff

Sources += Makefile

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
-include makestuff/wrapR.mk
-include makestuff/pandoc.mk
