import Quick
import Nimble

@testable import NatDS

final class AesopDarkComponentsLogoSpec: QuickSpec {
    override func spec() {
        context("when theme is AesopDark") {
            beforeEach {
                ConfigurationStorage.shared.currentTheme = AesopDarkTheme()
            }

            describe("#horizontal") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoHorizontal)

                    expect(systemUnderTest).to(equal("Logo/Aesop/HorizontalDark"))
                }
            }

            describe("#vertical") {
                it("returns a expected path") {
                    let systemUnderTest = getComponentAttributeFromTheme(\.logoVertical)

                    expect(systemUnderTest).to(equal("Logo/Aesop/VerticalDark"))
                }
            }
        }
    }
}
