.PHONY: build
build:
	cd src && deno run -A npm:squint-cljs compile --output-dir ../denops **/*.cljs
	sed -i '' "s/'squint-cljs\/core.js'/'npm:squint-cljs\/core.js'/g" ./denops/helloworld/*.mjs

.PHONY: clean
clean:
	rm -rf ~/Library/Caches/deno/npm/registry.npmjs.org/squint-cljs
