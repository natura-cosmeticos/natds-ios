import Quick
import Nimble

@testable import NatDS
// swiftlint:disable function_body_length
final class DSColorsTBSSpec: QuickSpec {
    override func spec() {
        describe("DSColors colors properties configured for TBS") {
            var lightPalette: ColorPalette!
            var darkPalette: ColorPalette!

            beforeEach {
                DesignSystem.shared.configure(brand: .theBodyShop)
                let theme = DesignSystem.shared.currentTheme
                lightPalette = theme.lightColorPallet
                darkPalette = theme.darkColorPallet
            }

            context("The Body Shop") {
                describe("Primary Color Palette") {
                    it("Primary.primary") {
                        let colorUnderTest = DSColors.primary.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.primary.primary,
                            darkColor: darkPalette.primary.primary
                        )

                        expect(result).to(beTrue())
                    }

                    it("Primary.onPrimary") {
                        let colorUnderTest = DSColors.onPrimary.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.primary.onPrimary,
                            darkColor: darkPalette.primary.onPrimary
                        )

                        expect(result).to(beTrue())
                    }

                    it("Primary.primaryLight") {
                        let colorUnderTest = DSColors.primaryLight.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.primary.primaryLight,
                            darkColor: darkPalette.primary.primaryLight
                        )

                        expect(result).to(beTrue())
                    }

                    it("Primary.onPrimaryLight") {
                        let colorUnderTest = DSColors.onPrimaryLight.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.primary.onPrimaryLight,
                            darkColor: darkPalette.primary.onPrimaryLight
                        )

                        expect(result).to(beTrue())
                    }

                    it("Primary.primaryDark") {
                        let colorUnderTest = DSColors.primaryDark.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.primary.primaryDark,
                            darkColor: darkPalette.primary.primaryDark
                        )

                        expect(result).to(beTrue())
                    }

                    it("Primary.onPrimaryDark") {
                        let colorUnderTest = DSColors.onPrimaryDark.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.primary.onPrimaryDark,
                            darkColor: darkPalette.primary.onPrimaryDark
                        )

                        expect(result).to(beTrue())
                    }
                } //describe - Primary Color Palette

                describe("Secondary Color Palette") {
                    it("Secondary.secondary") {
                        let colorUnderTest = DSColors.secondary.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.secondary.secondary,
                            darkColor: darkPalette.secondary.secondary
                        )

                        expect(result).to(beTrue())
                    }

                    it("Secondary.onSecondary") {
                        let colorUnderTest = DSColors.onSecondary.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.secondary.onSecondary,
                            darkColor: darkPalette.secondary.onSecondary
                        )

                        expect(result).to(beTrue())
                    }

                    it("Secondary.secondaryDark") {
                        let colorUnderTest = DSColors.secondaryDark.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.secondary.secondaryDark,
                            darkColor: darkPalette.secondary.secondaryDark
                        )

                        expect(result).to(beTrue())
                    }

                    it("Secondary.onSecondaryDark") {
                        let colorUnderTest = DSColors.onSecondaryDark.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.secondary.onSecondaryDark,
                            darkColor: darkPalette.secondary.onSecondaryDark
                        )

                        expect(result).to(beTrue())
                    }

                    it("Secondary.secondaryLight") {
                        let colorUnderTest = DSColors.secondaryLight.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.secondary.secondaryLight,
                            darkColor: darkPalette.secondary.secondaryLight
                        )

                        expect(result).to(beTrue())
                    }

                    it("Secondary.onSecondaryLight") {
                        let colorUnderTest = DSColors.onSecondaryLight.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.secondary.onSecondaryLight,
                            darkColor: darkPalette.secondary.onSecondaryLight
                        )

                        expect(result).to(beTrue())
                    }
                } // describe - Secondary Color Palette

                describe("Surface Color Palette") {
                    it("Surface.background") {
                        let colorUnderTest = DSColors.background.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.surface.background,
                            darkColor: darkPalette.surface.background
                        )

                        expect(result).to(beTrue())
                    }

                    it("Surface.onBackground") {
                        let colorUnderTest = DSColors.onBackground.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.surface.onBackground,
                            darkColor: darkPalette.surface.onBackground
                        )

                        expect(result).to(beTrue())
                    }

                    it("Surface.surface") {
                        let colorUnderTest = DSColors.surface.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.surface.surface,
                            darkColor: darkPalette.surface.surface
                        )

                        expect(result).to(beTrue())
                    }

                    it("Surface.onSurface") {
                        let colorUnderTest = DSColors.onSurface.asHexString()

                        let result = compare(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.surface.onSurface,
                            darkColor: darkPalette.surface.onSurface
                        )

                        expect(result).to(beTrue())
                    }
                } // describe - Surface Color Palette

                describe("Content Color Palette") {

                } // describe - Content Color Palette

                describe("Feedback Color Palette") {

                } // describe - Feedback Color Palette
            } // context - The Body Shop
        }

        func compare(colorUnderTest: String, lightColor: String, darkColor: String) -> Bool {
            colorUnderTest == lightColor || colorUnderTest == darkColor
        }
    }
}

fileprivate extension UIColor {
    func asHexString() -> String {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let rgb: Int = (Int)(r * 255) << 16 | (Int)(g * 255) << 8 | (Int) ( b * 255) << 0

        return String(format: "#%06x", rgb).uppercased()
    }
}
