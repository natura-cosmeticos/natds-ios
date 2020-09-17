import Quick
import Nimble

@testable import NatDS

final class NatSpacingSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatSpacing.self

        context("AvonDark") {
            let tokens = AvonDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .avonDark)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(tokens.spacingMicro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(tokens.spacingTiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.spacingSmall))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(tokens.spacingStandard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(tokens.spacingSemi))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.spacingLarge))
                }
            }

            describe("#xLarge") {
                it("returns a expect value") {
                    expect(systemUnderTest.xLarge).to(equal(tokens.spacingXLarge))
                }
            }
        } // context - when using AvonDark as theme

        context("AvonLight") {
            let tokens = AvonLightTokens()

            beforeEach {
                DesignSystem().configure(with: .avonLight)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(tokens.spacingMicro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(tokens.spacingTiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.spacingSmall))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(tokens.spacingStandard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(tokens.spacingSemi))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.spacingLarge))
                }
            }

            describe("#xLarge") {
                it("returns a expect value") {
                    expect(systemUnderTest.xLarge).to(equal(tokens.spacingXLarge))
                }
            }
        } // context - when using AvonLight as theme

        context("NaturaDark") {
            let tokens = NaturaDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .naturaDark)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(tokens.spacingMicro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(tokens.spacingTiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.spacingSmall))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(tokens.spacingStandard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(tokens.spacingSemi))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.spacingLarge))
                }
            }

            describe("#xLarge") {
                it("returns a expect value") {
                    expect(systemUnderTest.xLarge).to(equal(tokens.spacingXLarge))
                }
            }
        } // context - when using NaturaDark as theme

        context("NaturaLight") {
            let tokens = NaturaLightTokens()

            beforeEach {
                DesignSystem().configure(with: .naturaLight)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(tokens.spacingMicro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(tokens.spacingTiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.spacingSmall))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(tokens.spacingStandard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(tokens.spacingSemi))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.spacingLarge))
                }
            }

            describe("#xLarge") {
                it("returns a expect value") {
                    expect(systemUnderTest.xLarge).to(equal(tokens.spacingXLarge))
                }
            }
        } // context - when using NaturaLight as theme

        context("TheBodyShopDark") {
            let tokens = TheBodyShopDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .theBodyShopDark)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(tokens.spacingMicro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(tokens.spacingTiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.spacingSmall))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(tokens.spacingStandard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(tokens.spacingSemi))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.spacingLarge))
                }
            }

            describe("#xLarge") {
                it("returns a expect value") {
                    expect(systemUnderTest.xLarge).to(equal(tokens.spacingXLarge))
                }
            }
        } // context - when using TheBodyShopDark as theme

        context("TheBodyShopLight") {
            let tokens = TheBodyShopLightTokens()

            beforeEach {
                DesignSystem().configure(with: .theBodyShopDark)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(tokens.spacingMicro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(tokens.spacingTiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.spacingSmall))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(tokens.spacingStandard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(tokens.spacingSemi))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.spacingLarge))
                }
            }

            describe("#xLarge") {
                it("returns a expect value") {
                    expect(systemUnderTest.xLarge).to(equal(tokens.spacingXLarge))
                }
            }
        } // context - when using TheBodyShopDark as theme
    }
}
