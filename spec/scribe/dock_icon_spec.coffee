require('../../dist/dist.js')

describe 'Scribe.DockIcon', ->

  it 'is defined', ->
    expect(Scribe.DockIcon).toBeDefined()

  it 'can be instantiated', ->
    expect(-> new Scribe.DockIcon()).not.toThrow()
