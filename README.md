[![Build Status](https://travis-ci.org/scribe-src/scribe-api.svg)](https://travis-ci.org/scribe-src/scribe-api)

### Scribe Javascript API

The `scribe-api` module implements Scribe's high-level Javascript interfaces available to code inside your HTML app. It is used to generate documentation and define common shared Javascript functionality among the Scribe platforms (event handling, OOP, and utility functions); the actual implementations of many functions are left for the `scribe-platform-*` projects.

The APIs are meant to be short and sweet. Interfaces are written in [Coffeescript](http://coffeescript.org/) and HTML documentation is generated with [Codo](https://github.com/coffeedoc/codo).

#### Documentation

Documentation is hosted on [github-pages](http://scribe-src.github.io/scribe-api/doc/).

#### Generating docs

    $ make docs

#### Compiling to Javascript

    $ make build

#### Running tests

    $ make test
