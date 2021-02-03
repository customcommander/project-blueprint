CC=java -jar /devtools/closure-compiler/compiler.jar

src_files = $(shell find src -type f -name "*.js")
dist_files = $(patsubst src/%,dist/%,$(src_files))
meta_files = $(patsubst src/%.js,tmp/%.meta.json,$(src_files))

clean:; rm -rf tmp dist

.PHONY: dist
dist: $(dist_files) dist/index.js dist/browser.min.js

dist/%: src/%
	mkdir -p $(@D)
	cp $^ $@

dist/index.js: tmp/__exports.json scripts/exports.ejs
	EXPORT_PATH="module.exports" yarn -s ejs \
		--no-with \
		--locals-name exports \
		--data-file tmp/__exports.json \
			scripts/exports.ejs > $@

dist/browser.min.js: tmp/__exports.json scripts/externs.jq scripts/exports.ejs
	jq \
		-f scripts/externs.jq \
		--raw-output \
		--arg BROWSER_NS $(BROWSER_NS) \
			$< > dist/__externs.js
	EXPORT_PATH="window.$(BROWSER_NS)" yarn -s ejs \
		--no-with \
		--locals-name exports \
		--data-file tmp/__exports.json \
		--output-file dist/__browser.js \
			scripts/exports.ejs
	$(CC) \
		--compilation_level ADVANCED_OPTIMIZATIONS \
		--language_out ECMASCRIPT5_STRICT \
		--module_resolution NODE \
		--process_common_js_modules \
		--externs dist/__externs.js \
		--isolation_mode IIFE \
		--js $(dist_files) dist/__browser.js \
		--js_output_file $@
	rm dist/__externs.js
	rm dist/__browser.js

tmp/%.raw.json: src/%.js
	mkdir -p $(@D)
	yarn -s jsdoc --configure jsdoc.json --explain --access "public" $< > $@

tmp/%.meta.json: tmp/%.raw.json scripts/metadata.jq
	jq -f scripts/metadata.jq $< > $@

tmp/__exports.json: $(meta_files) scripts/exports.jq
	jq -f scripts/exports.jq --raw-output -M --slurp $(meta_files) > $@
