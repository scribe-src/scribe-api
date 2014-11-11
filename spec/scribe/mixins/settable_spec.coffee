require('../../../dist/dist.js')

buildObj = ->
  obj = {}
  Scribe.Mixins.Settable.mixin(obj)
  obj

describe 'Scribe.Mixins.Settable', ->

  it 'is defined', ->
    expect(Scribe.Mixins.Settable).toBeDefined()

  describe 'after mixing it in', ->
    beforeEach ->
      @obj = buildObj()

    describe 'set()', ->

      it 'is available', ->
        expect(@obj.set).toBeDefined()

      describe 'when given an Object', ->
        beforeEach ->
          @obj.set({a: 1})

        it 'sets the properties of the object', ->
          expect(@obj.a).toEqual(1)

      describe 'when given String, Value arguments', ->
        beforeEach ->
          @obj.set('a', 2)

        it 'sets the properties of the object', ->
          expect(@obj.a).toEqual(2)

      describe 'when given an Integer', ->
        it 'throws an Error', ->
          expect(=> @obj.set(1)).toThrow(
            "set() was called with incorrect arguments"
          )