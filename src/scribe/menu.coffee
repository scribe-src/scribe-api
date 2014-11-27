# Manipulates a native desktop menu provided by the window manager.
#
# Due to inconsistencies between platforms, the meaning of Menu
# is not always the same. On Windows and Linux, each Window has
# its own Menu. On OSX, there is only one Menu per app, and
# without a menu many core functions like copy/paste/quit shortcuts
# are missing.
#
# @include Scribe.Mixins.Triggerable
class Scribe.Menu

  # A single item in a menu.
  class @Item

    # @property [String] label
    label: null

    # @property [Array<Scribe.Menu.Item>] array of submenu items
    children: []

    # @property [String] a shortcut to assign
    shortcut: null

    action: ->

  # Creates a new Menu which can contain MenuItems that point
  # to other menus (for Submenu navigation).
  #
  # @example Create a menu
  #   Scribe.Menu.create([
  #      {
  #        label: 'Scribe App',
  #        shortcut: 'super-F',
  #        action: function() {},
  #        children: [
  #          {...},
  #          {...}
  #        ]
  #      },
  #      {
  #        label: 'File',
  #        action: function() {}
  #      },
  #      {
  #        label: 'Window',
  #        action: function() {}
  #      }
  #   ])
  #
  # @param [Hash] opts the options hash
  # @option opts [String] title
  @create: (items, opts) ->
    new @(items, opts)

  # @property [Object]
  #
  # A reference to the native Menu object. The exact type and API
  #   of this object will be platform-dependent.
  nativeObject: null

  # Creates a new Menu
  #
  # @param [Array<Object>] items
  # @param [Object] opts
  constructor: (items, opts) ->

  # Builds a minimal menu for allowing Cut/Copy/Paste and
  # Hide/Quit shortcuts on OSX. Has no effect on other platforms.
  #
  # The minimal menu looks like: `App name | File | Edit | Window`
  # 
  # @return [Scribe.Menu]
  bootstrapOSX: ->

  # Attaches the Menu to the given `window`. On OSX, `window`
  # has no effect.
  # 
  # @param [Scribe.Window] window
  show: (window) ->

do ->
  # Make some property lookups call "magic" getter/setter methods
  # that will be implemented by the Menu
  Scribe.Mixins.MagicProperties.mixin(Scribe.Menu.prototype, [
    'nativeObject'
  ])
