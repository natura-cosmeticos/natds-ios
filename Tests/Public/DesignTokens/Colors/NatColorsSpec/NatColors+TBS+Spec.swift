import Quick
import Nimble

@testable import NatDS

final class NatColorsTBSSpec: QuickSpec {
    override func spec() {
        var lightPalette: ColorPalette!
        var darkPalette: ColorPalette!

        beforeEach {
            DesignSystem().configure(with: .theBodyShop)

            lightPalette = TheBodyShopColorPaletteLight()
            darkPalette = TheBodyShopColorPaletteDark()
        }

        describe("colors from Primary") {
            describe(".primary") {
                it("returns a color equivalent to ColorPalette.primary") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.primary,
                        lightColor: lightPalette.primary,
                        darkColor: darkPalette.primary
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onPrimary") {
                it("returns a color equivalent to ColorPalette.onPrimary") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.onPrimary,
                        lightColor: lightPalette.onPrimary,
                        darkColor: darkPalette.onPrimary
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".primaryLight") {
                it("returns a color equivalent to ColorPalette.primaryLight") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.primaryLight,
                        lightColor: lightPalette.primaryLight,
                        darkColor: darkPalette.primaryLight
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onPrimaryLight") {
                it("returns a color equivalent to ColorPalette.onPrimaryLight") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.onPrimaryLight,
                        lightColor: lightPalette.onPrimaryLight,
                        darkColor: darkPalette.onPrimaryLight
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".primaryDark") {
                it("returns a color equivalent to ColorPalette.primaryDark") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.primaryDark,
                        lightColor: lightPalette.primaryDark,
                        darkColor: darkPalette.primaryDark
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onPrimaryDark") {
                it("returns a color equivalent to ColorPalette.onPrimaryDark") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.onPrimaryDark,
                        lightColor: lightPalette.onPrimaryDark,
                        darkColor: darkPalette.onPrimaryDark
                    )

                    expect(result).to(beTrue())
                }
            }
        } //describe - colors from Primary

        describe("colors from Secondary") {
            describe(".secondary") {
                it("returns a color equivalent to ColorPalette.secondary") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.secondary,
                        lightColor: lightPalette.secondary,
                        darkColor: darkPalette.secondary
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onSecondary") {
                it("returns a color equivalent to ColorPalette.onSecondary") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.onSecondary,
                        lightColor: lightPalette.onSecondary,
                        darkColor: darkPalette.onSecondary
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".secondaryLight") {
                it("returns a color equivalent to ColorPalette.secondaryLight") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.secondaryLight,
                        lightColor: lightPalette.secondaryLight,
                        darkColor: darkPalette.secondaryLight
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onSecondaryLight") {
                it("returns a color equivalent to ColorPalette.onSecondaryLight") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.onSecondaryLight,
                        lightColor: lightPalette.onSecondaryLight,
                        darkColor: darkPalette.onSecondaryLight
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".secondaryDark") {
                it("returns a color equivalent to ColorPalette.secondaryDark") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.secondaryDark,
                        lightColor: lightPalette.secondaryDark,
                        darkColor: darkPalette.secondaryDark
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onSecondaryDark") {
                it("returns a color equivalent to ColorPalette.onSecondaryDark") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.onSecondaryDark,
                        lightColor: lightPalette.onSecondaryDark,
                        darkColor: darkPalette.onSecondaryDark
                    )

                    expect(result).to(beTrue())
                }
            }
        } // describe - colors from Secondary

        describe("colors from Surface") {
            describe(".background") {
                it("returns a color equivalent to ColorPalette.background") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.background,
                        lightColor: lightPalette.background,
                        darkColor: darkPalette.background
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onBackground") {
                it("returns a color equivalent to ColorPalette.onBackground") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.onBackground,
                        lightColor: lightPalette.onBackground,
                        darkColor: darkPalette.onBackground
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".surface") {
                it("returns a color equivalent to ColorPalette.surface") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.surface,
                        lightColor: lightPalette.surface,
                        darkColor: darkPalette.surface
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onSurface") {
                it("returns a color equivalent to ColorPalette.onSurface") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.onSurface,
                        lightColor: lightPalette.onSurface,
                        darkColor: darkPalette.onSurface
                    )

                    expect(result).to(beTrue())
                }
            }
        } // describe - colors from Surface

        describe("colors from Content") {
            describe(".highlight") {
                it("returns a color equivalent to ColorPalette.highlight") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.highlight,
                        lightColor: lightPalette.highlight,
                        darkColor: darkPalette.highlight
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".highEmphasis") {
                it("returns a color equivalent to ColorPalette.highEmphasis") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.highEmphasis,
                        lightColor: lightPalette.highEmphasis,
                        darkColor: darkPalette.highEmphasis
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".mediumEmphasis") {
                it("returns a color equivalent to ColorPalette.mediumEmphasis") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.mediumEmphasis,
                        lightColor: lightPalette.mediumEmphasis,
                        darkColor: darkPalette.mediumEmphasis
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".lowEmphasis") {
                it("returns a color equivalent to ColorPalette.lowEmphasis") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.lowEmphasis,
                        lightColor: lightPalette.lowEmphasis,
                        darkColor: darkPalette.lowEmphasis
                    )

                    expect(result).to(beTrue())
                }
            }
        } // describe - colors from Content

        describe("colors from Feedback") {
            describe(".success") {
                it("returns a color equivalent to ColorPalette.success") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.success,
                        lightColor: lightPalette.success,
                        darkColor: darkPalette.success
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onSuccess") {
                it("returns a color equivalent to ColorPalette.onSuccess") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.onSuccess,
                        lightColor: lightPalette.onSuccess,
                        darkColor: darkPalette.onSuccess
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".warning") {
                it("returns a color equivalent to ColorPalette.warning") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.warning,
                        lightColor: lightPalette.warning,
                        darkColor: darkPalette.warning
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onWarning") {
                it("returns a color equivalent to ColorPalette.onWarning") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.onWarning,
                        lightColor: lightPalette.onWarning,
                        darkColor: darkPalette.onWarning
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".alert") {
                it("returns a color equivalent to ColorPalette.alert") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.alert,
                        lightColor: lightPalette.alert,
                        darkColor: darkPalette.alert
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onAlert") {
                it("returns a color equivalent to ColorPalette.onAlert") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.onAlert,
                        lightColor: lightPalette.onAlert,
                        darkColor: darkPalette.onAlert
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".link") {
                it("returns a color equivalent to ColorPalette.link") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.link,
                        lightColor: lightPalette.link,
                        darkColor: darkPalette.link
                    )

                    expect(result).to(beTrue())
                }
            }

            describe(".onLink") {
                it("returns a color equivalent to ColorPalette.onLink") {
                    let result = isColorEquivalentToDarkHexOrLightHex(
                        colorUnderTest: NatColors.onLink,
                        lightColor: lightPalette.onLink,
                        darkColor: darkPalette.onLink
                    )

                    expect(result).to(beTrue())
                }
            }
        } // describe - colors from Feedback

        func isColorEquivalentToDarkHexOrLightHex(colorUnderTest: UIColor,
                                                  lightColor: String,
                                                  darkColor: String) -> Bool {

            colorUnderTest.asHexString() == lightColor ||
                colorUnderTest.asHexString() == darkColor
        }
    }
}
