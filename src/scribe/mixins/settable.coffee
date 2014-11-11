#
# Allows instance properties to be changed with a set() method.
#
# @mixin
#
Scribe.Mixins.Settable =

  # A helper method for changing one or more instance properties.
  # 
  # @example using the Object syntax:
  #   car.set({ speed: 0.5, acceleration: 1.2 })

  # @example using the key, val syntax:
  #   car.set('speed', 0.5);
  #   car.set('acceleration', 1.2);
  #
  # @param [String, Object] keyOrObj either the 
  # @param [Function] callback the code to run when the event fires
  # @throw [Error] when incorrect arguments are given
  set: (keyOrObj, val) ->
    if typeof keyOrObj is 'string' and typeof val isnt 'undefined'
      @[keyOrObj] = val
    else if typeof keyOrObj is 'object' and typeof val is 'undefined'
      @[key] = val for own key, val of keyOrObj
    else
      throw new Error("set() was called with incorrect arguments")
    val || keyOrObj

# Used for mixing this behavior into an instance.
# This is kept outside the main module definition to prevent
# it from showing up as an inherited method in the docset.
Scribe.Mixins.Settable.mixin = (context) ->
  context.set = @set.bind(context)
