/**
  NatColors is a struct that has access to colors from the design system.
  This colors changes according with the current theme configured in the Design system.

    All properties returns UIColor.
 
    Color palette is separeted by groups listed bellow, but this class deliveries
    all colors in flat way without nested objected.

    - Primary:
        primary, onPrimary, primaryLight, onPrimaryLight, primaryDark, onPrimaryDark
    - Secundary:
        secondary, onSecondary, secondaryLight, onSecondaryLight, secondaryDark, onSecondaryDark
    - Surface:
        background, onBackground, surface, onSurface
    - Content:
        highlight, highEmphasis, mediumEmphasis, lowEmphasis
    - Feedback:
        success, onSuccess, warning, onWarning, alert, onAlert, link, onLink

    Example of usage:

        let label = UILabel()
        label.backgroundColor = NatColors.primary
        label.textColor = NatColors.onPrimary

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

@available(*, deprecated, message: "⚠️ GaYa DS: Por favor, use GaYaColors em vez disso.", renamed: "GaYaColors")
public struct NatColors {

    // MARK: - Inits

    private init() {}

    // MARK: - Primary

    public static var primary: UIColor { getUIColorFromTokens(\.colorPrimary) }
    public static var onPrimary: UIColor { getUIColorFromTokens(\.colorOnPrimary) }
    public static var primaryDark: UIColor { getUIColorFromTokens(\.colorPrimaryDark) }
    public static var onPrimaryDark: UIColor { getUIColorFromTokens(\.colorOnPrimaryDark) }
    public static var primaryLight: UIColor { getUIColorFromTokens(\.colorPrimaryLight) }
    public static var onPrimaryLight: UIColor { getUIColorFromTokens(\.colorOnPrimaryLight) }

    // MARK: - Secundary

    public static var secondary: UIColor { getUIColorFromTokens(\.colorSecondary) }
    public static var onSecondary: UIColor { getUIColorFromTokens(\.colorOnSecondary) }
    public static var secondaryDark: UIColor { getUIColorFromTokens(\.colorSecondaryDark) }
    public static var onSecondaryDark: UIColor { getUIColorFromTokens(\.colorOnSecondaryDark) }
    public static var secondaryLight: UIColor { getUIColorFromTokens(\.colorSecondaryLight) }
    public static var onSecondaryLight: UIColor { getUIColorFromTokens(\.colorOnSecondaryLight) }

    // MARK: - Surface

    public static var background: UIColor { getUIColorFromTokens(\.colorBackground) }
    public static var onBackground: UIColor { getUIColorFromTokens(\.colorOnBackground) }
    public static var surface: UIColor { getUIColorFromTokens(\.colorSurface) }
    public static var onSurface: UIColor { getUIColorFromTokens(\.colorOnSurface) }

    // MARK: - Content

    public static var highlight: UIColor { getUIColorFromTokens(\.colorHighlight) }
    public static var highEmphasis: UIColor { getUIColorFromTokens(\.colorHighEmphasis) }
    public static var mediumEmphasis: UIColor { getUIColorFromTokens(\.colorMediumEmphasis) }
    public static var lowEmphasis: UIColor { getUIColorFromTokens(\.colorLowEmphasis) }

    // MARK: - Feedback

    public static var success: UIColor { getUIColorFromTokens(\.colorSuccess) }
    public static var onSuccess: UIColor { getUIColorFromTokens(\.colorOnSuccess) }
    public static var warning: UIColor { getUIColorFromTokens(\.colorWarning) }
    public static var onWarning: UIColor { getUIColorFromTokens(\.colorOnWarning) }
    public static var alert: UIColor { getUIColorFromTokens(\.colorAlert) }
    public static var onAlert: UIColor { getUIColorFromTokens(\.colorOnAlert) }
    public static var link: UIColor { getUIColorFromTokens(\.colorLink) }
    public static var onLink: UIColor { getUIColorFromTokens(\.colorOnLink) }
}
