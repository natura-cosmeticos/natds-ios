import Quick
import Nimble

@testable import NatDS

final class TheBodyShopLightComponentsLogoSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when Theme is TheBodyShopLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = TheBodyShopLightTheme()
            }

            describe("#horizontal") {
                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/TheBodyShop/HorizontalLight")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/TheBodyShop/VerticalLight")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }
        }
    }
}
