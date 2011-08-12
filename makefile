include header.mk

usage:
	@echo "$@: make test.o"

%.o: %.i $(HASH_PATH) $(TEMP_PATH)
	for f1 in $(HASH_PATH)/$(ENV_HASH); do \
	  $(MAKE) $$f1 FRESH1=$$f1 INPUT=$< ; \
	done ; \
	for f2 in $$f1/`cat $< | $(HASH_TEXT)`; do \
	  $(MAKE) $$f2 FRESH2=$$f2 ; \
	done

$(HASH_PATH):
	mkdir -p $@

$(TEMP_PATH):
	mkdir -p $@

$(FRESH1):
	mkdir -p $@

$(FRESH2): $(FRESH1)
	mkdir $@
	echo "It works!" > $@/test.o
