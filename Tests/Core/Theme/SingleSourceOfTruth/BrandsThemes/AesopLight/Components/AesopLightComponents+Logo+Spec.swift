import Quick
import Nimble

@testable import NatDS

final class AesopLightComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is AesopLight") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AesopLightTheme()
            }

            describe("#horizontal") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoHorizontal)

                    expect(systemUnderTest).to(equal("Logo/Aesop/HorizontalLight"))
                }
            }

            describe("#vertical") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoVertical)

                    expect(systemUnderTest).to(equal("Logo/Aesop/VerticalLight"))
                }
            }
        }
    }
}
