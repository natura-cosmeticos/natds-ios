import Quick
import Nimble

@testable import NatDS

final class NaturaDarkComponentsLogoSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatLogoImages.self

        context("when Theme is NaturaDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = NaturaDarkTheme()
            }

            describe("#horizontal") {
                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Natura/HorizontalDark")

                    expect(systemUnderTest.horizontal).to(equal(expectedImage))
                }
            }

            describe("#vertical") {
                it("returns a expected image") {
                    let expectedImage = AssetsHelper.image(from: "Logo/Natura/VerticalDark")

                    expect(systemUnderTest.vertical).to(equal(expectedImage))
                }
            }
        }
    }
}
