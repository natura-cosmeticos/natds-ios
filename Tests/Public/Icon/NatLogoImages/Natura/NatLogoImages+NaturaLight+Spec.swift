import Quick
import Nimble

@testable import NatDS

final class NatLogoImagesNaturaLightSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when theme is NaturaLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
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
