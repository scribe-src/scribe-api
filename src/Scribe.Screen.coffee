# A physical Screen that can display a Window. An onchange handler
# can be registered with `Scribe.Screen.on('change', handler)`.
#
# @event change A screen has been added, removed, or resized.
class Scribe.Screen

  # @property [Array<Scribe.Screen>] all the available screens
  @all: null

  # @property [Number] the absolute width (in pixels) of the window
  width: 0

  # @property [Number] the absolute height (in pixels) of the window
  height: 0

  # @property [Object] a reference to the Native screen object. The
  #   exact type and API of this object will be platform-dependent.
  nativeScreenObject: null

  # @nodoc
  constructor: (opts={}) ->
    if opts.nativeScreenObject?
      @_nativeScreenObject = opts.nativeScreenObject

do ->
  # Allow the Screen class to register handlers for global
  # Screen changes (like plugging in a new monitor)
  Scribe.Mixins.Triggerable.mixin(Scribe.Screen)

  # Make some property lookups call "magic" getter/setter methods
  # that will be implemented by the Platform
  Scribe.Mixins.GetterSetters.mixin(Scribe.Screen, ['all'])
  Scribe.Mixins.GetterSetters.mixin(Scribe.Screen.prototype, [
    'width'
    'height'
    'nativeScreenObject'
  ])