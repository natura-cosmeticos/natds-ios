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
            ofSize: getTheme().font.sizes[keyPath: size.rawValue],
            weight: weight.rawValue
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

        var rawValue: KeyPath<FontSizes, CGFloat> {
            let keyPath: KeyPath<FontSizes, CGFloat>

            switch self {
            case .heading1: keyPath = \.heading1
            case .heading2: keyPath = \.heading2
            case .heading3: keyPath = \.heading3
            case .heading4: keyPath = \.heading4
            case .heading5: keyPath = \.heading5
            case .heading6: keyPath = \.heading6
            case .subtitle1: keyPath = \.subtitle1
            case .subtitle2: keyPath = \.subtitle2
            case .body1: keyPath = \.body1
            case .body2: keyPath = \.body2
            case .button: keyPath = \.button
            case .caption: keyPath = \.caption
            case .overline: keyPath = \.overline
            }

            return keyPath
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
            case .regular: weight = getTheme().font.weights.regular
            case .medium: weight = getTheme().font.weights.medium
            case .bold: weight = .bold
            }

            return weight
        }
    }
}
