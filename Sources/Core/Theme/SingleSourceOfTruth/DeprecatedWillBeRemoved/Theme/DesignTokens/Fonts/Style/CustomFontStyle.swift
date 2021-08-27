public enum CustomFontStyle: FontStyle {
    case display
    case headline
    case body

    var filename: String {
        switch self {
        case .display: return getTokenFromTheme(\.assetFontFileDisplay)
        case .headline: return getTokenFromTheme(\.assetFontFileHeadline)
        case .body: return getTokenFromTheme(\.assetFontFileBody)
        }
    }

    var name: String {
        switch self {
        case .display: return getTokenFromTheme(\.typographyFontFamilyDisplay)
        case .headline: return getTokenFromTheme(\.typographyFontFamilyHeadline)
        case .body: return getTokenFromTheme(\.typographyFontFamilyBody)
        }
    }

    var familyName: String {
        switch self {
        case .display: return getTokenFromTheme(\.typographyFontFamilyDisplay)
        case .headline: return getTokenFromTheme(\.typographyFontFamilyHeadline)
        case .body: return getTokenFromTheme(\.typographyFontFamilyBody)
        }
    }
}
