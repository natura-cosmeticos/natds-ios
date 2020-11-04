import Quick
import Nimble

@testable import NatDS

final class TheBodyShopDarkComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when Theme is TheBodyShopDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = TheBodyShopDarkTheme()
            }

            describe("#horizontal") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoHorizontal)

                    expect(systemUnderTest).to(equal("Logo/TheBodyShop/HorizontalDark"))
                }
            }

            describe("#vertical") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoVertical)

                    expect(systemUnderTest).to(equal("Logo/TheBodyShop/VerticalDark"))
                }
            }
        }
    }
}
