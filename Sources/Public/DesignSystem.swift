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

            DesignSystem().configure(with: Brand)
*/

public final class DesignSystem {

    // MARK: - Private properties

    private let storage: ConfigurationStorage
    private let notificationCenter: NotificationCenterPostable

    // MARK: - Public properties

    var currentTheme: AvailableTheme? {
        storage
            .currentTheme
            .flatMap(AvailableTheme.init)
    }

    // MARK: - Inits

    public convenience init() {
        self.init(storage: ConfigurationStorage.shared, notificationCenter: NotificationCenter.default)
    }

    init(storage: ConfigurationStorage, notificationCenter: NotificationCenterPostable) {
        self.storage = storage
        self.notificationCenter = notificationCenter
    }

    // MARK: - Public methods

    public func configure(with theme: AvailableTheme) {
        storage.currentTheme = theme.newInstance
        storage.cachedColors = [:]

        notificationCenter.post(name: .themeHasChanged, object: nil)
    }
}

// MARK: - Under Refactoring, will be deprecated

extension DesignSystem {
    public enum Brand {
        case avon
        case natura
        case theBodyShop
    }

    public func configure(with brand: Brand) {
        switch brand {
        case .avon:
            storage.save(theme: AvonTheme())
            configure(with: .avonLight)
        case .natura:
            storage.save(theme: NaturaTheme())
            configure(with: .naturaLight)
        case .theBodyShop:
            storage.save(theme: TheBodyShopTheme())
            configure(with: .theBodyShopLight)
        }
    }

    public var currentBrand: Brand? {
        let theme = storage.getTheme()
        return getBrandFrom(theme: theme)
    }

    private func getBrandFrom(theme: Theme?) -> Brand? {
        let brand: Brand?

        switch theme {
        case is AvonTheme: brand = .avon
        case is NaturaTheme: brand = .natura
        case is TheBodyShopTheme: brand = .theBodyShop
        default: brand = nil
        }
        return brand
    }
}
