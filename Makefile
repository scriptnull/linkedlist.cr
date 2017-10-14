.PHONY: docs bench

docs:
	@rm -rf docs/
	@crystal docs
	@mkdir docs
	@mv doc/* docs/
	@rm -rf doc/

bench:
	@crystal run bench/*.cr --release --no-debug