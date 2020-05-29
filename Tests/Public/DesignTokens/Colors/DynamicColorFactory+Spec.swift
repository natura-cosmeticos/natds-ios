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

struct StubLightColorPalette: ColorPalette {
    let primary = "#FFFFF0"
    let onPrimary = "#FFFFF1"
    let primaryLight = "#FFFFF2"
    let onPrimaryLight = "#FFFFF3"
    let primaryDark = "#FFFFF4"
    let onPrimaryDark = "#FFFFF5"
    let secondary = "#FFFFF6"
    let onSecondary = "#FFFFF7"
    let secondaryLight = "#FFFFF8"
    let onSecondaryLight = "#FFFFF9"
    let secondaryDark = "#FFFF0F"
    let onSecondaryDark = "#FFFF1F"
    let background = "#FFFF2F"
    let onBackground = "#FFFFF3F"
    let surface = "#FFFF4F"
    let onSurface = "#FFFF5F"
    let highlight = "#FFFF6F"
    let highEmphasis = "#FFFF7F"
    let mediumEmphasis = "#FFFF8F"
    let lowEmphasis = "#FFFF9F"
    let success = "#FFF0FF"
    let onSuccess = "#FFF1FF"
    let warning = "#FFF2FF"
    let onWarning = "#FFF3FF"
    let alert = "#FFF4FF"
    let onAlert = "#FFF5FF"
    let link = "#FFF6FF"
    let onLink = "#FFF7FF"
}

struct StubDarkColorPalette: ColorPalette {
    let primary = "#000000"
    let onPrimary = "#000001"
    let primaryLight = "#000002"
    let onPrimaryLight = "#000003"
    let primaryDark = "#000004"
    let onPrimaryDark = "#000005"
    let secondary = "#000006"
    let onSecondary = "#000007"
    let secondaryLight = "#000008"
    let onSecondaryLight = "#000009"
    let secondaryDark = "#000010"
    let onSecondaryDark = "#000020"
    let background = "#000030"
    let onBackground = "#000040"
    let surface = "#000050"
    let onSurface = "#000060"
    let highlight = "#000070"
    let highEmphasis = "#000080"
    let mediumEmphasis = "#000090"
    let lowEmphasis = "#000100"
    let success = "#000200"
    let onSuccess = "#0000300"
    let warning = "#000400"
    let onWarning = "#000500"
    let alert = "#000600"
    let onAlert = "#000700"
    let link = "#000800"
    let onLink = "#000900"
}
