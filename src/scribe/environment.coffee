#
# The Environment class provides static data about the process
# environment (arguments, env vars, cwd, etc)
#
class Scribe.Environment

  # @property [String]
  #
  # The current working directory
  @cwd: '/'

  # @property [Array<String>]
  #
  # The process arguments
  @argv: []

  # @property [Array<String>]
  #
  # The environment variables
  @env: {}

do ->

  # Make some property lookups call "magic" getter/setter methods
  # that will be implemented by the Platform
  Scribe.Mixins.GetterSetters.mixin(Scribe.Environment, [
    "cwd"
    "argv"
    "env"
  ])