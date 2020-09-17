import Quick
import Nimble

@testable import NatDS

final class NatOpacitiesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatOpacities.self

        context("AesopDark") {
            let tokens = AesopDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .aesopDark)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#lower") {
                it("returns a expect value") {
                    expect(systemUnderTest.lower).to(equal(tokens.opacityLower))
                }
            }

            describe("#veryLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryLow).to(equal(tokens.opacityVeryLow))
                }
            }

            describe("#low") {
                it("returns a expect value") {
                    expect(systemUnderTest.low).to(equal(tokens.opacityLow))
                }
            }

            describe("#mediumLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumLow).to(equal(tokens.opacityMediumLow))
                }
            }

            describe("#disabledLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabledLow).to(equal(tokens.opacityDisabledLow))
                }
            }

            describe("#disabled") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabled).to(equal(tokens.opacityDisabled))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.opacityMedium))
                }
            }

            describe("#mediumHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumHigh).to(equal(tokens.opacityMediumHigh))
                }
            }

            describe("#high") {
                it("returns a expect value") {
                    expect(systemUnderTest.high).to(equal(tokens.opacityHigh))
                }
            }

            describe("#veryHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHigh).to(equal(tokens.opacityVeryHigh))
                }
            }

            describe("#opaque") {
                it("returns a expect value") {
                    expect(systemUnderTest.opaque).to(equal(tokens.opacityOpaque))
                }
            }
        } // context - when using AesopDark as theme

        context("AesopLight") {
            let tokens = AesopLightTokens()

            beforeEach {
                DesignSystem().configure(with: .aesopLight)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#lower") {
                it("returns a expect value") {
                    expect(systemUnderTest.lower).to(equal(tokens.opacityLower))
                }
            }

            describe("#veryLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryLow).to(equal(tokens.opacityVeryLow))
                }
            }

            describe("#low") {
                it("returns a expect value") {
                    expect(systemUnderTest.low).to(equal(tokens.opacityLow))
                }
            }

            describe("#mediumLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumLow).to(equal(tokens.opacityMediumLow))
                }
            }

            describe("#disabledLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabledLow).to(equal(tokens.opacityDisabledLow))
                }
            }

            describe("#disabled") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabled).to(equal(tokens.opacityDisabled))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.opacityMedium))
                }
            }

            describe("#mediumHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumHigh).to(equal(tokens.opacityMediumHigh))
                }
            }

            describe("#high") {
                it("returns a expect value") {
                    expect(systemUnderTest.high).to(equal(tokens.opacityHigh))
                }
            }

            describe("#veryHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHigh).to(equal(tokens.opacityVeryHigh))
                }
            }

            describe("#opaque") {
                it("returns a expect value") {
                    expect(systemUnderTest.opaque).to(equal(tokens.opacityOpaque))
                }
            }
        } // context - when using AesopLight as theme

        context("AvonDark") {
            let tokens = AvonDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .avonDark)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#lower") {
                it("returns a expect value") {
                    expect(systemUnderTest.lower).to(equal(tokens.opacityLower))
                }
            }

            describe("#veryLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryLow).to(equal(tokens.opacityVeryLow))
                }
            }

            describe("#low") {
                it("returns a expect value") {
                    expect(systemUnderTest.low).to(equal(tokens.opacityLow))
                }
            }

            describe("#mediumLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumLow).to(equal(tokens.opacityMediumLow))
                }
            }

            describe("#disabledLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabledLow).to(equal(tokens.opacityDisabledLow))
                }
            }

            describe("#disabled") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabled).to(equal(tokens.opacityDisabled))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.opacityMedium))
                }
            }

            describe("#mediumHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumHigh).to(equal(tokens.opacityMediumHigh))
                }
            }

            describe("#high") {
                it("returns a expect value") {
                    expect(systemUnderTest.high).to(equal(tokens.opacityHigh))
                }
            }

            describe("#veryHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHigh).to(equal(tokens.opacityVeryHigh))
                }
            }

            describe("#opaque") {
                it("returns a expect value") {
                    expect(systemUnderTest.opaque).to(equal(tokens.opacityOpaque))
                }
            }
        } // context - when using AvonDark as theme

        context("AvonLight") {
            let tokens = AvonLightTokens()

            beforeEach {
                DesignSystem().configure(with: .avonLight)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#lower") {
                it("returns a expect value") {
                    expect(systemUnderTest.lower).to(equal(tokens.opacityLower))
                }
            }

            describe("#veryLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryLow).to(equal(tokens.opacityVeryLow))
                }
            }

            describe("#low") {
                it("returns a expect value") {
                    expect(systemUnderTest.low).to(equal(tokens.opacityLow))
                }
            }

            describe("#mediumLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumLow).to(equal(tokens.opacityMediumLow))
                }
            }

            describe("#disabledLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabledLow).to(equal(tokens.opacityDisabledLow))
                }
            }

            describe("#disabled") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabled).to(equal(tokens.opacityDisabled))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.opacityMedium))
                }
            }

            describe("#mediumHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumHigh).to(equal(tokens.opacityMediumHigh))
                }
            }

            describe("#high") {
                it("returns a expect value") {
                    expect(systemUnderTest.high).to(equal(tokens.opacityHigh))
                }
            }

            describe("#veryHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHigh).to(equal(tokens.opacityVeryHigh))
                }
            }

            describe("#opaque") {
                it("returns a expect value") {
                    expect(systemUnderTest.opaque).to(equal(tokens.opacityOpaque))
                }
            }
        } // context - when using AvonLight as theme

        context("NaturaDark") {
            let tokens = NaturaDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .naturaDark)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#lower") {
                it("returns a expect value") {
                    expect(systemUnderTest.lower).to(equal(tokens.opacityLower))
                }
            }

            describe("#veryLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryLow).to(equal(tokens.opacityVeryLow))
                }
            }

            describe("#low") {
                it("returns a expect value") {
                    expect(systemUnderTest.low).to(equal(tokens.opacityLow))
                }
            }

            describe("#mediumLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumLow).to(equal(tokens.opacityMediumLow))
                }
            }

            describe("#disabledLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabledLow).to(equal(tokens.opacityDisabledLow))
                }
            }

            describe("#disabled") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabled).to(equal(tokens.opacityDisabled))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.opacityMedium))
                }
            }

            describe("#mediumHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumHigh).to(equal(tokens.opacityMediumHigh))
                }
            }

            describe("#high") {
                it("returns a expect value") {
                    expect(systemUnderTest.high).to(equal(tokens.opacityHigh))
                }
            }

            describe("#veryHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHigh).to(equal(tokens.opacityVeryHigh))
                }
            }

            describe("#opaque") {
                it("returns a expect value") {
                    expect(systemUnderTest.opaque).to(equal(tokens.opacityOpaque))
                }
            }
        } // context - when using NaturaDark as theme

        context("NaturaLight") {
            let tokens = NaturaLightTokens()

            beforeEach {
                DesignSystem().configure(with: .naturaLight)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#lower") {
                it("returns a expect value") {
                    expect(systemUnderTest.lower).to(equal(tokens.opacityLower))
                }
            }

            describe("#veryLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryLow).to(equal(tokens.opacityVeryLow))
                }
            }

            describe("#low") {
                it("returns a expect value") {
                    expect(systemUnderTest.low).to(equal(tokens.opacityLow))
                }
            }

            describe("#mediumLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumLow).to(equal(tokens.opacityMediumLow))
                }
            }

            describe("#disabledLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabledLow).to(equal(tokens.opacityDisabledLow))
                }
            }

            describe("#disabled") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabled).to(equal(tokens.opacityDisabled))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.opacityMedium))
                }
            }

            describe("#mediumHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumHigh).to(equal(tokens.opacityMediumHigh))
                }
            }

            describe("#high") {
                it("returns a expect value") {
                    expect(systemUnderTest.high).to(equal(tokens.opacityHigh))
                }
            }

            describe("#veryHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHigh).to(equal(tokens.opacityVeryHigh))
                }
            }

            describe("#opaque") {
                it("returns a expect value") {
                    expect(systemUnderTest.opaque).to(equal(tokens.opacityOpaque))
                }
            }
        } // context - when using NaturaLight as theme

        context("TheBodyShopDark") {
            let tokens = TheBodyShopDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .theBodyShopDark)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#lower") {
                it("returns a expect value") {
                    expect(systemUnderTest.lower).to(equal(tokens.opacityLower))
                }
            }

            describe("#veryLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryLow).to(equal(tokens.opacityVeryLow))
                }
            }

            describe("#low") {
                it("returns a expect value") {
                    expect(systemUnderTest.low).to(equal(tokens.opacityLow))
                }
            }

            describe("#mediumLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumLow).to(equal(tokens.opacityMediumLow))
                }
            }

            describe("#disabledLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabledLow).to(equal(tokens.opacityDisabledLow))
                }
            }

            describe("#disabled") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabled).to(equal(tokens.opacityDisabled))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.opacityMedium))
                }
            }

            describe("#mediumHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumHigh).to(equal(tokens.opacityMediumHigh))
                }
            }

            describe("#high") {
                it("returns a expect value") {
                    expect(systemUnderTest.high).to(equal(tokens.opacityHigh))
                }
            }

            describe("#veryHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHigh).to(equal(tokens.opacityVeryHigh))
                }
            }

            describe("#opaque") {
                it("returns a expect value") {
                    expect(systemUnderTest.opaque).to(equal(tokens.opacityOpaque))
                }
            }
        } // context - when using TheBodyShopDark as theme

        context("TheBodyShopLight") {
            let tokens = TheBodyShopLightTokens()

            beforeEach {
                DesignSystem().configure(with: .theBodyShopLight)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(tokens.opacityTransparent))
                }
            }

            describe("#lower") {
                it("returns a expect value") {
                    expect(systemUnderTest.lower).to(equal(tokens.opacityLower))
                }
            }

            describe("#veryLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryLow).to(equal(tokens.opacityVeryLow))
                }
            }

            describe("#low") {
                it("returns a expect value") {
                    expect(systemUnderTest.low).to(equal(tokens.opacityLow))
                }
            }

            describe("#mediumLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumLow).to(equal(tokens.opacityMediumLow))
                }
            }

            describe("#disabledLow") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabledLow).to(equal(tokens.opacityDisabledLow))
                }
            }

            describe("#disabled") {
                it("returns a expect value") {
                    expect(systemUnderTest.disabled).to(equal(tokens.opacityDisabled))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.opacityMedium))
                }
            }

            describe("#mediumHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumHigh).to(equal(tokens.opacityMediumHigh))
                }
            }

            describe("#high") {
                it("returns a expect value") {
                    expect(systemUnderTest.high).to(equal(tokens.opacityHigh))
                }
            }

            describe("#veryHigh") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHigh).to(equal(tokens.opacityVeryHigh))
                }
            }

            describe("#opaque") {
                it("returns a expect value") {
                    expect(systemUnderTest.opaque).to(equal(tokens.opacityOpaque))
                }
            }
        } // context - when using TheBodyShopLight as theme
    }
}
