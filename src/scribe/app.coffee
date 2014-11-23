#
# A GUI application.
#
class Scribe.App


  # @property [Scribe.App]
  #
  # A reference to the currently-running application
  #   (aliased as `Scribe.app`)
  @current: null

  # @property [String]
  #
  # The name of the current application
  name: null

  # @property [String]
  #
  # A reverse-DNS identifier for the current application,
  #   like `io.scribe.app`
  identifier: null

  # @property [String] a filesystem path to the native executable
  exePath: null

  # @property [String] the current working directory
  cwd: null

  # @property [Array<String>]
  #
  # The arguments that were passed to our process
  arguments: []

  # Gets an environment variable.
  # @property [String] varName the name of the environment variable to return
  # @return [String] the specified environment variable
  getEnv: (varName) ->
    @_getEnv(varName)

  # Gets an environment variable.
  # @property [String] varName the name of the environment variable to set
  # @property [String] value the value to set the variable to
  setEnv: (varName, value) ->
    @_setEnv(varName, value)

  # Kills the application and returns `status`
  #
  # @param [Number] status the process status to return
  exit: (status) ->
    @_exit(status)

do ->
  # @nodoc
  Scribe.Mixins.MagicProperties.mixin(Scribe.App.prototype, [
    'cwd'
    'exePath'
    'identifier'
    'name'
  ])

  # @nodoc
  Scribe.Mixins.MagicProperties.mixin(Scribe.App.Environment.prototype, [
    'all'
  ])
