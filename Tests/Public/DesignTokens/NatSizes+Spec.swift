import Quick
import Nimble

@testable import NatDS

final class NatSizesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatSizes.self

        context("AvonDark") {
            let tokens = AvonDarkTokens()

            beforeEach {
                DesignSystem().configure(with: .avonDark)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(tokens.sizeMicro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(tokens.sizeTiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.sizeSmall))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(tokens.sizeStandard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(tokens.sizeSemi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(tokens.sizeSemiX))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.sizeMedium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(tokens.sizeMediumX))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.sizeLarge))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(tokens.sizeLargeX))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(tokens.sizeLargeXx))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(tokens.sizeLargeXxx))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(tokens.sizeHuge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(tokens.sizeHugeX))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(tokens.sizeHugeXx))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(tokens.sizeHugeXxx))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(tokens.sizeVeryHuge))
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
                    expect(systemUnderTest.micro).to(equal(tokens.sizeMicro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(tokens.sizeTiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.sizeSmall))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(tokens.sizeStandard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(tokens.sizeSemi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(tokens.sizeSemiX))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.sizeMedium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(tokens.sizeMediumX))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.sizeLarge))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(tokens.sizeLargeX))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(tokens.sizeLargeXx))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(tokens.sizeLargeXxx))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(tokens.sizeHuge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(tokens.sizeHugeX))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(tokens.sizeHugeXx))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(tokens.sizeHugeXxx))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(tokens.sizeVeryHuge))
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
                    expect(systemUnderTest.micro).to(equal(tokens.sizeMicro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(tokens.sizeTiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.sizeSmall))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(tokens.sizeStandard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(tokens.sizeSemi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(tokens.sizeSemiX))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.sizeMedium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(tokens.sizeMediumX))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.sizeLarge))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(tokens.sizeLargeX))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(tokens.sizeLargeXx))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(tokens.sizeLargeXxx))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(tokens.sizeHuge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(tokens.sizeHugeX))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(tokens.sizeHugeXx))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(tokens.sizeHugeXxx))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(tokens.sizeVeryHuge))
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
                    expect(systemUnderTest.micro).to(equal(tokens.sizeMicro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(tokens.sizeTiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.sizeSmall))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(tokens.sizeStandard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(tokens.sizeSemi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(tokens.sizeSemiX))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.sizeMedium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(tokens.sizeMediumX))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.sizeLarge))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(tokens.sizeLargeX))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(tokens.sizeLargeXx))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(tokens.sizeLargeXxx))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(tokens.sizeHuge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(tokens.sizeHugeX))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(tokens.sizeHugeXx))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(tokens.sizeHugeXxx))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(tokens.sizeVeryHuge))
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
                    expect(systemUnderTest.micro).to(equal(tokens.sizeMicro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(tokens.sizeTiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.sizeSmall))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(tokens.sizeStandard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(tokens.sizeSemi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(tokens.sizeSemiX))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.sizeMedium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(tokens.sizeMediumX))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.sizeLarge))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(tokens.sizeLargeX))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(tokens.sizeLargeXx))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(tokens.sizeLargeXxx))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(tokens.sizeHuge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(tokens.sizeHugeX))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(tokens.sizeHugeXx))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(tokens.sizeHugeXxx))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(tokens.sizeVeryHuge))
                }
            }
        } // context - when using TheBodyShopDark as theme

        context("TheBodyShopLight") {
            let tokens = TheBodyShopLightTokens()

            beforeEach {
                DesignSystem().configure(with: .theBodyShopLight)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(tokens.sizeMicro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(tokens.sizeTiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(tokens.sizeSmall))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(tokens.sizeStandard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(tokens.sizeSemi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(tokens.sizeSemiX))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(tokens.sizeMedium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(tokens.sizeMediumX))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(tokens.sizeLarge))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(tokens.sizeLargeX))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(tokens.sizeLargeXx))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(tokens.sizeLargeXxx))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(tokens.sizeHuge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(tokens.sizeHugeX))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(tokens.sizeHugeXx))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(tokens.sizeHugeXxx))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(tokens.sizeVeryHuge))
                }
            }
        } // context - when using TheBodyShopLight as theme
    }
}
