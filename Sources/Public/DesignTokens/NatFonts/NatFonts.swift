/**
  NatFonts is a struct that has methods to create fonts from the Design System tokens.
  According with the current Brand in the Design System this properties can change.

    Example of usage:

        label.font = NatFonts.font(ofSize: .heading6 withWeight: .regular)

 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

@available(*, deprecated, message: "Por favor, use GaYaFonts em vez disso.", renamed: "GaYaFonts")
public struct NatFonts {
    public static func font(ofSize size: Size, withWeight weight: Weight) -> UIFont {
        .systemFont(
            ofSize: size.relatedTextStyle.size,
            weight: weight.rawValue
        )
    }

    public static func font(ofSize size: Size) -> UIFont {
        .systemFont(
            ofSize: size.relatedTextStyle.size,
            weight: size.relatedTextStyle.weight
        )
    }

    public static func font(ofSize size: CGFloat, withWeight weight: UIFont.Weight) -> UIFont {
        .systemFont(ofSize: size, weight: weight)
    }

    public static func font(ofSize size: CGFloat) -> UIFont {
        .systemFont(ofSize: size)
    }

    public static func font(ofSize size: CGFloat,
                            withWeight weight: UIFont.Weight,
                            withFamily family: String) -> UIFont {

        guard let font = UIFont(name: family, size: size) else {
            return UIFont.systemFont(ofSize: size,
                                     weight: weight)
        }
        return font
    }

    public static func customFont(ofSize fontSize: Size,
                                  withStyle customFont: CustomFontStyle) -> UIFont {
        AssetsHelper.loadFont(customFont, type: .custom)

        guard let font = UIFont(name: customFont.name, size: fontSize.relatedTextStyle.size) else {
            return UIFont.systemFont(ofSize: fontSize.relatedTextStyle.size,
                                     weight: customFont.weight)
        }
        return font
    }

    public static func customFont(ofSize fontSize: CGFloat,
                                  withStyle customFont: CustomFontStyle) -> UIFont {
        AssetsHelper.loadFont(customFont, type: .custom)

        guard let font = UIFont(name: customFont.name, size: fontSize) else {
            return UIFont.systemFont(ofSize: fontSize, weight: customFont.weight)
        }
        return font
    }
}

// MARK: - Size

extension NatFonts {
    public enum Size {
        case heading1
        case heading2
        case heading3
        case heading4
        case heading5
        case heading6
        case subtitle1
        case subtitle2
        case body1
        case body2
        @available(*, deprecated, message: "Button token is deprecated")
        case button
        case caption
        case overline

        var relatedTextStyle: TextStyle {
            let textStyle: TextStyle

            switch self {
            case .heading1: textStyle = .heading1
            case .heading2: textStyle = .heading2
            case .heading3: textStyle = .heading3
            case .heading4: textStyle = .heading4
            case .heading5: textStyle = .heading5
            case .heading6: textStyle = .heading6
            case .subtitle1: textStyle = .subtitle1
            case .subtitle2: textStyle = .subtitle2
            case .body1: textStyle = .body1
            case .body2: textStyle = .body2
            case .button: textStyle = .button
            case .caption: textStyle = .caption
            case .overline: textStyle = .overline
            }

            return textStyle
        }
    }
}

// MARK: - Weight

extension NatFonts {
    public enum Weight {
        case regular
        case medium
        case bold

        var rawValue: UIFont.Weight {
            let weight: UIFont.Weight

            switch self {
            case .regular: weight = .regular
            case .medium: weight = .medium
            case .bold: weight = .bold
            }

            return weight
        }
    }
}
