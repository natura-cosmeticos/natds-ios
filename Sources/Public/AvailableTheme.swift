/**
  Representation of available themes in Design System.

 - Note:
    Supported Themes:
      - None
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
    case avonv2Dark
    case avonv2Light
    case naturav2Dark
    case naturav2Light
    case none

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
        case is Avonv2DarkTheme: self = .avonv2Dark
        case is Avonv2LightTheme: self = .avonv2Light
        case is Naturav2DarkTheme: self = .naturav2Dark
        case is Naturav2LightTheme: self = .naturav2Light
        case is BiomeLightTheme: self = .none
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
        case .avonv2Dark: instance = Avonv2DarkTheme()
        case .avonv2Light: instance = Avonv2LightTheme()
        case .naturav2Dark: instance = Naturav2DarkTheme()
        case .naturav2Light: instance = Naturav2LightTheme()
        case .none: instance = BiomeLightTheme()
        }
        return instance
    }
}
