[![Build Status](https://travis-ci.org/scribe-src/scribe-api.svg)](https://travis-ci.org/scribe-src/scribe-api)

### Scribe Javascript API

The `scribe-api` module implements Scribe's high-level Javascript interfaces, like `Scribe.Window` and `Scribe.Menu`. It is used to generate documentation and define common shared Javascript functionality among the Scribe platforms (event handling, OOP, and utility functions); the actual implementations of many functions are left for the `scribe-platform-*` projects. The `dist/dist.js` file is compiled into every Scribe binary and is evaluated by the engine before any platform-specific patches are added.

The APIs are meant to be short and sweet. Interfaces are written in [Coffeescript](http://coffeescript.org/) and HTML documentation is generated with [Codo](https://github.com/coffeedoc/codo).

#### Documentation

Documentation is hosted on [github-pages](http://scribe-src.github.io/scribe-api/doc/).

#### Generating docs

    $ make docs

#### Compiling to Javascript

    $ make build

#### Running tests

    $ make test

#### License

[BSD 3-Clause](http://opensource.org/licenses/BSD-3-Clause)

#### Copyright

    2014 Scribe.io
