# notebook
# http://localhost:4000/notebook/
# http://dushoff.github.io/notebook/
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: current.md 

##################################################################

## Edit hooks
Sources += current.md moments.md qbd.md

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
include $(ms)/perl.def

##################################################################

## Materials

Sources += $(materials/*)

Sources += $(wildcard *.md) updates.html

Sources += $(wildcard materials/*.*)
Sources += $(wildcard _drafts/*.md)

# Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl

post: current.post
current.md:

%.post: %.md post.pl
	$(PUSH)
	$(shell_execute)

# Scripts

Sources += $(wildcard *.R)

# ImageTargets += filledCircle.Rout.pdf filledCircle.Rout-0.png filledCircle.Rout-2.png
filledCircle.Rout: filledCircle.R

# Ongoing
moments.html: moments.md
moments.Rout: moments.R

# Developing

sir.Rout: sir.R
tmp.Rout: tmp.R
lecture.Rout: lecture.R


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
# -include $(ms)/oldlatex.mk
