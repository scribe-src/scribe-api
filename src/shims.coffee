#
# Implements a window.open() polyfill
#

# @nodoc
global = @

# keep a helper inside our closure
# @nodoc
params = (searchString) ->
  paramValue = ""
  params = searchString.split("&")
  retObject = {}
  i = 0
  while i < params.length
    paramPair = params[i]
    eqlIndex = paramPair.indexOf("=")
    paramName = paramPair.substring(0, eqlIndex)
    retObject[paramName] = unescape(paramPair.substring(eqlIndex + 1))
    i++
  retObject

# hold a reference to the native window.open() function:
# @nodoc
openOriginal = global.open

# shim the global window.open() function:
# @nodoc
global.open = (url, name='', opts={}) ->
  # Ensure this is not a sibling reference like _self, _parent,
  # _opener, or _top
  if (Scribe.Window.current and (name is "_self" or
       (name.charAt(0) is "_" and global[name.slice(1)] instanceof global.Window)))
    # run the original open() method on any arguments passed
    otherWindow = global[name.slice(1)]
    if openOriginal?
      openOriginal.apply(global, Array::slice.call(arguments))
    else
      otherWindow.location = url
    otherWindow
  else
    opts = params(opts) if typeof opts is "string"
    opts.url = url
    win = new Scribe.Window(opts)
    win.show()
    win