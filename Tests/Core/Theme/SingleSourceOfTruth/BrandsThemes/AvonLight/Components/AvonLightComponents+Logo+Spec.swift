import Quick
import Nimble

@testable import NatDS

final class AvonLightComponentsLogoSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when Theme is AvonLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AvonLightTheme()
            }

            describe("#horizontal") {
                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Avon/HorizontalLight")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Avon/VerticalLight")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }
        }
    }
}
