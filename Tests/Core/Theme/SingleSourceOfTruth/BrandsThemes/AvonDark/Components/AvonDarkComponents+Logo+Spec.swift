import Quick
import Nimble

@testable import NatDS

final class AvonDarkComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is AvonDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AvonDarkTheme()
            }

            describe("#horizontal") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoHorizontal)

                    expect(systemUnderTest).to(equal("Logo/Avon/HorizontalDark"))
                }
            }

            describe("#vertical") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoVertical)

                    expect(systemUnderTest).to(equal("Logo/Avon/VerticalDark"))
                }
            }
        }
    }
}
