/**
  DesignSystem is a class entry point of configurations for this framework.

    Exemple of usage:

            DesignSystem.shared.configure(brand: .avon)
            //or
            DesignSystem.shared.configure(brand: .theBodyShop)

 - Note:
    Current Supported Brands:
        - Avon
        - The Body Shop
 
 - Requires:
        It's necessary to configure the Design System current Brand first
        or fatalError will be raised.

            DesisgnSystem.shared.configure(with: Brand)

 - Warning
        This class is a singleton.
*/

public final class DesignSystem {
    public enum Brand {
        case avon
        case natura
        case theBodyShop
    }

    public static let shared = DesignSystem()

    private var theme: Theme?

    var currentTheme: Theme {
        guard let theme = theme else {
            fatalError("DesignSystem ERROR - DesignSystem.shared.configure(with: Brand) needed!!!!")
        }

        return theme
    }

    private init() {}

    public func configure(with brand: Brand) {
        switch brand {
        case .avon:
            theme = AvonTheme()
        case .natura:
            theme = NaturaTheme()
        case .theBodyShop:
            theme = TheBodyShopTheme()
        }
    }
}
