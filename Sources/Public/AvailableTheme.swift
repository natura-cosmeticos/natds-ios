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
      - ConsultoriaDeBelezaLight
      - ConsultoriaDeBelezaDark
      - CasaEestiloDark
      - CasaEestiloLight
      - AvonV2Dark
      - AvonV2Light
*/

public enum AvailableTheme {
    case aesopDark
    case aesopLight
    case avonDark
    case avonLight
    case naturaDark
    case naturaLight
    case theBodyShopDark
    case theBodyShopLight
    case consultoriaDeBelezaDark
    case consultoriaDeBelezaLight
    case casaeestiloDark
    case casaeestiloLight
    case avon_v2Dark
    case avon_v2Light
    case natura_v2Dark
    case natura_v2Light

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
        case is ConsultoriaDeBelezaDarkTheme: self = .consultoriaDeBelezaDark
        case is ConsultoriaDeBelezaLightTheme: self = .consultoriaDeBelezaLight
        case is CasaEestiloDarkTheme: self = .casaeestiloDark
        case is CasaEestiloLightTheme: self = .casaeestiloLight
        case is Avon_v2DarkTheme: self = .avon_v2Dark
        case is Avon_v2LightTheme: self = .avon_v2Light
        case is Natura_v2DarkTheme: self = .natura_v2Dark
        case is Natura_v2LightTheme: self = .natura_v2Light
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
        case .consultoriaDeBelezaDark: instance = ConsultoriaDeBelezaDarkTheme()
        case .consultoriaDeBelezaLight: instance = ConsultoriaDeBelezaLightTheme()
        case .casaeestiloDark: instance = CasaEestiloDarkTheme()
        case .casaeestiloLight: instance = CasaEestiloLightTheme()
        case .avon_v2Dark: instance = Avon_v2DarkTheme()
        case .avon_v2Light: instance = Avon_v2LightTheme()
        case .natura_v2Dark: instance = Natura_v2DarkTheme()
        case .natura_v2Light: instance = Natura_v2LightTheme()
        }
        return instance
    }
}
