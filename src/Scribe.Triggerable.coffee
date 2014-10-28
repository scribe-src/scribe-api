#
# Allows events to be registered and triggered off the object.
#
# @mixin
#
Scribe.Mixins.Triggerable =

  # Register a callback to run when the given event occurs
  #
  # @param [String] eventName the name of the event
  # @param [Function] callback the code to run when the event fires
  on: (eventName, callback) ->
    eventName = eventName.toLowerCase()
    @_eventsHash[eventName] ?= []
    @_eventsHash[eventName].push(callback)

  # Deregister a specific callback or all callbacks for an event
  #
  # @param [String] eventName the name of the event
  # @param [Function] callback when specified, this specific callback
  #   is removed from the list of callbacks. When omitted, all callbacks
  #   registered for {eventName} are removed.
  off: (eventName, callback) ->
    eventName = eventName.toLowerCase()
    if callback?
      @_eventsHash[eventName] ?= []
      cbIdx = idx @_eventsHash[eventName].indexOf(callback)
      @_eventsHash[eventName].splice(cbIdx) if cbIdx > -1
    else
      @_eventsHash[eventName] = []

  # Synchronously run the callbacks that have been associated with
  # eventName (registered by calling on()).
  #
  # @param [String] eventName the name of the event
  trigger: (eventName) ->
    eventName = eventName.toLowerCase()
    cb() for cb in (@_eventsHash[eventName] || [])

# Used for mixing this behavior into an instance.
# This is kept outside the main module definition to prevent
# it from showing up as an inherited method in the docset.
Scribe.Mixins.Triggerable.mixin = (context) ->
  context._eventsHash = {}
  context.on = @on.bind(context)
  context.trigger = @trigger.bind(context)
