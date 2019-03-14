# notebook (gh-pages branch, which is the only one I use)
# http://localhost:4111/notebook/
# http://dushoff.github.io/notebook/
# make serve

## Suppress pandoc (don't want to pandoc here, we want to make serve instead)

## URL problem:
## Use relative pathnames for plain pages; /notebook/ for posts.
## Move on!

### Hooks for the editor to set the default target
current: target
-include target.mk

##################################################################

## Edit hooks
# make files

Sources = Makefile README.md LICENSE.md

ms = makestuff
Sources += $(ms)
Makefile: $(ms)/Makefile

$(ms)/%.mk: $(ms)/Makefile ;
$(ms)/Makefile:
	git submodule update -i

-include $(ms)/os.mk
-include $(ms)/perl.def
-include $(ms)/git.def

##################################################################

## sucker bet

alice.Rout: alice.R

##################################################################

## Wiki import dev

%.rmd: %.wikitext wtrmd.pl
	$(PUSH)

######################################################################

# http://localhost:4111/notebook/conditional_kernel.html
conditional_kernel.html: conditional_kernel.md

combinations.Rout: combinations.R

vitaminA.Rout: vitaminA.R

unitary.Rout: unitary.R
birthday.Rout: unitary.Rout birthday.R
fourunits.Rout: unitary.Rout fourunits.R

## Explore RE trick and other multivariate stuff at data lunch
multivariate.Rout: multivariate.R

martini.Rout: martini.R

quiz.Rout: quiz.R

gamma_shape.Rout: gamma_shape.R

# Log-plus-one as a scale
log1p.Rout: log1p.ssv log1p.R

Sources += walt.in
walt.out: walt.in walt.pl
	$(PUSH)

######################################################################

## checkplots and millipedes

## Create data
checkdata.Rout: checkdata.R

## Run tests
checkstats.Rout: checkdata.Rout checkstats.R

## Do checks
checkfuns.Rout: checkstats.Rout checkfuns.R

milli.Rout: checkstats.Rout milli.R

######################################################################

## materials and products are both deprecated for git_push; wonder if anything there matters
## Materials

allmd = $(wildcard *.md)
rmd = $(wildcard *.rmd)
rmdmd = $(rmd:rmd=md)

notmd += $(wildcard *.post.md) $(rmdmd)

sourcemd = $(filter-out $(notmd), $(allmd))

Sources += $(rmd) $(sourcemd) updates.html

# Sources += $(wildcard materials/*.*)
Sources += $(wildcard _drafts/*.md)

## Things made here that we want to be visible
# Sources += $(wildcard products/*.*)
products:
	mkdir $@

products/%: % products
	$(CP) $< $@

######################################################################

# Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl

Ignore += *.post
sucker.post: sucker.post.md post.pl
%.post: %.post.md post.pl
	$(PUSH)
	$(shell_execute)
%.post.md: %.md
	perl -npe 's/layout:\s+page/layout: post/' $< > $@


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

# http://localhost:4111/notebook/diversity.html
diversity.html: diversity.md

## Branch text, hopefully for a manuscript
## Why does this
Ignore += rarity.html
rarity.html: rarity.md

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

pythagoras.cp.html: cp.pl

%.cp.html: _site/%.html cp.pl
	$(PUSH)

######################################################################

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

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
## -include $(ms)/pandoc.mk
# -include $(ms)/oldlatex.mk
