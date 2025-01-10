/**
  Representation of available themes in Design System.

 - Note:
    Supported Themes:
      - None
      - AvonDark
      - AvonLight
      - Avonv2Dark
      - Avonv2Light
      - NaturaDark
      - NaturaLight
      - Naturav2Dark
      - Naturav2Light
      - Naturav3Dark
      - Naturav3Light
      - TheBodyShopDark
      - TheBodyShopLight
      - ConsultoriaDeBelezaLight
      - ConsultoriaDeBelezaDark
      - CasaEestiloDark
      - CasaEestiloLight
      - CasaEestilov2Dark
      - CasaEestilov2Light
      - ForcaDeVendasDark
      - ForcaDeVendasLight
      - ConsultoriaDeBelezav2Light
      - ConsultoriaDeBelezav2Dark
      - ForcaDeVendasv2Dark
      - ForcaDeVendasv2Light
      
*/

public enum AvailableTheme {
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
    case casaeestilov2Dark
    case casaeestilov2Light
    case avonv2Dark
    case avonv2Light
    case naturav2Dark
    case naturav2Light
    case naturav3Dark
    case naturav3Light
    case forcaDeVendasDark
    case forcaDeVendasLight
    case consultoriaDeBelezav2Dark
    case consultoriaDeBelezav2Light
    case forcaDeVendasv2Dark
    case forcaDeVendasv2Light
    case none

    init?(theme: Theme) {
        switch theme {
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
        case is CasaEestilov2DarkTheme: self = .casaeestilov2Dark
        case is CasaEestilov2LightTheme: self = .casaeestilov2Light
        case is Avonv2DarkTheme: self = .avonv2Dark
        case is Avonv2LightTheme: self = .avonv2Light
        case is Naturav2DarkTheme: self = .naturav2Dark
        case is Naturav2LightTheme: self = .naturav2Light
        case is Naturav3DarkTheme: self = .naturav3Dark
        case is Naturav3LightTheme: self = .naturav3Light
        case is ForcaDeVendasDarkTheme: self = .forcaDeVendasDark
        case is ForcaDeVendasLightTheme: self = .forcaDeVendasLight
        case is ConsultoriaDeBelezav2DarkTheme: self = .consultoriaDeBelezav2Dark
        case is ConsultoriaDeBelezav2LightTheme: self = .consultoriaDeBelezav2Light
        case is ForcaDeVendasv2DarkTheme: self = .forcaDeVendasv2Dark
        case is ForcaDeVendasv2LightTheme: self = .forcaDeVendasv2Light
        default: return nil
        }
    }

    var newInstance: Theme {
        let instance: Theme
        switch self {
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
        case .casaeestilov2Dark: instance = CasaEestilov2DarkTheme()
        case .casaeestilov2Light: instance = CasaEestilov2LightTheme()
        case .avonv2Dark: instance = Avonv2DarkTheme()
        case .avonv2Light: instance = Avonv2LightTheme()
        case .naturav2Dark: instance = Naturav2DarkTheme()
        case .naturav2Light: instance = Naturav2LightTheme()
        case .naturav3Dark: instance = Naturav3DarkTheme()
        case .naturav3Light: instance = Naturav3LightTheme()
        case .forcaDeVendasDark: instance = ForcaDeVendasDarkTheme()
        case .forcaDeVendasLight: instance = ForcaDeVendasLightTheme()
        case .consultoriaDeBelezav2Dark: instance = ConsultoriaDeBelezav2DarkTheme()
        case .consultoriaDeBelezav2Light: instance = ConsultoriaDeBelezav2LightTheme()
        case .forcaDeVendasv2Dark: instance = ForcaDeVendasv2DarkTheme()
        case .forcaDeVendasv2Light: instance = ForcaDeVendasv2LightTheme()
        case .none: instance = NaturaLightTheme()
        }
        return instance
    }
}
