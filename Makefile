DIST_FILES =                 \
  dist/index.js              \
  dist/scribe/triggerable.js \
  dist/scribe/engine.js      \
  dist/scribe/menu.js        \
  dist/scribe/screen.js      \
  dist/scribe/window.js   

.PHONY : init clean build dist docs

init:
	npm install

clean:
	rm -rf dist/
	rm -rf docs

build:
	./node_modules/.bin/coffee -b -o dist/ -c src/
	./node_modules/.bin/uglifyjs --screw-ie8 $(DIST_FILES) >> ./dist.js
	rm -rf ./dist
	mkdir -p ./dist
	mv ./dist.js ./dist/

test:
	build
	

docs:
	./node_modules/.bin/codo

dist: clean init build docs
