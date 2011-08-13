include header.mk
include hashmeta-git.mk

HASH1_FORMAT  = $(HASH_PATH)/$(ENV_HASH)
HASH2_FORMAT  = `cat $< | $(HASH_TEXT)`
HASH2_EXTRAS += HASHMETA_GIT_LOG=$$h2/hashmeta-git.log

usage:
	@echo "$@: make test.o"

%.o: %.i $(HASH_PATH)
	for h1 in $(HASH1_FORMAT); do \
	  $(MAKE) $$h1 INPUT=$< \
		HASH1_STRING=$$h1 \
		$(HASH1_EXTRAS); \
	done ; \
	for h2 in $$h1/$(HASH2_FORMAT); do \
	  $(MAKE) $$h2 INPUT=$< \
		HASH2_STRING=$$h2 \
		$(HASH2_EXTRAS); \
	done

$(HASH_PATH):
	mkdir -p $@

#$(TEMP_PATH):
#	mkdir -p $@

$(HASH1_STRING):
	mkdir -p $@

$(HASH2_STRING): $(HASH1_STRING)
	mkdir $@
ifdef HASHMETA_GIT_LOG
	$(HASHMETA_GIT_LAST_COMMIT) > $(HASHMETA_GIT_LOG)
endif
	echo "It works!" > $@/test.o

