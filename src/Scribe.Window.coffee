# Manipulates a native window that contains an embedded browser.
# The embedded browser can load an arbitrary URL. Code running in
# the embedded browser can access the Window instance through the
# `Scribe.Window` global.
#
# @event open     The Window has been made visible
# @event hide     The Window has been hidden
# @event destroy  The Window has been destroyed
# @event move     The Window has been moved
# @event focus    The Window has been focused
# @event resize   The Window has been resized
# @event blur     The Window has been blurred
# @event minimize The Window has been minimized
#
# @include Scribe.Mixins.Triggerable
class Scribe.Window

  # The @currentWindow class method returns a reference to the Window
  # that is currently running the caller code. If the caller code is
  # just a script running in the interpreter (e.g. the entrypoint script),
  # null is returned.
  #
  # @return [ScribeWindow, null] the Window containing the browser context
  #   that the caller code is running in, or null when the caller code
  #   is not running inside a Window.
  @currentWindow: ->
    notImplemented()

  # @property [Boolean] the Window covers the entire screen
  fullscreen: false

  # @property [String] the title of the Window. If {titleBar} is true,
  #   this String will be displayed above the Window.
  title: null

  # @property [Boolean] the Window can be closed by the user
  closable: true

  # @property [Boolean] the Window can be resized by the user
  resizable: true

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

  # @property [Object] a reference to the native browser object. The
  #   exact type and API of this object will be platform-dependent.
  nativeBrowserObject: null

  # @property [Object] a reference to the native window object. The
  #   exact type and API of this object will be platform-dependent.
  nativeWindowObject: null

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

  # Makes the Window visible
  show: ->
    notImplemented()

  # Hides the Window
  hide: ->
    notImplemented()

  # Horizontally centers the Window on the user's screen
  center: ->
    notImplemented()

  # Navigates the embedded browser to the specified {url}
  #
  # @param [String] url the URL to navigate to. Relative URLs like
  #   'index.html' will be resolved from the project root.
  navigateToURL: (url) ->
    notImplemented()
