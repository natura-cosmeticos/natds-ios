import Quick
import Nimble

@testable import NatDS

final class AvonDarkComponentsLogoSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when Theme is AvonDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AvonDarkTheme()
            }

            describe("#horizontal") {
                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Avon/HorizontalDark")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Avon/VerticalDark")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }
        }
    }
}
