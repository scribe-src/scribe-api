#
# The Environment class provides static data about the process
# environment: arguments, environment vars, cwd, etc.
#
class Scribe.Environment

  # @property [Scribe.Environment]
  #
  # The environment of the currently-executing process
  #   (aliased as `Scribe.env`)
  @current: null

  # @property [String]
  #
  # The current working directory
  cwd: null

  # @property [Array<String>]
  #
  # The process arguments
  argv: []

  # @property [Object]
  #
  # The environment variables
  env: {}

do ->

  # Make some property lookups call "magic" getter/setter methods
  # that will be implemented by the Platform
  # @nodoc
  Scribe.Mixins.GetterSetters.mixin(Scribe.Environment, [
    'cwd'
    'argv'
    'env'
  ])
