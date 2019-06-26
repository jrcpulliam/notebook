# notebook (gh-pages branch, which is the only one I use)
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

######################################################################

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

## Bail on googlesheets because it requires "publishing"
maya.Rout: maya.R

## ln -s ~/Dropbox/maya ##
Ignore += maya
## downcall maya/blood.xlsx ##
blood.Rout: maya/blood.xlsx blood.R

######################################################################

# Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl

Ignore += *.post
## permBinom.post: 
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

gamma_shape.Rout: gamma_shape.R

# Log-plus-one as a scale
log1p.Rout: log1p.ssv log1p.R

Sources += walt.in
walt.out: walt.in walt.pl
	$(PUSH)

######################################################################

## checkplots and millipedes

Sources += checkplots.md

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

# http://localhost:4111/notebook/diversity.html: diversity.md

## Branch text, hopefully for a manuscript
Ignore += rarity.html
rarity.html: rarity.md

## Playing with Simpson
simpson.Rout: simpson.R
checkplot.Rout: checkplot.R

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
