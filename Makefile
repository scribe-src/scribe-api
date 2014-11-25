DIST_FILES =               \
  dist/scribe.js           \
  dist/scribe/mixins/*.js  \
  dist/scribe/app.js       \
  dist/scribe/platform.js  \
  dist/scribe/plugin.js    \
  dist/scribe/engine.js    \
  dist/scribe/menu.js      \
  dist/scribe/screen.js    \
  dist/scribe/dock_icon.js \
  dist/scribe/window.js

JASMINE_CLI=./node_modules/.bin/jasmine-node
UGLIFY_OPTS=--wrap --export-all

.PHONY : init clean build dist docs test test-run publish

init:
	npm install

clean:
	rm -rf dist/
	rm -rf doc/

build: init

	./node_modules/.bin/coffee -b -o dist/ -c src/
	./node_modules/.bin/uglifyjs \
		$(UGLIFY_OPTS) $(DIST_FILES) >> ./dist.js
	rm -rf ./dist
	mkdir -p ./dist
	mv ./dist.js ./dist/

test: build test-run

test-run:
	$(JASMINE_CLI) --coffee  --verbose ./spec

docs:
	./node_modules/.bin/codo

dist: clean init build

publish: dist
	# todo: ensure dist gets committed!
	git push origin master
	git checkout gh-pages	
	git merge master -m "Merge in latest master" -S
	make docs
	git add .
	git commit -m "Bump docs." -S
	git push origin gh-pages
	git checkout -
