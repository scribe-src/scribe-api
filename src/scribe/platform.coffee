#
# A system that is hosting the Scribe runtime
#
class Scribe.Platform

  # @property [Array<String>] list of supported platforms
  @SUPPORTED: [
    'osx'
    # 'windows'
    # 'ios'
    # 'linux'
    # 'android'
  ]

  # @property [Scribe.Platform]
  #
  # A reference to the host `Platform`
  @current: null

  # @property [String]
  #
  # The operating system name. See the SUPPORTED class variable.
  name: null

  # @property [String] the OS version
  version: null

  # Determine whether `name` matches the Platform
  #
  # @example
  #   if Scribe.Platform.current.is('windows')
  #      console.log('Nope!')
  #      Scribe.app.exit(1)
  #
  # For accepted values see the SUPPORTED class variable.
  #
  # @param [String] name the name to match
  # @return [Boolean] whether `name` matches the Platform
  is: (name) ->
    @_is(name)
