
### Hooks for the editor to set the default target
current: target
-include target.mk

##################################################################

## Edit hooks
# make files

Sources = Makefile README.md

ms = makestuff
Sources += $(ms)
Makefile: $(ms)/Makefile

$(ms)/%.mk: $(ms)/Makefile ;
$(ms)/Makefile:
	git submodule update -i

-include $(ms)/git.mk
-include $(ms)/os.mk
-include $(ms)/perl.def
