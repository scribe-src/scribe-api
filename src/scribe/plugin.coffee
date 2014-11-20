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

  # @param [String] fnName the name of the function to call
  #
  # Calls the specified function. Any additional arguments
  # provided will be forwarded as arguments to the function.
  #
  # @return [Object] serialized data from the plugin
  call: (fnName, args...) ->
    @_call.apply(@, arguments)