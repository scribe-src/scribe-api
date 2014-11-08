### Scribe Javascript API

The `scribe-api` module implements Scribe's high-level Javascript interfaces available to code inside your HTML app. It is used to generate documentation and define common shared Javascript functionality among the Scribe platforms (event handling, OOP, and utility functions); the actual implementations of many functions are left for the `scribe-platform-*` projects.

The APIs are meant to be short and sweet. Interfaces are written in [Coffeescript](http://coffeescript.org/) and parsed into HTML applications with [Codo](https://github.com/coffeedoc/codo).

NOTE: Currently I am using a modified version of `codo` that includes class templates, so I have checked in `node_modules`. This is bad practice and I really should kick my `codo` changes out to a fork.

#### Generating docs

    $ make docs

#### Compiling to Javascript

    $ make build

#### Running tests

    Currently there are no tests.
