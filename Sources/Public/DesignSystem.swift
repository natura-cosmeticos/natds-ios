/**
  DesignSystem is a class entry point of configurations for this framework.

    Exemple of usage:

            DesignSystem().configure(brand: .avon)
            //or
            DesignSystem().configure(brand: .theBodyShop)

 - Note:
    Current Supported Brands:
        - Avon
        - Natura
        - The Body Shop
 
 - Requires:
        It's necessary to configure the Design System current Brand first
        or fatalError will be raised.

            DesisgnSystem().configure(with: Brand)
*/

public final class DesignSystem {

    // MARK: - Private properties

    private let storage: ConfigurationStorable

    // MARK: - Internal properties

    var currentTheme: Theme {
        guard let theme = storage.getTheme() else {
            fatalError("DesignSystem ERROR - DesignSystem.shared.configure(with: Brand) needed!!!!")
        }

        return theme
    }

    // MARK: - Inits

    public convenience init() {
        self.init(storage: ConfigurationStorage.shared)
    }

    init(storage: ConfigurationStorable) {
        self.storage = storage
    }

    // MARK: - Public

    public enum Brand {
        case avon
        case natura
        case theBodyShop
    }

    public func configure(with brand: Brand) {
        switch brand {
        case .avon: storage.save(theme: AvonTheme())
        case .natura: storage.save(theme: NaturaTheme())
        case .theBodyShop: storage.save(theme: TheBodyShopTheme())
        }
    }
}
