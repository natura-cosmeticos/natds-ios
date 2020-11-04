import Quick
import Nimble

@testable import NatDS

final class AesopLightComponentsLogoSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when Theme is AesopLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AesopLightTheme()
            }

            describe("#horizontal") {
                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Aesop/HorizontalLight")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Aesop/VerticalLight")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }
        }
    }
}
