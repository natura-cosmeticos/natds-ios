import Quick
import Nimble

@testable import NatDS

final class NatOpacitiesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatOpacities.self
        let stubTheme = StubTheme()
        let tokens = stubTheme.tokens

        beforeEach {
            ConfigurationStorage.shared.currentTheme = stubTheme
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
    }
}
