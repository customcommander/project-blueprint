src_files = $(shell find src -type f -name "*.js")

dist: $(patsubst src/%,dist/%,$(src_files))

dist/%: src/%
	mkdir -p $(@D)
	cp $^ $@
