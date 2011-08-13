## the Idea is to simply


HASHMETA_GIT_DETECT_REPO= $(shell git rev-parse >& /dev/null ; echo $$?)
ifeq ($(HASHMETA_GIT_DETECT_REPO),0)
HASHMETA_GIT_LAST_COMMIT= git log -1 --stat
HASHMETA_GIT_LAST_REFLOG= git reflog -1
HASHMETA_GIT_GET_ROOTDIR= $(shell git rev-parse --show-cdup)
else
HASHMETA_GIT_LAST_COMMIT= /bin/true
HASHMETA_GIT_LAST_REFLOG= /bin/true
HASHMETA_GIT_GET_ROOTDIR= /var/empty/
endif

## other useful commands:
# git show-ref --heads
# git rev-list --all --pretty -1
