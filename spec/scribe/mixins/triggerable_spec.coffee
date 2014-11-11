require('../../../dist/dist.js')

spy = ->
  calls = 0
  ret = ->
    calls++
  ret.calls = -> calls
  ret

buildObj = ->
  obj = {}
  Scribe.Mixins.Triggerable.mixin(obj)
  obj

describe 'Scribe.Mixins.Triggerable', ->

  it 'is defined', ->
    expect(Scribe.Mixins.Triggerable).toBeDefined()

  describe 'call on("e", fn), then trigger("e")', ->

    it 'calls fn once', ->
      fn = spy()
      obj = buildObj()
      obj.on('e', fn)
      obj.trigger('e')
      expect(fn.calls()).toEqual(1)

  describe 'call on("e", fn) twice, then trigger("e")', ->

    it 'calls fn twice', ->
      fn = spy()
      obj = buildObj()
      obj.on('e', fn)
      obj.on('e', fn)
      obj.trigger('e')
      expect(fn.calls()).toEqual(2)

  describe 'call on("e", fn), then trigger("f")', ->

    it 'never calls fn', ->
      fn = spy()
      obj = buildObj()
      obj.on('e', fn)
      obj.trigger('f')
      expect(fn.calls()).toEqual(0)

  describe 'call on("e", fn), off("e", fn), then trigger("e")', ->

    it 'never calls fn', ->
      fn = spy()
      obj = buildObj()
      obj.on('e', fn)
      obj.off('e', fn)
      obj.trigger('e')
      expect(fn.calls()).toEqual(0)

  describe 'call on("e", fn), off("e"), then trigger("e")', ->

    it 'never calls fn', ->
      fn = spy()
      obj = buildObj()
      obj.on('e', fn)
      obj.off('e')
      obj.trigger('e')
      expect(fn.calls()).toEqual(0)

  describe 'call on("e", fn), off("e", fn2), then trigger("e")', ->

    it 'calls fn once', ->
      fn = spy()
      fn2 = ->
      obj = buildObj()
      obj.on('e', fn)
      obj.off('e', fn2)
      obj.trigger('e')
      expect(fn.calls()).toEqual(1)
