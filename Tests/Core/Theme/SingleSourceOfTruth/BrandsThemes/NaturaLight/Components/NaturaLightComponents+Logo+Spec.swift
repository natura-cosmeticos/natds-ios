import Quick
import Nimble

@testable import NatDS

final class NaturaLightComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when Theme is NaturaLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = NaturaLightTheme()
            }

            describe("#horizontal") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoHorizontal)

                    expect(systemUnderTest).to(equal("Logo/Natura/HorizontalLight"))
                }
            }

            describe("#vertical") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoVertical)

                    expect(systemUnderTest).to(equal("Logo/Natura/VerticalLight"))
                }
            }
        }
    }
}
