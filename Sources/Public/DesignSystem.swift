/**
  DesignSystem is a class entry point of configurations for this framework.

    Exemple of usage:

            DesignSystem.shared.configure(brand: .avon)
            //or
            DesignSystem.shared.configure(brand: .theBodyShop)

 - Note:
    Current Supported Brands:
        - Avon
        - Natura
        - The Body Shop
 
 - Requires:
        It's necessary to configure the Design System current Brand first
        or fatalError will be raised.

            DesisgnSystem.shared.configure(with: Brand)

 - Warning
        This class is a singleton.
*/

public final class DesignSystem {

    // MARK: - Private properties

    private var theme: Theme?

    // MARK: - Internal properties

    var currentTheme: Theme {
        guard let theme = theme else {
            fatalError("DesignSystem ERROR - DesignSystem.shared.configure(with: Brand) needed!!!!")
        }

        return theme
    }

    // MARK: - Inits

    private init() {}

    // MARK: - Public

    public static let shared = DesignSystem()

    public enum Brand {
        case avon
        case natura
        case theBodyShop
    }

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
