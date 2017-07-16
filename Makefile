# notebook (gh-pages branch, which is the only one I use)
# http://localhost:4111/notebook/
# http://dushoff.github.io/notebook/

### Hooks for the editor to set the default target
current: target
-include target.mk

##################################################################

## Edit hooks
# make files

Sources = Makefile .gitignore README.md sub.mk LICENSE.md
include sub.mk
-include $(ms)/perl.def
-include $(ms)/git.def

##################################################################

martini.Rout: martini.R

gamma_shape.Rout: gamma_shape.R

# Log-plus-one as a scale
log1p.Rout: log1p.ssv log1p.R

## materials and products are both deprecated for git_push; wonder if anything there matters
## Materials

Sources += $(wildcard *.md) updates.html

# Sources += $(wildcard materials/*.*)
Sources += $(wildcard _drafts/*.md)

## Things made here that we want to be visible
# Sources += $(wildcard products/*.*)
products:
	mkdir $@

products/%: % products
	$(CP) $< $@

# Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl

post: current.post
current.md: 19.md
	perl -npe 's/layout:\s+page/layout: post/' $< > $@

current.html: 19.md

current.post: current.md post.pl
%.post: %.md post.pl
	$(PUSH)
	$(shell_execute)

# Scripts

Sources += $(wildcard *.R *.pl)

filledCircle.Rout: filledCircle.R

pythagoras.Rout: pythagoras.R

cards.Rout: cards.R

logistic.Rout: logistic.R

19.html: 19.md

# Ongoing
moments.html: moments.md
moments.Rout: moments.R

# http://localhost:4111/notebook/diversity.html
diversity.html: diversity.md

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
average.out: average.pl
	$(PUSH)
average.md:
average.Rout: average.out average.R

### Hmm. this all seems a bunch of nonsense. Understand (document?) before trying to hack.
era.out: era.pl
	$(PUSH)
era.Rout: era.out era.R

## Fractions
fractions.Rout: fractions.R

##################################################################

# Blogging
## CP raw html suppresses mathjax (somehow)
## CP rendered html doubles mathjax (fix by hand?)
## Blogger is just absolutely fricking crazy about <p>, <br> and <div> tags. No easy fix for this, either.

# Maybe just give up on blogger…

pythagoras.cp.html: cp.pl

%.cp.html: _site/%.html cp.pl
	$(PUSH)

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

######################################################################


-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
-include $(ms)/pandoc.mk
# -include $(ms)/oldlatex.mk
