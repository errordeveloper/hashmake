include header.mk

HASH1_FORMAT= $(HASH_PATH)/$(ENV_HASH)
HASH2_FORMAT= `cat $< | $(HASH_TEXT)`

usage:
	@echo "$@: make test.o"

%.o: %.i $(HASH_PATH)
	for h1 in $(HASH1_FORMAT); do \
	  $(MAKE) $$h1 HASH1_STRING=$$h1 INPUT=$< ; \
	done ; \
	for h2 in $$h1/$(HASH2_FORMAT); do \
	  $(MAKE) $$h2 HASH2_STRING=$$h2 ; \
	done

$(HASH_PATH):
	mkdir -p $@

#$(TEMP_PATH):
#	mkdir -p $@

$(HASH1_STRING):
	mkdir -p $@

$(HASH2_STRING): $(HASH1_STRING)
	mkdir $@
	echo "It works!" > $@/test.o
