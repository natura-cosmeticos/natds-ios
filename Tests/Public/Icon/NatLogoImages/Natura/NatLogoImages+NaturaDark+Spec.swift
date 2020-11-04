import Quick
import Nimble

@testable import NatDS

final class NatLogoImagesNaturaDarkSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when theme is NaturaDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = NaturaDarkTheme()
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
