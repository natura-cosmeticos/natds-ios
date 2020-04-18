final class DesignSystem {
    enum Brand {
        case avon
        case theBodyShop
    }

    static let shared = DesignSystem()

    var currentTheme: Theme = AvonTheme()

    func configure(brand: Brand) {
        switch brand {
        case .avon:
            currentTheme = AvonTheme()
        case .theBodyShop:
            currentTheme = TheBodyShopTheme()
        }
    }
}
