/**
  NatFonts is a struct that has methods to create fonts from the Design System tokens.
  According with the current Brand in the Design System this properties can change.

    Exemple of usage:

        label.font = NatFonts.font(ofSize: .heading6 withWeight: .regular)

 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        or fatalError will be raised.

            DesignSystem().configure(with: Brand)
*/

public struct NatFonts {
    public static func font(ofSize size: Size, withWeight weight: Weight) -> UIFont {
        .systemFont(
            ofSize: getTheme().font.sizes[keyPath: size.rawValue],
            weight: getTheme().font.weights[keyPath: weight.rawValue]
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

        var rawValue: KeyPath<FontWeights, UIFont.Weight> {
            let keyPath: KeyPath<FontWeights, UIFont.Weight>

            switch self {
            case .regular: keyPath = \.regular
            case .medium: keyPath = \.medium
            }

            return keyPath
        }
    }
}

// MARK: - KernValues

extension NatFonts {
    public enum Kern {
        public static var heading1: CGFloat { getTheme().font.letterSpacings.heading1 }
        public static var heading2: CGFloat { getTheme().font.letterSpacings.heading2 }
        public static var heading3: CGFloat { getTheme().font.letterSpacings.heading3 }
        public static var heading4: CGFloat { getTheme().font.letterSpacings.heading4 }
        public static var heading5: CGFloat { getTheme().font.letterSpacings.heading5 }
        public static var heading6: CGFloat { getTheme().font.letterSpacings.heading6 }
        public static var subtitle1: CGFloat { getTheme().font.letterSpacings.subtitle1 }
        public static var subtitle2: CGFloat { getTheme().font.letterSpacings.subtitle2 }
        public static var body1: CGFloat { getTheme().font.letterSpacings.body1 }
        public static var body2: CGFloat { getTheme().font.letterSpacings.body2 }
        public static var button: CGFloat { getTheme().font.letterSpacings.button }
        public static var caption: CGFloat { getTheme().font.letterSpacings.caption }
        public static var overline: CGFloat { getTheme().font.letterSpacings.overline }
    }
}
