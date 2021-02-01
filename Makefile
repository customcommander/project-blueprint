src_files = $(shell find src -type f -name "*.js")

build: dist dist/index.js

clean:; rm -rf tmp

dist: $(patsubst src/%,dist/%,$(src_files))

dist/index.js: tmp/exports.json scripts/exports.ejs
	yarn -s ejs -n -l exports -f $< scripts/exports.ejs -o $@

dist/%: src/%
	mkdir -p $(@D)
	cp $^ $@

tmp/metadata: $(patsubst src/%.js,tmp/metadata/%.raw.json,$(src_files))
tmp/metadata/%.raw.json: src/%.js
	mkdir -p $(@D)
	yarn -s jsdoc --explain --access "public" $< > $@

tmp/metadata/%.meta.json: tmp/metadata/%.raw.json scripts/metadata.jq
	jq -f scripts/metadata.jq $< > $@

tmp/exports.json: $(patsubst src/%.js,tmp/metadata/%.meta.json,$(src_files)) scripts/exports.jq
	jq -f scripts/exports.jq --raw-output -M --slurp $(filter %.meta.json,$^) > $@
