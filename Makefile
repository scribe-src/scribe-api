DIST_FILES =                 \
  dist/index.js              \
  dist/Scribe.Triggerable.js \
  dist/Scribe.Engine.js      \
  dist/Scribe.Menu.js        \
  dist/Scribe.Screen.js      \
  dist/Scribe.Window.js   

.PHONY : init clean build dist docs

init:
	npm install

clean:
	rm -rf dist/
	rm -rf docs

build:
	./node_modules/.bin/coffee -b -o dist/ -c src/
	./node_modules/.bin/uglifyjs --screw-ie8 $(DIST_FILES) >> ./dist.js
	rm -f ./dist/*
	mv ./dist.js ./dist/

docs:
	./node_modules/.bin/codo

dist: clean init build docs
