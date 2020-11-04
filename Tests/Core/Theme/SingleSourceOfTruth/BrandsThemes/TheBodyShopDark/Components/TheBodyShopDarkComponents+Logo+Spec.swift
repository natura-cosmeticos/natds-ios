import Quick
import Nimble

@testable import NatDS

final class TheBodyShopDarkComponentsLogoSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when Theme is TheBodyShopDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = TheBodyShopDarkTheme()
            }

            describe("#horizontal") {
                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/TheBodyShop/HorizontalDark")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/TheBodyShop/VerticalDark")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }
        }
    }
}
