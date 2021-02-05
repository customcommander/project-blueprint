CC=java -jar /devtools/closure-compiler/compiler.jar
EJS=yarn -s ejs --no-with

src_files = $(shell find src -type f -name "*.js")
dist_files = $(patsubst src/%,dist/%,$(src_files))
meta_files = $(patsubst src/%.js,tmp/%.meta.json,$(src_files))

clean:; rm -rf tmp dist docs

.PHONY: docs
docs: docs/includes docs/index.html.md

docs/includes: tmp/__fullmeta.json scripts/slate-include.ejs
	mkdir -p $@
	for inc in `jq --raw-output '.[].name' $<`; do \
		$(MAKE) docs/includes/_$$inc.md; \
	done

docs/includes/%.json: tmp/__fullmeta.json
	jq 'map(select(.name=="$*"))[0]' $< > $@

docs/includes/_%.md: docs/includes/%.json scripts/slate-include.ejs
	$(EJS) \
		--data-file $< \
		--locals-name sym \
			scripts/slate-include.ejs > $@

docs/index.html.md: tmp/__fullmeta.json scripts/slate-index.ejs
	$(EJS) \
		--data-file $< \
		--locals-name syms \
			scripts/slate-index.ejs > $@

.PHONY: test
test: dist
	yarn -s tape test/*.js

.PHONY: dist
dist: $(dist_files) dist/index.js dist/browser.min.js

dist/%: src/%
	mkdir -p $(@D)
	$(CC) \
		--compilation_level WHITESPACE_ONLY \
		--language_in ECMASCRIPT_2019 \
		--language_out ECMASCRIPT_2019 \
		--js $< \
		--js_output_file $@

dist/index.js: tmp/__exports.json scripts/exports.ejs
	EXPORT_PATH="module.exports" yarn -s ejs \
		--no-with \
		--locals-name exports \
		--data-file tmp/__exports.json \
			scripts/exports.ejs > tmp/__module-exports.js
	$(CC) \
		--compilation_level WHITESPACE_ONLY \
		--language_in ECMASCRIPT_2019 \
		--language_out ECMASCRIPT_2019 \
		--js tmp/__module-exports.js \
		--js_output_file $@
	rm tmp/__module-exports.js

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
		--language_in ECMASCRIPT_2019 \
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

tmp/__fullmeta.json: $(meta_files)
	jq 'map(.exports[])' --slurp $^ > $@
