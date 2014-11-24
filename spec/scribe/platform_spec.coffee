require('../../dist/dist.js')

describe 'Scribe.Platform', ->

  it 'is defined', ->
    expect(Scribe.Platform).toBeDefined()

  describe '#is()', ->

    createPlatformNamed = (name) ->
      plat = new Scribe.Platform()
      plat._getName = -> name
      plat

    describe 'when #name is "osx" and match is "osx"', ->

      it 'returns true', ->
        expect(createPlatformNamed('osx').is('osx')).toEqual(true)

    describe 'when #name is "osx" and match is "windows"', ->

      it 'returns false', ->
        expect(createPlatformNamed('osx').is('windows')).toEqual(false)

    describe 'when #name is "windows" and match is /^win/', ->

      it 'returns true', ->
        expect(createPlatformNamed('windows').is(/^win/)).toEqual(true)
