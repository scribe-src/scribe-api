PATH := ./node_modules/.bin:${PATH}

.PHONY : init clean-docs clean build dist publish docs

init:
	npm install

clean:
	rm -rf dist/

build:
	coffee -b -o dist/ -c src/
	uglifyjs --screw-ie8 -m --stats ./dist/index.js > ./dist.js
	rm ./dist/index.js
	uglifyjs --screw-ie8 -m --stats ./dist/*.js >> ./dist.js
	rm -f ./dist/*
	mv ./dist.js ./dist/

docs:
	codo

dist: clean init build docs
