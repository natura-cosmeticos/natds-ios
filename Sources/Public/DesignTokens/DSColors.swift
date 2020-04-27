/**
  DSColors is a class that has access to colors from the design system.
  This colors changes according with the current Brand configured in the Design system
  and according with user properties of Light and Dark mode.

    Color palette is separeted by groups listed bellow, but this class deliveries
    all colors in flat way without nested objected.

    - Primary:
        primary, onPrimary, primaryLight, onPrimaryLight, primaryDark, onPrimaryDark
    - Secundary:
        secondary, onSecondary, secondaryLight, onSecondaryLight, secondaryDark, onSecondaryDark
    - Surface:
        background, onBackground, surface, onSurface
    - Content:
        highlight, highEmphasis, mediumEmphasis, lowEmphasis, link, onLink
    - Feedback:
        success, onSuccess, warning, onWarning, alert, onAlert

    Exemple of usage:

        let label = UILabel()
        label.backgroundColor = DSColors.primary
        label.textColor = DSColors.onPrimary

 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)

 - Returns:
        All properties returns UIColor.

 - Warning
        This class supports Light and Dark mode. In other words, according with user properties
        of Light or Dark, a diferent color can be returned.

        Attention with .cgColor, because it doesn`t support dynamically changes
        of light and dark mode.
*/

public struct DSColors {
    // MARK: - Inits

    private init() {}

    // MARK: - Primary

    public static let primary = ColorSelector().getFromPalette(color: \.primary)
    public static let onPrimary = ColorSelector().getFromPalette(color: \.onPrimary)
    public static let primaryLight = ColorSelector().getFromPalette(color: \.primaryLight)
    public static let onPrimaryLight = ColorSelector().getFromPalette(color: \.onPrimaryLight)
    public static let primaryDark = ColorSelector().getFromPalette(color: \.primaryDark)
    public static let onPrimaryDark = ColorSelector().getFromPalette(color: \.onPrimaryDark)

    // MARK: - Secundary

    public static let secondary = ColorSelector().getFromPalette(color: \.secondary)
    public static let onSecondary = ColorSelector().getFromPalette(color: \.onSecondary)
    public static let secondaryLight = ColorSelector().getFromPalette(color: \.secondaryLight)
    public static let onSecondaryLight = ColorSelector().getFromPalette(color: \.onSecondaryLight)
    public static let secondaryDark = ColorSelector().getFromPalette(color: \.secondaryDark)
    public static let onSecondaryDark = ColorSelector().getFromPalette(color: \.onSecondaryDark)

    // MARK: - Surface

    public static let background = ColorSelector().getFromPalette(color: \.background)
    public static let onBackground = ColorSelector().getFromPalette(color: \.onBackground)
    public static let surface = ColorSelector().getFromPalette(color: \.surface)
    public static let onSurface = ColorSelector().getFromPalette(color: \.onSurface)

    // MARK: - Content

    public static let highlight = ColorSelector().getFromPalette(color: \.highlight)
    public static let highEmphasis = ColorSelector().getFromPalette(color: \.highEmphasis)
    public static let mediumEmphasis = ColorSelector().getFromPalette(color: \.mediumEmphasis)
    public static let lowEmphasis = ColorSelector().getFromPalette(color: \.lowEmphasis)
    public static let link = ColorSelector().getFromPalette(color: \.link)
    public static let onLink = ColorSelector().getFromPalette(color: \.onLink)

    // MARK: - Feedback

    public static let success = ColorSelector().getFromPalette(color: \.success)
    public static let onSuccess = ColorSelector().getFromPalette(color: \.onSuccess)
    public static let warning = ColorSelector().getFromPalette(color: \.warning)
    public static let onWarning = ColorSelector().getFromPalette(color: \.onWarning)
    public static let alert = ColorSelector().getFromPalette(color: \.alert)
    public static let onAlert = ColorSelector().getFromPalette(color: \.onAlert)
}
