/**
  DSColors is a class that has access to colors from the design system.
  This colors are changes according with the current Brand configured in the Design system and according
  with user properties of Light and Dark mode.
 
 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        with method DesisgnSystem.configure(brand:).
 - Warning
        This class supports Light and Dark mode. In other words according with user properties of Light or Dark
        you can recieve two diferents colors
 
 Add exemple of using ----- TODO -----
 Add Notes Primary and Secundary.....  ----- TODO -----
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

    public static let hightlight = ColorSelector().getFromPalette(color: \.hightlight)
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
