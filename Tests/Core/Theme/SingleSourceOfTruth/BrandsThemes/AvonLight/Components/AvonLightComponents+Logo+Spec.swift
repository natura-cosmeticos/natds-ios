import Quick
import Nimble

@testable import NatDS

final class AvonLightComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is AvonLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AvonLightTheme()
            }

            describe("#horizontal") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoHorizontal)

                    expect(systemUnderTest).to(equal("Logo/Avon/HorizontalLight"))
                }
            }

            describe("#vertical") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoVertical)

                    expect(systemUnderTest).to(equal("Logo/Avon/VerticalLight"))
                }
            }
        }
    }
}
