# notebook (gh-pages branch, which is the only one I use)
# http://localhost:4000/notebook/
# http://dushoff.github.io/notebook/
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: post 

##################################################################

## Edit hooks
# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
include $(ms)/perl.def
include $(ms)/git.def

##################################################################

## materials and products are both deprecated for git_push; wonder if anything there matters
## Materials

Sources += $(wildcard *.md) updates.html

Sources += $(wildcard materials/*.*)
Sources += $(wildcard _drafts/*.md)

## Things made here that we want to be visible
Sources += $(wildcard products/*.*)
products:
	mkdir $@

products/%: % products
	$(CP) $< $@

# Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl

post: current.post
current.md: syphilisHAART.md
	perl -npe 's/layout:\s+page/layout: post/' $< > $@

%.post: %.md post.pl
	$(PUSH)
	$(shell_execute)

# Scripts

Sources += $(wildcard *.R *.pl)

filledCircle.Rout: filledCircle.R

pythagoras.Rout: pythagoras.R

logistic.Rout: logistic.R

# Ongoing
moments.html: moments.md
moments.Rout: moments.R

# Developing
sir.Rout: sir.R
tmp.Rout: tmp.R
lecture.Rout: lecture.R

# Simple fitting of growing-epidemic data (Chowell, Bernardin)
genFit.md:
genFit.Rout: genFit.R

##################################################################

### Rec math (other stuff?)

elves.out: elves.pl
	$(PUSH)
elves.html: elves.md

## Batting averages
average.out: average.pl
	$(PUSH)
average.md:
average.Rout: average.out average.R

## Fractions
fractions.Rout: fractions.R

##################################################################

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

Sources += _config.yml Gemfile
Sources += _includes/* _layouts/* css/* _sass/*

######################################################################

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
-include $(ms)/pandoc.mk
# -include $(ms)/oldlatex.mk
