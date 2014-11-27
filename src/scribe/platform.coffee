#
# A system that is hosting the Scribe runtime
#
class Scribe.Platform

  # @property [Array<String>] list of supported platforms
  @SUPPORTED: [
    'osx'
    # my todo list:
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

  # @property [String]
  #
  # The operating system version.
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
    !!@name.match(name)

  # Runs a shell command in the background.
  #
  # @param [String] cmd the shell command to run
  # @param [Object] opts the options hash
  # @option opts 'done' [Function] the callback function that accepts
  #   the parameters `stdout, stderr`
  exec: (cmd, opts={}) ->
    @_exec(cmd, opts)

  # Runs a shell command and blocks until completion
  #
  # @param [String] cmd the shell command to run
  # @param [Object] opts the options hash
  # @option opts 'done' [Function] the callback function that accepts
  #   the parameters `stdout, stderr`
  # @return [Object] an Object with `stdout` and `stderr` keys that
  #   point to Strings containing the buffer contents
  execSync: (cmd, opts={}) ->
    @_execSync(cmd, opts)

do ->

  # Make some property lookups call "magic" getter/setter methods
  # that will be implemented by the Engine
  # @nodoc
  Scribe.Mixins.MagicProperties.mixin(Scribe.Platform.prototype, [
    'name'
    'version'
  ])
