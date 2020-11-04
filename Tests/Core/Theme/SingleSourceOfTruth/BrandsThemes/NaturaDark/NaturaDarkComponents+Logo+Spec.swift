import Quick
import Nimble

@testable import NatDS

final class NaturaDarkComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is NaturaDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = NaturaDarkTheme()
            }

            describe("#horizontal") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoHorizontal)

                    expect(systemUnderTest).to(equal("Logo/Natura/HorizontalDark"))
                }
            }

            describe("#vertical") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoVertical)

                    expect(systemUnderTest).to(equal("Logo/Natura/VerticalDark"))
                }
            }
        }
    }
}
