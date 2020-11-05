import Quick
import Nimble

@testable import NatDS

final class NatLogoImagesAvonDarkSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when theme is AvonDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AvonDarkTheme()
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
