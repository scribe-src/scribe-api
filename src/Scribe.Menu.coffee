# Manipulates a native menu provided by the window manager.
#
# @include Scribe.Mixins.Triggerable
class Scribe.Menu

  # Creates a new Menu which can contain MenuItems that point
  # to other menus (for Submenu navigation).
  #
  # @param [Hash] opts the options hash
  # @option opts [String] title
  constructor: (opts={}) ->
    Scribe.Mixins.Triggerable.mixin(@)

