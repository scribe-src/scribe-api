#
# An Engine tracks a single Javascript execution context and provides a
# few runtime fundamentals like `eval` and parent context tracking.
#
class Scribe.Engine

  # @property [Scribe.Engine]
  #
  # A reference to the Engine that is currently running the caller code.
  @current: null

  # @property [Scribe.Engine]
  #
  # A reference to the Engine that created this Engine.
  parent: null

  # @property [Object]
  #
  # A reference to the native Engine object. The exact type and API
  #   of this object will be platform-dependent.
  nativeObject: null

  # @property [Object]
  #
  #   A reference to the Javascript global object from the embedded
  #   WebView inside this Window.
  jsGlobal: null

  # Evaluates the given `jsCode` in the context of the Engine
  #
  # @param jsCode [String] the Javascript to execute
  # @return [Object] the serialized result
  eval: (jsCode) ->
    @_eval(jsCode)

  # Starts a small Javascript REPL (with readline bindings!) on stdin
  # and blocks until the user runs `exit()`.
  #
  # @return [void]
  repl: ->
    @_repl()

  # @nodoc
  constructor: (opts={}) ->
    if opts.nativeObject?
      @_nativeObject = opts.nativeObject

do ->
  # Make some property lookups call "magic" getter/setter methods
  # that will be implemented by the Engine
  # @nodoc
  Scribe.Mixins.MagicProperties.mixin(Scribe.Engine.prototype, [
    'nativeObject'
    'parent'
    'jsGlobal'
  ])
