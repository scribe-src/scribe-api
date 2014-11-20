#
# An interface to a native plugin.
#
# @example
#
#   var adLibrary = Scribe.Plugin.load('GenericAds');
#   adLibrary.call('init', 'AFB15610CCCEF1101');
#   adLibrary.call('reportEvent', 'launch');
#
class Scribe.Plugin

  # @property [Array<Scribe.Plugin>] all loaded plugins
  all: []

  # @return [Scribe.Plugin]
  @load: (name) ->

  # @return [Object] serialized data from the plugin
  call: (args...) ->
