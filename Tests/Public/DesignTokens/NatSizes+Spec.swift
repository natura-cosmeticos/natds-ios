import Quick
import Nimble

@testable import NatDS

final class NatSizesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatSizes.self

        context("Avon") {
            let expectedSizes = AvonSizes()

            beforeEach {
                DesignSystem().configure(with: .avon)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(expectedSizes.micro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(expectedSizes.tiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(expectedSizes.small))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(expectedSizes.standard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(expectedSizes.semi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(expectedSizes.semix))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(expectedSizes.medium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(expectedSizes.mediumx))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedSizes.large))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(expectedSizes.largex))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(expectedSizes.largexx))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(expectedSizes.largexxx))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(expectedSizes.huge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(expectedSizes.hugex))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(expectedSizes.hugexx))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(expectedSizes.hugexxx))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(expectedSizes.veryhuge))
                }
            }
        } // context - when using Avon as theme

        context("Natura") {
            let expectedSizes = NaturaSizes()

            beforeEach {
                DesignSystem().configure(with: .natura)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(expectedSizes.micro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(expectedSizes.tiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(expectedSizes.small))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(expectedSizes.standard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(expectedSizes.semi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(expectedSizes.semix))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(expectedSizes.medium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(expectedSizes.mediumx))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedSizes.large))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(expectedSizes.largex))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(expectedSizes.largexx))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(expectedSizes.largexxx))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(expectedSizes.huge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(expectedSizes.hugex))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(expectedSizes.hugexx))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(expectedSizes.hugexxx))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(expectedSizes.veryhuge))
                }
            }
        } // context - when using Natura as theme

        context("when using The Body Shop as theme") {
            let expectedSizes = TheBodyShopSizes()

            beforeEach {
                DesignSystem().configure(with: .theBodyShop)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(expectedSizes.micro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(expectedSizes.tiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(expectedSizes.small))
                }
            }

            describe("#standard") {
                it("returns a expect value") {
                    expect(systemUnderTest.standard).to(equal(expectedSizes.standard))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(expectedSizes.semi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(expectedSizes.semix))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(expectedSizes.medium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(expectedSizes.mediumx))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedSizes.large))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(expectedSizes.largex))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(expectedSizes.largexx))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(expectedSizes.largexxx))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(expectedSizes.huge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(expectedSizes.hugex))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(expectedSizes.hugexx))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(expectedSizes.hugexxx))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(expectedSizes.veryhuge))
                }
            }
        } // context - when using The Body Shop as theme
    }
}
