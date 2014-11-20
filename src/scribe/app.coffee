#
# A GUI application
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

  # @property [String]
  #
  # A filesystem path to the native executable
  exePath: null

  # Kills the application and returns `status`
  #
  # @param [Number] status the process status to return
  exit: (status) ->
    @_exit(status)