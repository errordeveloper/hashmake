## sha*sum and md*sum appear to be part of GNU
## coreutils and there is probablity very close
## to 1 that anybody whos uses GNU make already
## has coreutils installed on their system.

COMMON_HEADER = header.mk

## these are not real makefiles, they instead
## serve as kind of templates :)

## TODO: find performance benchmarks
## and see whether there is a need for
## checking the OS name!

## this is standard option for Linux
#TRIM = | cut -d" " -f1
#HASH_TEXT ?= sha256sum -t - $(TRIM)
#HASH_DATA ?= sha256sum -b - $(TRIM)

## without coreutils one ca use openssl
## openssl implements many different
## algorithms that user may wish to select
## OpenSSL 0.9.2 doesn't implement sha256
#HASH_TYPE ?= sha256
## this TRIM works for 1.0.x and 0.9.x
TRIM = | cut -d" " -f2
HASH_TYPE ?= sha1
HASH_TEXT ?= openssl $(HASH_TYPE) $(TRIM)

## or Perl script shasum:
#HASH_TEXT ?= shasum -a256 -t - $(TRIM)
#HASH_DATA ?= shasum -a256 -b - $(TRIM)

HASH_PATH ?= build/hashes/
TEMP_PATH ?= build/mktemp/

## `env` is only good for testing, it shouldn't
## be used for projects, since nobody cares to
## track all different variables, though one may
## wish to do so :)
ENV_HASH = $(shell env | $(HASH_TEXT))

## TODO: a flag collector needs to be implemented
CFLAGS_HASH = $(shell $(CFLAGS) | $(HASH_TEXT))
## perhaps there should be something like this:
#	$(COMMAND) $(INPUT) $(OUTPUT)
## flags like '-o' should be put in between, but
## this may become tedious and perhpas it would
## just a hash of the entire command line and
## there will be a target 'do' with underfined
## variable 'COMMAND' which will need to be passed
## to $(MAKE) from the previous target rule.
