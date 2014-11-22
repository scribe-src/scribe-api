
# @nodoc
#
# This allows us to inject some "Magic" getter/setter calls on
# property lookups to the specified properties. Then the platform-
# specific code can implement these private methods directly on
# the prototype.
#
# For example, `window.height` is re-routed to `window._getHeight()`,
# and likewise for `window.height = 5` to `window._setHeight(5)`.
#
# @nodoc
Scribe.Mixins.MagicProperties =

  mixin: (instance, propNames) ->

    # Reroute all the getter/setters from the magic properties defined
    # above so that we don't have to duplicate the Object.defineProperty
    # call on every platform.
    # See Scribe.Window.OSX.js in the scribe-platform-osx project as
    # an example of the patched-in implementation.
    do ->

      capitalize = (str) ->
        str.charAt(0).toUpperCase() + str.substring(1)

      propNames.forEach (prop) ->

        # We reroute access so that obj.x = 1 calls obj._setX(1), and
        # console.log(obj.x) calls obj._getX() 
        # That way we can "patch" the implementations in later by
        # assigning Scribe.Window.prototype._show in the platform code.
        Object.defineProperty instance, prop, 
          get: ->
            try
              @["_get#{capitalize prop}"]()
            catch e
              e.message = "_get#{capitalize prop}() failed:\n #{e.message}"
              throw e

          set: (val) ->
            try
              @["_set#{capitalize prop}"](val)
            catch e
              e.message = "_set#{capitalize prop}() failed:\n #{e.message}"
              throw e
