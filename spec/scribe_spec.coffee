require('../dist/dist.js')

describe 'Scribe', ->

  it 'is defined', ->
    expect(Scribe).toBeDefined()

  describe 'Scribe.app', ->
    beforeEach ->
      @matcher = 'abc'
      @app = Scribe.App.current
      Scribe.App.current = @matcher

    afterEach ->
      Scribe.App.current = @app

    it 'returns Scribe.App.current', ->
      expect(Scribe.app).toEqual(@matcher)

  describe 'Scribe.platform', ->
    beforeEach ->
      @matcher = 'abc'
      @platform = Scribe.Platform.current
      Scribe.Platform.current = @matcher

    afterEach ->
      Scribe.Platform.current = @platform

    it 'returns Scribe.Platform.current', ->
      expect(Scribe.platform).toEqual(@matcher)

  describe 'Scribe.engine', ->
    beforeEach ->
      @matcher = 'abc'
      @engine = Scribe.Engine.current
      Scribe.Engine.current = @matcher

    afterEach ->
      Scribe.Engine.current = @engine

    it 'returns Scribe.Engine.current', ->
      expect(Scribe.engine).toEqual(@matcher)

