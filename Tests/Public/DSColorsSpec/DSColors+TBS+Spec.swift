import Quick
import Nimble

@testable import NatDS

// swiftlint:disable function_body_length type_body_length

final class DSColorsTBSSpec: QuickSpec {
    override func spec() {
        var lightPalette: ColorPalette!
        var darkPalette: ColorPalette!

        beforeEach {
            DesignSystem.shared.configure(with: .theBodyShop)
            let theme = DesignSystem.shared.currentTheme
            lightPalette = theme.lightColorPalette
            darkPalette = theme.darkColorPalette
        }

        describe("colors from PrimaryColorPalette protocol") {
            describe(".primary") {
                it("returns a color equivalent to ColorPalette.primary.primary") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.primary,
                        lightColor: lightPalette.primary.primary,
                        darkColor: darkPalette.primary.primary
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onPrimary") {
                it("returns a color equivalent to ColorPalette.primary.onPrimary") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.onPrimary,
                        lightColor: lightPalette.primary.onPrimary,
                        darkColor: darkPalette.primary.onPrimary
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".primaryLight") {
                it("returns a color equivalent to ColorPalette.primary.primaryLight") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.primaryLight,
                        lightColor: lightPalette.primary.primaryLight,
                        darkColor: darkPalette.primary.primaryLight
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onPrimaryLight") {
                it("returns a color equivalent to ColorPalette.primary.onPrimaryLight") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.onPrimaryLight,
                        lightColor: lightPalette.primary.onPrimaryLight,
                        darkColor: darkPalette.primary.onPrimaryLight
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".primaryDark") {
                it("returns a color equivalent to ColorPalette.primary.primaryDark") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.primaryDark,
                        lightColor: lightPalette.primary.primaryDark,
                        darkColor: darkPalette.primary.primaryDark
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onPrimaryDark") {
                it("returns a color equivalent to ColorPalette.primary.onPrimaryDark") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.onPrimaryDark,
                        lightColor: lightPalette.primary.onPrimaryDark,
                        darkColor: darkPalette.primary.onPrimaryDark
                    )

                    expect(result).to(beTrue())
                }
            }
        } //describe - colors from PrimaryColorPalette protocol

        describe("colors from SecondaryColorPalette protocol") {
            describe(".secondary") {
                it("returns a color equivalent to ColorPalette.secondary.secondary") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.secondary,
                        lightColor: lightPalette.secondary.secondary,
                        darkColor: darkPalette.secondary.secondary
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onSecondary") {
                it("returns a color equivalent to ColorPalette.secondary.onSecondary") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.onSecondary,
                        lightColor: lightPalette.secondary.onSecondary,
                        darkColor: darkPalette.secondary.onSecondary
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".secondaryLight") {
                it("returns a color equivalent to ColorPalette.secondary.secondaryLight") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.secondaryLight,
                        lightColor: lightPalette.secondary.secondaryLight,
                        darkColor: darkPalette.secondary.secondaryLight
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onSecondaryLight") {
                it("returns a color equivalent to ColorPalette.secondary.onSecondaryLight") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.onSecondaryLight,
                        lightColor: lightPalette.secondary.onSecondaryLight,
                        darkColor: darkPalette.secondary.onSecondaryLight
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".secondaryDark") {
                it("returns a color equivalent to ColorPalette.secondary.secondaryDark") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.secondaryDark,
                        lightColor: lightPalette.secondary.secondaryDark,
                        darkColor: darkPalette.secondary.secondaryDark
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onSecondaryDark") {
                it("returns a color equivalent to ColorPalette.secondary.onSecondaryDark") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.onSecondaryDark,
                        lightColor: lightPalette.secondary.onSecondaryDark,
                        darkColor: darkPalette.secondary.onSecondaryDark
                    )

                    expect(result).to(beTrue())
                }
            }
        } // describe - colors from SecondaryColorPalette protocol

        describe("colors from SurfaceColorPalette protocol") {
            describe(".background") {
                it("returns a color equivalent to ColorPalette.surface.background") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.background,
                        lightColor: lightPalette.surface.background,
                        darkColor: darkPalette.surface.background
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onBackground") {
                it("returns a color equivalent to ColorPalette.surface.onBackground") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.onBackground,
                        lightColor: lightPalette.surface.onBackground,
                        darkColor: darkPalette.surface.onBackground
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".surface") {
                it("returns a color equivalent to ColorPalette.surface.surface") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.surface,
                        lightColor: lightPalette.surface.surface,
                        darkColor: darkPalette.surface.surface
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onSurface") {
                it("returns a color equivalent to ColorPalette.surface.onSurface") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.onSurface,
                        lightColor: lightPalette.surface.onSurface,
                        darkColor: darkPalette.surface.onSurface
                    )

                    expect(result).to(beTrue())
                }
            }
        } // describe - colors from SurfaceColorPalette protocol

        describe("colors from ContentColorPalette protocol") {
            describe(".highlight") {
                it("returns a color equivalent to ColorPalette.content.highlight") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.highlight,
                        lightColor: lightPalette.content.highlight,
                        darkColor: darkPalette.content.highlight
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".highEmphasis") {
                it("returns a color equivalent to ColorPalette.content.highEmphasis") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.highEmphasis,
                        lightColor: lightPalette.content.highEmphasis,
                        darkColor: darkPalette.content.highEmphasis
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".mediumEmphasis") {
                it("returns a color equivalent to ColorPalette.content.mediumEmphasis") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.mediumEmphasis,
                        lightColor: lightPalette.content.mediumEmphasis,
                        darkColor: darkPalette.content.mediumEmphasis
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".lowEmphasis") {
                it("returns a color equivalent to ColorPalette.content.lowEmphasis") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.lowEmphasis,
                        lightColor: lightPalette.content.lowEmphasis,
                        darkColor: darkPalette.content.lowEmphasis
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".link") {
                it("returns a color equivalent to ColorPalette.content.link") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.link,
                        lightColor: lightPalette.content.link,
                        darkColor: darkPalette.content.link
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onLink") {
                it("returns a color equivalent to ColorPalette.content.onLink") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.onLink,
                        lightColor: lightPalette.content.onLink,
                        darkColor: darkPalette.content.onLink
                    )

                    expect(result).to(beTrue())
                }
            }
        } // describe - colors from ContentColorPalette protocol

        describe("colors from FeedbackColorPalette protocol") {
            describe(".success") {
                it("returns a color equivalent to ColorPalette.feedback.success") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.success,
                        lightColor: lightPalette.feedback.success,
                        darkColor: darkPalette.feedback.success
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onSuccess") {
                it("returns a color equivalent to ColorPalette.feedback.onSuccess") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.onSuccess,
                        lightColor: lightPalette.feedback.onSuccess,
                        darkColor: darkPalette.feedback.onSuccess
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".warning") {
                it("returns a color equivalent to ColorPalette.feedback.warning") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.warning,
                        lightColor: lightPalette.feedback.warning,
                        darkColor: darkPalette.feedback.warning
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onWarning") {
                it("returns a color equivalent to ColorPalette.feedback.onWarning") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.onWarning,
                        lightColor: lightPalette.feedback.onWarning,
                        darkColor: darkPalette.feedback.onWarning
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".alert") {
                it("returns a color equivalent to ColorPalette.feedback.alert") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.alert,
                        lightColor: lightPalette.feedback.alert,
                        darkColor: darkPalette.feedback.alert
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onAlert") {
                it("returns a color equivalent to ColorPalette.feedback.onAlert") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: DSColors.onAlert,
                        lightColor: lightPalette.feedback.onAlert,
                        darkColor: darkPalette.feedback.onAlert
                    )

                    expect(result).to(beTrue())
                }
            }
        } // describe - colors from FeedbackColorPalette protocol

        func isColorEquivalentToDarkHexOrLightHex(colorUnderTest: UIColor,
                                                  lightColor: String,
                                                  darkColor: String) -> Bool {

            colorUnderTest.asHexString() == lightColor ||
            colorUnderTest.asHexString() == darkColor
        }
    }
}
