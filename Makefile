PATH := ./node_modules/.bin:${PATH}

.PHONY : init clean-docs clean build dist publish

init:
	npm install

clean:
	rm -rf dist/

build:
	coffee -o dist/ -c src/
	uglifyjs --screw-ie8 -m --stats ./dist/**.js > ./dist.js
	rm -f dist/**.js
	mv ./dist.js ./dist/

docs:
	codo

dist: clean init build

publish: dist
	npm publish
