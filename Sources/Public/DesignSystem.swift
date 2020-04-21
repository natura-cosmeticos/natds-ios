/**
  DesignSystem is a class entry point of configurations for this framework.

    Exemple of usage:

            DesignSystem.shared.configure(brand: .avon)
            //or
            DesignSystem.shared.configure(brand: .theBodyShop)

 - Note:
    Current Suported Brands:
        - Avon
        - The Body Shop
 
 - Requires:
        It's necessary to configure the Design System current Brand at DesisgnSystem class
        with method DesisgnSystem.configure(brand:) or will lead to fatal error.

 - Warning
        This class is a singleton.
*/

public final class DesignSystem {
    public enum Brand {
        case avon
        case theBodyShop
    }

    static let shared = DesignSystem()

    private var theme: Theme?

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
