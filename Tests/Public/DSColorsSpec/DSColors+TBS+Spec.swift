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
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.primary.asHexString(),
                            lightColor: lightPalette.primary.primary,
                            darkColor: darkPalette.primary.primary
                        )

                        expect(result).to(beTrue())
                    }

                    it("Primary.onPrimary") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.onPrimary.asHexString(),
                            lightColor: lightPalette.primary.onPrimary,
                            darkColor: darkPalette.primary.onPrimary
                        )

                        expect(result).to(beTrue())
                    }

                    it("Primary.primaryLight") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.primaryLight.asHexString(),
                            lightColor: lightPalette.primary.primaryLight,
                            darkColor: darkPalette.primary.primaryLight
                        )

                        expect(result).to(beTrue())
                    }

                    it("Primary.onPrimaryLight") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.onPrimaryLight.asHexString(),
                            lightColor: lightPalette.primary.onPrimaryLight,
                            darkColor: darkPalette.primary.onPrimaryLight
                        )

                        expect(result).to(beTrue())
                    }

                    it("Primary.primaryDark") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.primaryDark.asHexString(),
                            lightColor: lightPalette.primary.primaryDark,
                            darkColor: darkPalette.primary.primaryDark
                        )

                        expect(result).to(beTrue())
                    }

                    it("Primary.onPrimaryDark") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.onPrimaryDark.asHexString(),
                            lightColor: lightPalette.primary.onPrimaryDark,
                            darkColor: darkPalette.primary.onPrimaryDark
                        )

                        expect(result).to(beTrue())
                    }
                } //describe - Primary Color Palette

                describe("Secondary Color Palette") {
                    it("Secondary.secondary") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.secondary.asHexString(),
                            lightColor: lightPalette.secondary.secondary,
                            darkColor: darkPalette.secondary.secondary
                        )

                        expect(result).to(beTrue())
                    }

                    it("Secondary.onSecondary") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.onSecondary.asHexString(),
                            lightColor: lightPalette.secondary.onSecondary,
                            darkColor: darkPalette.secondary.onSecondary
                        )

                        expect(result).to(beTrue())
                    }

                    it("Secondary.secondaryDark") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.secondaryDark.asHexString(),
                            lightColor: lightPalette.secondary.secondaryDark,
                            darkColor: darkPalette.secondary.secondaryDark
                        )

                        expect(result).to(beTrue())
                    }

                    it("Secondary.onSecondaryDark") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.onSecondaryDark.asHexString(),
                            lightColor: lightPalette.secondary.onSecondaryDark,
                            darkColor: darkPalette.secondary.onSecondaryDark
                        )

                        expect(result).to(beTrue())
                    }

                    it("Secondary.secondaryLight") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.secondaryLight.asHexString(),
                            lightColor: lightPalette.secondary.secondaryLight,
                            darkColor: darkPalette.secondary.secondaryLight
                        )

                        expect(result).to(beTrue())
                    }

                    it("Secondary.onSecondaryLight") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.onSecondaryLight.asHexString(),
                            lightColor: lightPalette.secondary.onSecondaryLight,
                            darkColor: darkPalette.secondary.onSecondaryLight
                        )

                        expect(result).to(beTrue())
                    }
                } // describe - Secondary Color Palette

                describe("Surface Color Palette") {
                    it("Surface.background") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.background.asHexString(),
                            lightColor: lightPalette.surface.background,
                            darkColor: darkPalette.surface.background
                        )

                        expect(result).to(beTrue())
                    }

                    it("Surface.onBackground") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.onBackground.asHexString(),
                            lightColor: lightPalette.surface.onBackground,
                            darkColor: darkPalette.surface.onBackground
                        )

                        expect(result).to(beTrue())
                    }

                    it("Surface.surface") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.surface.asHexString(),
                            lightColor: lightPalette.surface.surface,
                            darkColor: darkPalette.surface.surface
                        )

                        expect(result).to(beTrue())
                    }

                    it("Surface.onSurface") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.onSurface.asHexString(),
                            lightColor: lightPalette.surface.onSurface,
                            darkColor: darkPalette.surface.onSurface
                        )

                        expect(result).to(beTrue())
                    }
                } // describe - Surface Color Palette

                describe("Content Color Palette") {
                    it("Content.hightlight") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.hightlight.asHexString(),
                            lightColor: lightPalette.content.hightlight,
                            darkColor: darkPalette.content.hightlight
                        )

                        expect(result).to(beTrue())
                    }

                    it("Content.highEmphasis") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.highEmphasis.asHexString(),
                            lightColor: lightPalette.content.highEmphasis,
                            darkColor: darkPalette.content.highEmphasis
                        )

                        expect(result).to(beTrue())
                    }

                    it("Content.mediumEmphasis") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.highEmphasis.asHexString(),
                            lightColor: lightPalette.content.highEmphasis,
                            darkColor: darkPalette.content.highEmphasis
                        )

                        expect(result).to(beTrue())
                    }

                    it("Content.lowEmphasis") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.lowEmphasis.asHexString(),
                            lightColor: lightPalette.content.lowEmphasis,
                            darkColor: darkPalette.content.lowEmphasis
                        )

                        expect(result).to(beTrue())
                    }

                    it("Content.link") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.link.asHexString(),
                            lightColor: lightPalette.content.link,
                            darkColor: darkPalette.content.link
                        )

                        expect(result).to(beTrue())
                    }

                    it("Content.onLink") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.onLink.asHexString(),
                            lightColor: lightPalette.content.onLink,
                            darkColor: darkPalette.content.onLink
                        )

                        expect(result).to(beTrue())
                    }

                } // describe - Content Color Palette

                describe("Feedback Color Palette") {
                    it("Feedback.success") {
                        let colorUnderTest = DSColors.success.asHexString()

                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: colorUnderTest,
                            lightColor: lightPalette.feedback.success,
                            darkColor: darkPalette.feedback.success
                        )

                        expect(result).to(beTrue())
                    }

                    it("Feedback.onSuccess") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.onSuccess.asHexString(),
                            lightColor: lightPalette.feedback.onSuccess,
                            darkColor: darkPalette.feedback.onSuccess
                        )

                        expect(result).to(beTrue())
                    }

                    it("Feedback.warning") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.warning.asHexString(),
                            lightColor: lightPalette.feedback.warning,
                            darkColor: darkPalette.feedback.warning
                        )

                        expect(result).to(beTrue())
                    }

                    it("Feedback.onWarning") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.onWarning.asHexString(),
                            lightColor: lightPalette.feedback.onWarning,
                            darkColor: darkPalette.feedback.onWarning
                        )

                        expect(result).to(beTrue())
                    }

                    it("Feedback.alert") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.alert.asHexString(),
                            lightColor: lightPalette.feedback.alert,
                            darkColor: darkPalette.feedback.alert
                        )

                        expect(result).to(beTrue())
                    }

                    it("Feedback.onAlert") {
                        let result = isCurrentColorOnCurrentPalette(
                            colorUnderTest: DSColors.onAlert.asHexString(),
                            lightColor: lightPalette.feedback.onAlert,
                            darkColor: darkPalette.feedback.onAlert
                        )

                        expect(result).to(beTrue())
                    }
                } // describe - Feedback Color Palette
            } // context - The Body Shop
        }

        func isCurrentColorOnCurrentPalette(colorUnderTest: String,
                                            lightColor: String,
                                            darkColor: String) -> Bool {

            colorUnderTest == lightColor || colorUnderTest == darkColor
        }
    }
}
