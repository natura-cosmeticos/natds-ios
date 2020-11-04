import Quick
import Nimble

@testable import NatDS

final class NatLogoImagesAesopDarkSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when theme is AesopDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AesopDarkTheme()
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
