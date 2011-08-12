stage1: ## This is not a real makefile :)
	@mkdir -p $@
	cat $(INPUT) | $(HASH_TEXT)
