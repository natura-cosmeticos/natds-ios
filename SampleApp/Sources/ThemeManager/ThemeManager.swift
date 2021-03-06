import NatDS

final class ThemeManager {
    var currentBrand: BrandThemes = .init(light: .naturaLight, dark: .naturaDark)

    static let shared = ThemeManager()

    func setLight() {
        DesignSystem().configure(with: currentBrand.light)
    }

    func setDark() {
        DesignSystem().configure(with: currentBrand.dark)
    }

    private init() {}
}
