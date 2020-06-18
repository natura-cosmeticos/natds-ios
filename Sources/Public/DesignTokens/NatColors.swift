/**
  NatColors is a struct that has access to colors from the design system.
  This colors changes according with the current Brand configured in the Design system
  and according with user properties of Light and Dark mode.

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

    Exemple of usage:

        let label = UILabel()
        label.backgroundColor = NatColors.primary
        label.textColor = NatColors.onPrimary

 - Requires:
        It's necessary to configure the Design System current Brand at DesignSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)

 - Warning
        This class supports Light and Dark mode. In other words, according with user properties
        of Light or Dark, a diferent color can be returned.

        Attention with .cgColor, because it doesn`t support dynamically changes
        of light and dark mode.
*/

public struct NatColors {

    // MARK: - Inits

    private init() {}

    // MARK: - Primary

    public static var primary: UIColor { getTheme().colors.primary }
    public static var onPrimary: UIColor { getTheme().colors.onPrimary }
    public static var primaryLight: UIColor { getTheme().colors.primaryLight }
    public static var onPrimaryLight: UIColor { getTheme().colors.onPrimaryLight }
    public static var primaryDark: UIColor { getTheme().colors.primaryDark }
    public static var onPrimaryDark: UIColor { getTheme().colors.onPrimaryDark }

    // MARK: - Secundary

    public static var secondary: UIColor { getTheme().colors.secondary }
    public static var onSecondary: UIColor { getTheme().colors.onSecondary }
    public static var secondaryLight: UIColor { getTheme().colors.secondaryLight }
    public static var onSecondaryLight: UIColor { getTheme().colors.onSecondaryLight }
    public static var secondaryDark: UIColor { getTheme().colors.secondaryDark }
    public static var onSecondaryDark: UIColor { getTheme().colors.onSecondaryDark }

    // MARK: - Surface

    public static var background: UIColor { getTheme().colors.background }
    public static var onBackground: UIColor { getTheme().colors.onBackground }
    public static var surface: UIColor { getTheme().colors.surface }
    public static var onSurface: UIColor { getTheme().colors.onSurface }

    // MARK: - Content

    public static var highlight: UIColor { getTheme().colors.highlight }
    public static var highEmphasis: UIColor { getTheme().colors.highEmphasis }
    public static var mediumEmphasis: UIColor { getTheme().colors.mediumEmphasis }
    public static var lowEmphasis: UIColor { getTheme().colors.lowEmphasis }

    // MARK: - Feedback

    public static var success: UIColor { getTheme().colors.success }
    public static var onSuccess: UIColor { getTheme().colors.onSuccess }
    public static var warning: UIColor { getTheme().colors.warning }
    public static var onWarning: UIColor { getTheme().colors.onWarning }
    public static var alert: UIColor { getTheme().colors.alert }
    public static var onAlert: UIColor { getTheme().colors.onAlert }
    public static var link: UIColor { getTheme().colors.link }
    public static var onLink: UIColor { getTheme().colors.onLink }
}
