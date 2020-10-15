import Quick
import Nimble

@testable import NatDS

final class AvonDarkTokensElevationSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = AvonDarkTheme().tokens

        describe("#elevationNoneShadowColor") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationNoneShadowColor).to(equal("nil"))
            }
        }

        describe("#elevationNoneShadowOffsetWidth") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationNoneShadowOffsetWidth).to(equal(0))
            }
        }

        describe("#elevationNoneShadowOffsetHeight") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationNoneShadowOffsetHeight).to(equal(-3))
            }
        }

        describe("#elevationNoneShadowRadius") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationNoneShadowRadius).to(equal(3))
            }
        }

        describe("#elevationNoneShadowOpacity") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationNoneShadowOpacity).to(equal(0))
            }
        }

        describe("#elevationMicroShadowColor") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationMicroShadowColor).to(equal("#000000"))
            }
        }

        describe("#elevationMicroShadowOffsetWidth") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationMicroShadowOffsetWidth).to(equal(0))
            }
        }

        describe("#elevationMicroShadowOffsetHeight") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationMicroShadowOffsetHeight).to(equal(1))
            }
        }

        describe("#elevationMicroShadowRadius") {
            it("returns an expected values") {
                expect(systemUnderTest.elevationMicroShadowRadius).to(equal(1))
            }
        }

        describe("#elevationMicroShadowOpacity") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationMicroShadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevationTinyShadowColor") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationTinyShadowColor).to(equal("#000000"))
            }
        }

        describe("#elevationTinyShadowOffsetWidth") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationTinyShadowOffsetWidth).to(equal(0))
            }
        }

        describe("#elevationTinyShadowOffsetHeight") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationTinyShadowOffsetHeight).to(equal(2))
            }
        }

        describe("#elevationTinyShadowRadius") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationTinyShadowRadius).to(equal(2))
            }
        }

        describe("#elevationTinyShadowOpacity") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationTinyShadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevationSmallShadowColor") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationSmallShadowColor).to(equal("#000000"))
            }
        }

        describe("#elevationSmallShadowOffsetWidth") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationSmallShadowOffsetWidth).to(equal(0))
            }
        }

        describe("#elevationSmallShadowOffsetHeight") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationSmallShadowOffsetHeight).to(equal(3))
            }
        }

        describe("#elevationSmallShadowRadius") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationSmallShadowRadius).to(equal(4))
            }
        }

        describe("#elevationSmallShadowOpacity") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationSmallShadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevationMediumShadowColor") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationMediumShadowColor).to(equal("#000000"))
            }
        }

        describe("#elevationMediumShadowOffsetWidth") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationMediumShadowOffsetWidth).to(equal(0))
            }
        }

        describe("#elevationMediumShadowOffsetHeight") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationMediumShadowOffsetHeight).to(equal(4))
            }
        }

        describe("#elevationMediumShadowRadius") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationMediumShadowRadius).to(equal(5))
            }
        }

        describe("#elevationMediumShadowOpacity") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationMediumShadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevationLargeShadowColor") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeShadowColor).to(equal("#000000"))
            }
        }

        describe("#elevationLargeShadowOffsetWidth") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeShadowOffsetWidth).to(equal(0))
            }
        }

        describe("#elevationLargeShadowOffsetHeight") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeShadowOffsetHeight).to(equal(6))
            }
        }

        describe("#elevationLargeShadowRadius") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeShadowRadius).to(equal(10))
            }
        }

        describe("#elevationLargeShadowOpacity") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeShadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevationLargeXShadowColor") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeXShadowColor).to(equal("#000000"))
            }
        }

        describe("#elevationLargeXShadowOffsetWidth") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeXShadowOffsetWidth).to(equal(0))
            }
        }

        describe("#elevationLargeXShadowOffsetHeight") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeXShadowOffsetHeight).to(equal(8))
            }
        }

        describe("#elevationLargeXShadowRadius") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeXShadowRadius).to(equal(10))
            }
        }

        describe("#elevationLargeXShadowOpacity") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeXShadowOpacity).to(equal(0.14))
            }
        }
        describe("#elevationLargeXXShadowColor") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeXXShadowColor).to(equal("#000000"))
            }
        }

        describe("#elevationLargeXXShadowOffsetWidth") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeXXShadowOffsetWidth).to(equal(0))
            }
        }

        describe("#elevationLargeXXShadowOffsetHeight") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeXXShadowOffsetHeight).to(equal(9))
            }
        }

        describe("#elevationLargeXXShadowRadius") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeXXShadowRadius).to(equal(12))
            }
        }

        describe("#elevationLargeXXShadowOpacity") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationLargeXXShadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevationHugeShadowColor") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeShadowColor).to(equal("#000000"))
            }
        }

        describe("#elevationHugeShadowOffsetWidth") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeShadowOffsetWidth).to(equal(0))
            }
        }

        describe("#elevationHugeShadowOffsetHeight") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeShadowOffsetHeight).to(equal(12))
            }
        }

        describe("#elevationHugeShadowRadius") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeShadowRadius).to(equal(17))
            }
        }

        describe("#elevationHugeShadowOpacity") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeShadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevationHugeXShadowColor") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeXShadowColor).to(equal("#000000"))
            }
        }

        describe("#elevationHugeXShadowOffsetWidth") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeXShadowOffsetWidth).to(equal(0))
            }
        }

        describe("#elevationHugeXShadowOffsetHeight") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeXShadowOffsetHeight).to(equal(16))
            }
        }

        describe("#elevationHugeXShadowRadius") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeXShadowRadius).to(equal(24))
            }
        }

        describe("#elevationHugeXShadowOpacity") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeXShadowOpacity).to(equal(0.14))
            }
        }

        describe("#elevationHugeXXShadowColor") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeXXShadowColor).to(equal("#000000"))
            }
        }

        describe("#elevationHugeXXShadowOffsetWidth") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeXXShadowOffsetWidth).to(equal(0))
            }
        }

        describe("#elevationHugeXXShadowOffsetHeight") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeXXShadowOffsetHeight).to(equal(24))
            }
        }

        describe("#elevationHugeXXShadowRadius") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeXXShadowRadius).to(equal(38))
            }
        }

        describe("#elevationHugeXXShadowOpacity") {
            it("returns an expected value") {
                expect(systemUnderTest.elevationHugeXXShadowOpacity).to(equal(0.14))
            }
        }
    }
}
