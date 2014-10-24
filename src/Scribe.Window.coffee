# Manipulate a native window that contains an embedded browser.
#
# @event open    The Window is made visible
# @event hide    The Window is hidden
# @event destroy The Window is destroyed
# @event move    The Window is moved
# @event focus   The Window is focused
# @event blur    The Window is blurred
#
# @include Scribe.Mixins.Triggerable
class Scribe.Window

  # Creates a new Window in the native window manager
  #
  # @param [Hash] opts the options hash
  # @option opts [Boolean] fullscreen
  # @option opts [String] title
  # @option opts [String] closable 
  constructor: (opts={}) ->
    Scribe.Mixins.Triggerable.mixin(@)

    @on('close', opts.close) if opts.close
    @on('show', opts.onShow) if opts.show
    @on('show', opts.show) if opts.show

  # Makes the Window visible
  show: ->
    throw "NotImplementedError"

  # Hides the Window
  hide: ->
    throw "NotImplementedError"

  # Horizontally centers the Window on the user's screen
  center: ->
    throw "NotImplementedError"

  # Sets the title string in the Window's title bar, if it has one
  #
  # @param [String] title
  setTitle: (title) ->
    throw "NotImplementedError"

  # Returns the window's title
  #
  # @return [String] the title
  getTitle: ->
    throw "NotImplementedError"

  # Navigates the embedded browser to the specified {url}
  #
  # @param [String] url the URL to navigate to. Relative URLs like
  #   'index.'
  navigateToURL: (url) ->
    throw "NotImplementedError"