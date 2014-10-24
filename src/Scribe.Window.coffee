# Manipulates a native window that contains an embedded browser.
#
# @event open    The Window is made visible
# @event hide    The Window is hidden
# @event destroy The Window is destroyed
# @event move    The Window is moved
# @event focus   The Window is focused
# @event resize  The Window is resized
# @event blur    The Window is blurred
#
# @include Scribe.Mixins.Triggerable
class Scribe.Window

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

  # @property [Boolean]
  topmost: false

  # @property [Boolean]
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

    @on('close', opts.close) if opts.close
    @on('show', opts.onShow) if opts.show
    @on('show', opts.show) if opts.show

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
  #   'index.'
  navigateToURL: (url) ->
    notImplemented()
