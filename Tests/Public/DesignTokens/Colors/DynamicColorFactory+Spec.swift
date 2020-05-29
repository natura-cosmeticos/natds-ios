import Quick
import Nimble

@testable import NatDS

final class DynamicColorFactorySpec: QuickSpec {
    override func spec() {
        let lightColorPalette = StubLightColorPalette()
        let darkColorPalette = StubDarkColorPalette()
        let systemUserTest = DynamicColorFactory(
               lightColorPalette: lightColorPalette,
               darkColorPalette: darkColorPalette
        )

        describe("#createDynamicColor") {
            it("creates color base on a expected ") {
                let color = systemUserTest.createDynamicColor(for: \.primary)
                let isColorEquivalent = isColorEquivalentToDarkHexOrLightHex(
                    colorUnderTest: color,
                    lightColor: lightColorPalette.primary,
                    darkColor: darkColorPalette.primary
                )

                expect(isColorEquivalent).to(beTrue())
            }

            it("uses expected keyPath") {
                let color = systemUserTest.createDynamicColor(for: \.secondary)
                let isColorEquivalent = isColorEquivalentToDarkHexOrLightHex(
                    colorUnderTest: color,
                    lightColor: lightColorPalette.secondary,
                    darkColor: darkColorPalette.secondary
                )

                expect(isColorEquivalent).to(beTrue())
            }
        }

        func isColorEquivalentToDarkHexOrLightHex(colorUnderTest: UIColor,
                                                  lightColor: String,
                                                  darkColor: String) -> Bool {

            colorUnderTest.asHexString() == lightColor ||
                colorUnderTest.asHexString() == darkColor
        }
    }
}
