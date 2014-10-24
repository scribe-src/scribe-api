### Scribe Javascript API

The `Scribe` global object is always available to the Javascript running in a Scribe application. You can use it to perform standard UI application functions like opening a window, controlling the menubar. It also provides platform-specific APIs for calling native functions.

The APIs are meant to be short and sweet. Interfaces are written in [Coffeescript](http://coffeescript.org/) and parsed into HTML applications with [Codo](https://github.com/coffeedoc/codo). The Coffeescript implements any universal code, like event handling, OOP, and utility functions. It is then up to the scribe-platform-* modules to override the unimplemented platform-specific bits of the APIs.

#### Generating docs

    $ npm i
    $ npm run-script codo
