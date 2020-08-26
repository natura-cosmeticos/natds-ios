/**
  NatFonts is a struct that has methods to create fonts from the Design System tokens.
  According with the current Brand in the Design System this properties can change.

    Exemple of usage:

        label.font = NatFonts.font(ofSize: .heading6 withWeight: .regular)

 - Requires:
        It's necessary to configure the Design System current Brand at DesignSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

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