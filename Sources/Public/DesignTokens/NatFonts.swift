public class NatFonts {
    public static func font(ofSize size: Size, withWeight weight: Weight) -> UIFont {
        .systemFont(
            ofSize: getTheme().font.sizes[keyPath: size.rawValue],
            weight: getTheme().font.weights[keyPath: weight.rawValue]
        )
    }
}

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
