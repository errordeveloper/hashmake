## sha*sum and md*sum appear to be part of GNU
## coreutils and there is probablity very close
## to 1 that anybody whos uses GNU make already
## has coreutils installed on their system.

COMMON_HEADER = header.mk

## these are not real makefiles, they instead
## serve as kind of templates :)
STAGE1 = stage1.mk
STAGE2 = stage2.mk

HASH_TEXT ?= sha256sum -t - | cut -d" " -f1
HASH_DATA ?= sha256sum -b - | cut -d" " -f1

HASH_PATH ?= build/hashes/
TEMP_PATH ?= build/mktemp/

ENV_HASH = $(shell env | $(HASH_TEXT))

CFLAGS_HASH = $(shell $(CFLAGS) | $(HASH_TEXT))
