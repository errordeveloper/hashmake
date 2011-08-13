HASHMETA_GIT_DETECT_REPO= $(shell git rev-parse >& /dev/null ; echo $$?)
ifeq ($(HASHMETA_GIT_DETECT_REPO),0)
HASHMETA_GIT_LOG ?= meta_git.log
HASHMETA_GIT_LAST_COMMIT= $(shell git log -1 --stat > $(HASHMETA_GIT_LOG))
HASHMETA_GIT_LAST_REFLOG= $(shell git reflog -1 > $(HASHMETA_GIT_LOG))
HASHMETA_GIT_GET_ROOTDIR= $(shell git rev-parse --show-cdup)
endif

## other useful commands:
# git show-ref --heads
# git rev-list --all --pretty -1

#$(HASHMETA_GIT_LOG):
#	$(HASHMETA_GIT_REV)

##.PHONY: $(HASHMETA_GIT_LOG)
