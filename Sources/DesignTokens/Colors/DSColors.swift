public struct DSColors {
    private static let theme = DesignSystem.shared.currentTheme

    private init() {}

    // MARK: - Primary

    public static let primary = UIColor.createColor(
        hexLight: theme.lightColorPallet.primary.primary,
        hexDark: theme.darkColorPallet.primary.primary
    )

    public static let onPrimary = UIColor.createColor(
        hexLight: theme.lightColorPallet.primary.onPrimary,
        hexDark: theme.darkColorPallet.primary.onPrimary
    )

    public static let primaryLight = UIColor.createColor(
        hexLight: theme.lightColorPallet.primary.primaryLight,
        hexDark: theme.darkColorPallet.primary.primaryLight
    )

    public static let onPrimaryLight = UIColor.createColor(
        hexLight: theme.lightColorPallet.primary.onPrimaryLight,
        hexDark: theme.darkColorPallet.primary.onPrimaryLight
    )

    public static let primaryDark = UIColor.createColor(
        hexLight: theme.lightColorPallet.primary.primaryDark,
        hexDark: theme.darkColorPallet.primary.primaryDark
    )

    public static let onPrimaryDark = UIColor.createColor(
        hexLight: theme.lightColorPallet.primary.onPrimaryDark,
        hexDark: theme.darkColorPallet.primary.onPrimaryDark
    )

    // MARK: - Secundary

    public static let secundary = UIColor.createColor(
        hexLight: theme.lightColorPallet.secundary.secondary,
        hexDark: theme.darkColorPallet.secundary.secondary
    )

    public static let onSecundary = UIColor.createColor(
        hexLight: theme.lightColorPallet.secundary.onSecondary,
        hexDark: theme.darkColorPallet.secundary.onSecondary
    )

    public static let secundaryLight = UIColor.createColor(
        hexLight: theme.lightColorPallet.secundary.secondaryLight,
        hexDark: theme.darkColorPallet.secundary.secondaryLight
    )

    public static let onSecundaryLight = UIColor.createColor(
        hexLight: theme.lightColorPallet.secundary.onSecondaryLight,
        hexDark: theme.darkColorPallet.secundary.onSecondaryLight
    )

    public static let secundaryDark = UIColor.createColor(
        hexLight: theme.lightColorPallet.secundary.secondaryDark,
        hexDark: theme.darkColorPallet.secundary.onSecondaryDark
    )

    public static let onSecundaryDark = UIColor.createColor(
        hexLight: theme.lightColorPallet.secundary.onSecondaryDark,
        hexDark: theme.darkColorPallet.secundary.onSecondaryDark
    )

    // MARK: - Surface

    public static let background = UIColor.createColor(
        hexLight: theme.lightColorPallet.surface.background,
        hexDark: theme.darkColorPallet.surface.background
    )

    public static let onBackground = UIColor.createColor(
        hexLight: theme.lightColorPallet.surface.onBackground,
        hexDark: theme.darkColorPallet.surface.onBackground
    )

    public static let surface = UIColor.createColor(
        hexLight: theme.lightColorPallet.surface.surface,
        hexDark: theme.darkColorPallet.surface.surface
    )

    public static let onSurface = UIColor.createColor(
        hexLight: theme.lightColorPallet.surface.onSurface,
        hexDark: theme.darkColorPallet.surface.onSurface
    )

    // MARK: - Content

    public static let hightlight = UIColor.createColor(
        hexLight: theme.lightColorPallet.content.hightlight,
        hexDark: theme.darkColorPallet.content.hightlight
    )

    public static let highEmphasis = UIColor.createColor(
        hexLight: theme.lightColorPallet.content.highEmphasis,
        hexDark: theme.darkColorPallet.content.highEmphasis
    )

    public static let mediumEmphasis = UIColor.createColor(
        hexLight: theme.lightColorPallet.content.mediumEmphasis,
        hexDark: theme.darkColorPallet.content.mediumEmphasis
    )

    public static let lowEmphasis = UIColor.createColor(
        hexLight: theme.lightColorPallet.content.lowEmphasis,
        hexDark: theme.darkColorPallet.content.lowEmphasis
    )

    public static let link = UIColor.createColor(
        hexLight: theme.lightColorPallet.content.link,
        hexDark: theme.darkColorPallet.content.link
    )

    public static let onLink = UIColor.createColor(
        hexLight: theme.lightColorPallet.content.onLink,
        hexDark: theme.darkColorPallet.content.onLink
    )

    // MARK: - Feedback

    public static let success = UIColor.createColor(
        hexLight: theme.lightColorPallet.feedback.success,
        hexDark: theme.darkColorPallet.feedback.success
    )

    public static let onSuccess = UIColor.createColor(
        hexLight: theme.lightColorPallet.feedback.onSuccess,
        hexDark: theme.darkColorPallet.feedback.onSuccess
    )

    public static let warning = UIColor.createColor(
        hexLight: theme.lightColorPallet.feedback.warning,
        hexDark: theme.darkColorPallet.feedback.warning
    )

    public static let onWarning = UIColor.createColor(
        hexLight: theme.lightColorPallet.feedback.onWarning,
        hexDark: theme.darkColorPallet.feedback.onWarning
    )

    public static let alert = UIColor.createColor(
        hexLight: theme.lightColorPallet.feedback.alert,
        hexDark: theme.darkColorPallet.feedback.alert
    )

    public static let onAlert = UIColor.createColor(
        hexLight: theme.lightColorPallet.feedback.onAlert,
        hexDark: theme.darkColorPallet.feedback.onAlert
    )

}

extension UIColor {
    static func createColor(hexLight: String, hexDark: String) -> UIColor {
        if #available(iOS 13.0, *) {
            return UIColor.init { (UITraitCollection) -> UIColor in
                UITraitCollection.userInterfaceStyle == .dark ?
                    UIColor.hexColorOrDefault(hexLight)  :
                    UIColor.hexColorOrDefault(hexDark)
            }
        } else {
            return UIColor.hexColorOrDefault(hexLight)
        }
    }
}
