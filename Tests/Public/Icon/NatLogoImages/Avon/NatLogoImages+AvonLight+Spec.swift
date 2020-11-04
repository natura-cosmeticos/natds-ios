import Quick
import Nimble

@testable import NatDS

final class NatLogoImagesAvonLightSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when theme is AvonLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AvonLightTheme()
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
