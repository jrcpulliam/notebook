# notebook
# http://localhost:4000
# http://dushoff.github.io/notebook/
### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: notarget

##################################################################

# make files

Makefile: crash

crash:
	@echo Working on this branch is disabled
	splakiorn

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
include $(ms)/perl.def

##################################################################

# Aesthetics

# Notebook picture
Sources += notebook.jpg

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
current.post: current.md

%.post: %.md post.pl
	$(PUSH)
	$(shell_execute)

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
