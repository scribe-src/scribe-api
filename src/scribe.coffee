#
# Top-level namespace for the Scribe API. This class is never actually
# instantiated; it holds a few static convenience properties and functions.
#
class @Scribe

  #
  # Stub nested namespaces
  #

  # @nodoc
  @Mixins ?= {}

  #
  # Define some top-level convenience properties and functions
  #

  # @property [Scribe.App] An alias for `Scribe.App.current`
  @app: null

  # @property [Scribe.Window] An alias for `Scribe.Window.current`.
  @window: null

  # @property [Scribe.Engine] An alias for `Scribe.Engine.current`.
  @engine: null

  # @property [Scribe.Platform] An alias for `Scribe.Platform.current`.
  @platform: null

  # Concatenates and prints the given `args`
  @log: (args...) ->
    @engine.log.apply(@engine, arguments)

  # Starts a Javascript REPL (with readline bindings!) on stdin and
  # blocks until the user runs `exit()`.
  @debugger: ->
    @engine.repl()

  #
  # Implement the magic properties
  #

  # @nodoc
  @_getApp: -> @App.current

  # @nodoc
  @_getWindow: -> @Window.current

  # @nodoc
  @_getEngine: -> @Engine.current

  # @nodoc
  @_getPlatorm: -> @Platform.current

  # Make some property lookups call "magic" getter/setter methods.
  #
  # This is defined in an "initialize" method that gets called
  # once all its dependencies are loaded.
  #
  # @nodoc
  @initialize: ->

    Scribe.Mixins.MagicProperties.mixin(Scribe, [
      'app'
      'window'
      'engine'
      'platform'
    ])
