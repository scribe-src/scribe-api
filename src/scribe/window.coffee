# Manipulates a native window that contains an embedded browser.
# The embedded browser can load an arbitrary URL. Code running in
# the embedded browser can access the Window instance through the
# `Scribe.Window.current` property.
#
# @event open       The Window has been made visible
# @event hide       The Window has been hidden
# @event destroy    The Window has been destroyed
# @event move       The Window has been moved
# @event focus      The Window has been focused
# @event resize     The Window has been resized
# @event blur       The Window has been blurred
# @event minimize   The Window has been minimized
# @event deminimize The Window has been de-minimized
# @event message    The Window has received a message from another Window
#
# @include Scribe.Mixins.Triggerable
# @include Scribe.Mixins.Settable
class Scribe.Window

  # @property [Scribe.Window]
  #
  # A reference to the Window that is currently running the caller
  # code. If the caller code is not associated with a Window (e.g.
  # the entrypoint script), null is returned.
  #
  @current: null

  # Broadcast a message to all alive Windows
  #
  # @param message [String] the message to send to all Windows
  @broadcastMessage: (message) ->
    @_broadcastMessage(message)

  # Creates and returns a new instance of `Scribe.Window`
  #
  # @param opts [Object] the options for Scribe.Window's constructor
  # @return [Scribe.Window] a new Window instance
  @create: (opts={}) ->
    new @(opts)

  # @property [Boolean] the Window covers the entire screen
  fullscreen: false

  # @property [String] the title of the Window. If `chrome` is true,
  #   this String will be displayed above the Window.
  title: null

  # @property [Boolean] display the window chrome (the titlebar)
  chrome: true

  # @property [Boolean] the Window can be closed by the user
  closable: true

  # @property [Boolean] the Window can be resized by the user
  resizable: true

  # @property [Boolean] the Window is currently visible on screen
  visible: false

  # @property [Number] the offset (in pixels) from the left of the screen
  left: 0

  # @property [Number] the offset (in pixels) from the top of the screen
  top: 0

  # @property [Number] the absolute width (in pixels) of the window
  width: 0

  # @property [Number] the absolute height (in pixels) of the window
  height: 0

  # @property [Number] the alpha percentage (between 0 and 1)
  alpha: 1

  # @property [Boolean] this window is pinned above all others
  topmost: false

  # @property [Boolean] the embedded browser enforces Same Origin Policy
  sameOriginPolicy: true

  # @property [Object] A reference to the native window object. The
  #   exact type and API of this object will be platform-dependent.
  nativeWindowObject: null

  # @property [Scribe.Engine] the Scribe.Engine instance that has been injected
  #   into the currently-loaded Javascript context.
  engine: null

  # Creates a new Window in the native window manager
  #
  # @param [Hash] opts the options hash
  # @option opts [Boolean] fullscreen
  # @option opts [String] title
  # @option opts [Boolean] closable
  # @option opts [Boolean] resizable
  # @option opts [Number] left
  # @option opts [Number] top
  # @option opts [Number] width
  # @option opts [Number] height
  # @option opts [Number] opacity between 0 and 1
  # @option opts [Boolean] topmost
  constructor: (opts={}) ->
    Scribe.Mixins.Triggerable.mixin(@)
    Scribe.Mixins.Settable.mixin(@)
    if opts.nativeWindowObject?
      @_nativeWindowObject = opts.nativeWindowObject
    else
      @_createWindow(opts)

  # Makes the Window visible and brings it to the front
  show: ->
    @_show()

  # Hides the Window offscreen
  hide: ->
    @_hide()

  # Permanently closes and releases the Window
  close: ->
    @_close()

  # Collapse the window
  minimize: ->
    @_minimize()

  # Un-collapse the window
  deminimize: ->
    @_deminimize()

  # Horizontally centers the Window on the user's screen
  center: ->
    @_center()

  # Navigates the embedded browser to the specified `url`
  #
  # @param [String] url the URL to navigate to. Relative URLs like
  #   'index.html' will be resolved from the project root.
  navigateToURL: (url) ->
    @_navigateToURL(url)

  # Posts the message
  # @param message [String] the message to send
  # @param
  postMessage: (message) ->
    @_postMessage(message)

do ->

  # Make some property lookups call "magic" getter/setter methods
  # that will be implemented by the Platform
  Scribe.Mixins.GetterSetters.mixin(Scribe.Window.prototype, [
    "fullscreen"
    "title"
    "closable"
    "resizable"
    "left"
    "top"
    "width"
    "height"
    "alpha"
    "topmost"
    "sameOriginPolicy"
    "nativeWindowObject"
    "visible"
  ])
