#
# An interface to a native plugin.
#
# @example
#   Scribe.Plugin.GenericAds.init('AFB15610CCCEF1101');
#   Scribe.Plugin.GenericAds.reportEvent('launch');
#
#   var hotKey = new Scribe.Plugin.HotKey.register(
#     'ctrl-alt-shift-x',
#     function() {
#       alert('lalalala!')  
#     }
#   );
#   hotKey.unregister();
#   // or Scribe.Plugin.HotKey.unregister('ctrl-alt-shift')
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
    @_loaded[name] ?= new Scribe.Plugin(name)
  
  #
  # Calls the specified function. Any additional arguments
  # provided will be forwarded as arguments to the function.
  #
  # @param [String] fnName the name of the function to call
  # @return [Object] serialized data from the plugin
  call: (fnName, args...) ->
    @_call.apply(@, arguments)

  constructor: (name) ->
    @_laoded[name] = @