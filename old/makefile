include header.mk

## next two variables are not really used,
## but are being grepped to do our trick!
#
#SOURCE_HASH = \
#	@cat $< | $(HASH_TEXT) > $@
#
#BINARY_HASH = \
#	@cat $< | $(HASH_DATA) > $@

%.t1: $(HASH_PATH) $(TEMP_PATH)
	@for TEMP in $(MKTEMP); do \
	   printf "include $(COMMON_HEADER)\n" >> $$TEMP; \
	   printf "$(HASH_PATH)/$(ENV_HASH): $(INPUT)\n" >> $$TEMP; \
	   grep -v stage1: $(STAGE1) >> $$TEMP; \
	   $(MAKE) -f $$TEMP; \
	done

%.stage1: $(HASH_PATH) $(TEMP_PATH)
	@for TEMP in $(HASH_PATH)/$(ENV_HASH); do \
	   printf "include $(COMMON_HEADER)\n" > $$TEMP.mk; \
	   printf "$$TEMP: $(INPUT)\n" >> $$TEMP.mk; \
	   grep -v stage1: $(STAGE1) >> $$TEMP.mk; \
	   $(MAKE) -f $$TEMP.mk; \
	done

## this produces a temporary makefile and
## it appears to work okay this way!
## it may need to have 'cut' bit removed
## and then we can use the hasher util to
## compare those files with '-c' flag ..

## what are the other options ???

## option A - there is
#$(HASH_PATH)/$(ENV_HASH)/%: $(HASH_PATH)
#	echo $@ | cat $(INPUT_FILES) > $@

## option B - not dependency
#$(HASH_PATH)/$(ENV_HASH)/%:
#	mkdir `dirname $@` -p
#	cat $(INPUT_FILES) > $@

## answer - neither seem to work, but the
## trick with temporary makefile ;)

$(HASH_PATH):
	mkdir -p $@

$(TEMP_PATH):
	mkdir -p $@
