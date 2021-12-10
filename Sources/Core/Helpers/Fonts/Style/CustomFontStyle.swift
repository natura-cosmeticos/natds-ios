/// Enum that gets the attributes for each type of custom font and enables the use of customised typography by brand
public enum CustomFontStyle: FontStyle {
    case display
    case headline
    case bodyRegular
    case bodyBold

    var filename: String {
        switch self {
        case .display: return getTokenFromTheme(\.assetFontFileDisplay)
        case .headline: return getTokenFromTheme(\.assetFontFileHeadline)
        case .bodyRegular: return getTokenFromTheme(\.assetFontFileBodyRegular)
        case .bodyBold: return getTokenFromTheme(\.assetFontFileBodyBold)
        }
    }

    var name: String {
        switch self {
        case .display: return getTokenFromTheme(\.assetFontFileDisplay)
        case .headline: return getTokenFromTheme(\.assetFontFileHeadline)
        case .bodyRegular: return getTokenFromTheme(\.assetFontFileBodyRegular)
        case .bodyBold: return getTokenFromTheme(\.assetFontFileBodyBold)
        }
    }

    var familyName: String {
        switch self {
        case .display: return getTokenFromTheme(\.typographyDisplayFontFamily)
        case .headline: return getTokenFromTheme(\.typographyHeadlineFontFamily)
        case .bodyRegular: return getTokenFromTheme(\.typographyBodyRegularFontFamily)
        case .bodyBold: return getTokenFromTheme(\.typographyBodyBoldFontFamily)
        }
    }

    var weight: UIFont.Weight {
        switch self {
        case .display: return getTokenFromTheme(\.typographyDisplayFontWeight)
        case .headline: return getTokenFromTheme(\.typographyHeadlineFontWeight)
        case .bodyRegular: return getTokenFromTheme(\.typographyBodyRegularFontWeight)
        case .bodyBold: return getTokenFromTheme(\.typographyBodyBoldFontWeight)
        }
    }
}
