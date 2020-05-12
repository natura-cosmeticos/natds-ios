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

            describe("#standart") {
                it("returns a expect value") {
                    expect(systemUnderTest.standart).to(equal(expectedSizes.standart))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(expectedSizes.semi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(expectedSizes.semiX))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(expectedSizes.medium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(expectedSizes.mediumX))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedSizes.large))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(expectedSizes.largeX))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(expectedSizes.largeXX))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(expectedSizes.largeXXX))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(expectedSizes.huge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(expectedSizes.hugeX))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(expectedSizes.hugeXX))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(expectedSizes.hugeXXX))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(expectedSizes.veryHuge))
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

            describe("#standart") {
                it("returns a expect value") {
                    expect(systemUnderTest.standart).to(equal(expectedSizes.standart))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(expectedSizes.semi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(expectedSizes.semiX))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(expectedSizes.medium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(expectedSizes.mediumX))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedSizes.large))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(expectedSizes.largeX))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(expectedSizes.largeXX))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(expectedSizes.largeXXX))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(expectedSizes.huge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(expectedSizes.hugeX))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(expectedSizes.hugeXX))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(expectedSizes.hugeXXX))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(expectedSizes.veryHuge))
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

            describe("#standart") {
                it("returns a expect value") {
                    expect(systemUnderTest.standart).to(equal(expectedSizes.standart))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(expectedSizes.semi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(expectedSizes.semiX))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(expectedSizes.medium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(expectedSizes.mediumX))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedSizes.large))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(expectedSizes.largeX))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(expectedSizes.largeXX))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(expectedSizes.largeXXX))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(expectedSizes.huge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(expectedSizes.hugeX))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(expectedSizes.hugeXX))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(expectedSizes.hugeXXX))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(expectedSizes.veryHuge))
                }
            }
        } // context - when using The Body Shop as theme
    }
}
