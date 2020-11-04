import Quick
import Nimble

@testable import NatDS

final class NatLogoImagesTheBodyShopDarkSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when theme is TheBodyShopDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = TheBodyShopDarkTheme()
            }

            describe("#horizontal") {
                it("returns an image") {
                    expect(systemUnderTest.horizontal).toNot(beNil())
                }
            }

            describe("#vertical") {
                it("returns an image") {
                    expect(systemUnderTest.vertical).toNot(beNil())
                }
            }
        }
    }
}
