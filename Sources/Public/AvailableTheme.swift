/**
  Representation of available themes in Design System.

 - Note:
    Supported Themes:
      - AesopDark
      - AesopLight
      - AvonDark
      - AvonLight
      - NaturaDark
      - NaturaLight
      - TheBodyShopDark
      - TheBodyShopLight
*/

public enum AvailableTheme {
    case avonDark
    case avonLight
    case naturaDark
    case naturaLight
    case theBodyShopDark
    case theBodyShopLight
    case aesopDark
    case aesopLight

    init?(theme: Theme) {
        switch theme {
        case is AesopDarkTheme: self = .aesopDark
        case is AesopLightTheme: self = .aesopLight
        case is AvonDarkTheme: self = .avonDark
        case is AvonLightTheme: self = .avonLight
        case is NaturaDarkTheme: self = .naturaDark
        case is NaturaLightTheme: self = .naturaLight
        case is TheBodyShopDarkTheme: self = .theBodyShopDark
        case is TheBodyShopLightTheme: self = .theBodyShopLight
        default: return nil
        }
    }

    var newInstance: Theme {
        let instance: Theme

        switch self {
        case .aesopDark: instance = AesopDarkTheme()
        case .aesopLight: instance = AesopLightTheme()
        case .avonDark: instance = AvonDarkTheme()
        case .avonLight: instance = AvonLightTheme()
        case .naturaDark: instance = NaturaDarkTheme()
        case .naturaLight: instance = NaturaLightTheme()
        case .theBodyShopDark: instance = TheBodyShopDarkTheme()
        case .theBodyShopLight: instance = TheBodyShopLightTheme()
        }

        return instance
    }
}
