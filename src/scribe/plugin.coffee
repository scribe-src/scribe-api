#
# An interface to a native plugin.
#
# @example
#   var adLibrary = Scribe.Plugin.load('GenericAds');
#   adLibrary.init('AFB15610CCCEF1101');
#   adLibrary.reportEvent('launch');
#
class Scribe.Plugin

  # @property [Array<Scribe.Plugin>] all loaded plugins
  all: []

  # Loads the plugin or returns a cached reference to the
  # loaded plugin.
  #
  # @param [String] name the name of the plugin to load
  # @return [Scribe.Plugin]
  @load: (name) ->
    @_load(name)
  
  #
  # Calls the specified function. Any additional arguments
  # provided will be forwarded as arguments to the function.
  #
  # @param [String] fnName the name of the function to call
  # @return [Object] serialized data from the plugin
  call: (fnName, args...) ->
    @_call.apply(@, arguments)
