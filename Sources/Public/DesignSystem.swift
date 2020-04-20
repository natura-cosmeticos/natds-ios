/**
  DesignSystem is a framework configuration class.
 
 - Note:
    Current Suported Brands:
        - Avon
        - The Body Shop
 
 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        with method DesisgnSystem.configure(brand:) or will lead to fatal error.
*/

public final class DesignSystem {
    public enum Brand {
        case avon
        case theBodyShop
    }

    static let shared = DesignSystem()

    private var theme: Theme? = TheBodyShopTheme() // Default is only for development.
    
    var currentTheme: Theme {
        guard let theme = theme else {
            fatalError("DesignSystem ERROR - Configure the Framework first with DesignSystem.configure(brand:)")
        }
        
        return theme
    }

    public func configure(brand: Brand) {
        switch brand {
        case .avon:
            theme = AvonTheme()
        case .theBodyShop:
            theme = TheBodyShopTheme()
        }
    }
}
