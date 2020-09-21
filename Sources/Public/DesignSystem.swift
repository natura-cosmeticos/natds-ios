/**
  DesignSystem is a class entry point of configurations for this framework.

    Exemple of usage:

            DesignSystem().configure(brand: .avonLight)
            //or
            DesignSystem().configure(brand: .theBodyShopLight)
            //or
            DesignSystem().configure(brand: .theBodyShopDark)

 - Note:
    Current Supported Brands:
        - Avon
        - Natura
        - The Body Shop
 
 - Requires:
        It's necessary to configure the Design System with a theme or fatalError will be raised.

            DesignSystem().configure(with: AvailableTheme)
*/

public final class DesignSystem {

    // MARK: - Private properties

    private let storage: ConfigurationStorage
    private let notificationCenter: NotificationCenterPostable

    // MARK: - Public properties

    public var currentTheme: AvailableTheme? {
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
