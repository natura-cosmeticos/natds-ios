import Quick
import Nimble

@testable import NatDS

final class TheBodyShopLightComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is TheBodyShopLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = TheBodyShopLightTheme()
            }

            describe("#horizontal") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoHorizontal)

                    expect(systemUnderTest).to(equal("Logo/TheBodyShop/HorizontalLight"))
                }
            }

            describe("#vertical") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoVertical)

                    expect(systemUnderTest).to(equal("Logo/TheBodyShop/VerticalLight"))
                }
            }
        }
    }
}
