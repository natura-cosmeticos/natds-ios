import Quick
import Nimble

@testable import NatDS

final class NatColorsSpec: QuickSpec {
    override func spec() {
        let stubTheme = StubThemeProtocol()

        beforeEach {
            ConfigurationStorage.shared.currentTheme = stubTheme
        }

        describe("colors from Primary") {
            describe("#primary") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorPrimary)

                    expect(NatColors.primary).to(equal(expectedColor))
                }
            }

            describe("#onPrimary") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorOnPrimary)

                    expect(NatColors.onPrimary).to(equal(expectedColor))
                }
            }

            describe("#primaryDark") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorPrimaryDark)

                    expect(NatColors.primaryDark).to(equal(expectedColor))
                }
            }

            describe("#onPrimaryDark") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorOnPrimaryDark)

                    expect(NatColors.onPrimaryDark).to(equal(expectedColor))
                }
            }

            describe("#primaryLight") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorPrimaryLight)

                    expect(NatColors.primaryLight).to(equal(expectedColor))
                }
            }

            describe("#onPrimaryLight") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorOnPrimaryLight)

                    expect(NatColors.onPrimaryLight).to(equal(expectedColor))
                }
            }
        } //describe - colors from Primary

        describe("colors from Secondary") {
            describe("#secondary") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorSecondary)

                    expect(NatColors.secondary).to(equal(expectedColor))
                }
            }

            describe("#onSecondary") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorOnSecondary)

                    expect(NatColors.onSecondary).to(equal(expectedColor))
                }
            }

            describe("#secondaryDark") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorSecondaryDark)

                    expect(NatColors.secondaryDark).to(equal(expectedColor))
                }
            }

            describe("#onSecondaryDark") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorOnSecondaryDark)

                    expect(NatColors.onSecondaryDark).to(equal(expectedColor))
                }
            }

            describe("#secondaryLight") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorSecondaryLight)

                    expect(NatColors.secondaryLight).to(equal(expectedColor))
                }
            }

            describe("#onSecondaryLight") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorOnSecondaryLight)

                    expect(NatColors.onSecondaryLight).to(equal(expectedColor))
                }
            }
        } // describe - colors from Secondary

        describe("colors from Surface") {
            describe("#background") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorBackground)

                    expect(NatColors.background).to(equal(expectedColor))
                }
            }

            describe("#onBackground") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorOnBackground)

                    expect(NatColors.onBackground).to(equal(expectedColor))
                }
            }

            describe("#surface") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorSurface)

                    expect(NatColors.surface).to(equal(expectedColor))
                }
            }

            describe("#onSurface") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorOnSurface)

                    expect(NatColors.onSurface).to(equal(expectedColor))
                }
            }
        } // describe - colors from Surface

        describe("colors from Content") {
            describe("#highlight") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorHighlight)

                    expect(NatColors.highlight).to(equal(expectedColor))
                }
            }

            describe("#highEmphasis") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorHighEmphasis)

                    expect(NatColors.highEmphasis).to(equal(expectedColor))
                }
            }

            describe("#mediumEmphasis") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorMediumEmphasis)

                    expect(NatColors.mediumEmphasis).to(equal(expectedColor))
                }
            }

            describe("#lowEmphasis") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorLowEmphasis)

                    expect(NatColors.lowEmphasis).to(equal(expectedColor))
                }
            }
        } // describe - colors from Content
//
        describe("colors from Feedback") {
            describe("#success") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorSuccess)

                    expect(NatColors.success).to(equal(expectedColor))
                }
            }

            describe("#onSuccess") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorOnSuccess)

                    expect(NatColors.onSuccess).to(equal(expectedColor))
                }
            }

            describe("#warning") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorWarning)

                    expect(NatColors.warning).to(equal(expectedColor))
                }
            }

            describe("#onWarning") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorOnWarning)

                    expect(NatColors.onWarning).to(equal(expectedColor))
                }
            }

            describe("#alert") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorAlert)

                    expect(NatColors.alert).to(equal(expectedColor))
                }
            }

            describe("#onAlert") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorOnAlert)

                    expect(NatColors.onAlert).to(equal(expectedColor))
                }
            }

            describe("#link") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorLink)

                    expect(NatColors.link).to(equal(expectedColor))
                }
            }

            describe("#onLink") {
                it("returns an expected color") {
                    let expectedColor = getUIColorFromTokens(\.colorOnLink)

                    expect(NatColors.onLink).to(equal(expectedColor))
                }
            }
        } // describe - colors from Feedback
    }
}
