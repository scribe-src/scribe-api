#
# An icon in the system dock or tray.
#
class Scribe.DockIcon

  # @property [String, null] a URL to display in the DockIcon; when this is
  #   `null`, the icon defaults to the URL specified in the Scribe manifest.
  #   Setting this property updates the icon immediately.
  url: null

  # @property [String, null] the contents of the badge label on the DockIcon;
  #   when this is `null`, the badge is hidden.
  badge: null

  # @property [Scribe.Menu, null] the right-click context menu associated
  #   with this DockIcon.
  contextMenu: null

  # Bounces the app icon in the dock, if possible.
  bounce: ->
    @_bounce()

  constructor: ->
    @_create?.apply(@, arguments)

do ->
  # @nodoc
  Scribe.Mixins.MagicProperties.mixin(Scribe.DockIcon.prototype, [
    'badge'
    'url'
    'contextMenu'
  ])
