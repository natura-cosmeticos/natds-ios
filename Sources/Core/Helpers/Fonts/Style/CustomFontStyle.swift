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
          let tokenFontName = filename
          let systemFontName = fontNameMapping[tokenFontName] ?? tokenFontName
          FontLoader.loadFontIfNeeded(named: systemFontName)
          return systemFontName
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

public let fontNameMapping: [String: String] = [
  "montserrat_bold": "Montserrat-Bold",
  "montserrat_regular": "Montserrat-Regular",
  "montserrat_semibold": "Montserrat-SemiBold",
  "suisseintl_regular": "SuisseIntl-Regular",
  "zapfhumanist_roman": "ZapfHumanist601BT-Roman",
  "worksans_bold": "WorkSans-Bold",
  "worksans_regular": "WorkSans-Regular",
  "drukcy_bold": "DrukCy-Bold",
  "recoleta_semibold": "Recoleta-SemiBold"
]
