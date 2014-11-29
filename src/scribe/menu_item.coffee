#
# A single item in a menu.
#
class Scribe.MenuItem

  # @property [String] label
  label: null

  # @property [Array<Scribe.Menu.Item>] array of submenu items
  children: []

  # @property [String] a shortcut to assign
  shortcut: null

  # @property [Function, null] a callback to run when this menu
  #   item is selected
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