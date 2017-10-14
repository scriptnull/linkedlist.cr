.PHONY: docs

docs:
	@rm -rf docs/
	@crystal docs
	@mkdir docs
	@mv doc/* docs/
	@rm -rf doc/