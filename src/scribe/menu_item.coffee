#
# A single item in a menu.
#
class Scribe.MenuItem

  # @property [String] the label displayed
  label: null

  # @property [Array<Scribe.Menu.Item>] array of submenu items
  children: []

  # @property [String] a shortcut to assign
  #
  # @example Shortcut strings
  #   `meta+shift+x`
  #   `ctrl+alt+y`
  #
  shortcut: null

  # @property [Function, null] a callback to run when this menu
  #   item is selected
  action: ->
