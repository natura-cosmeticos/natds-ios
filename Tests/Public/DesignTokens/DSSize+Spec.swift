import Quick
import Nimble

@testable import NatDS

// swiftlint:disable function_body_length

final class DSSizeSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = DSSize.self

        context("Avon") {
            let expectedSpacing = AvonSize()

            beforeEach {
                DesignSystem().configure(with: .avon)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(expectedSpacing.micro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(expectedSpacing.tiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(expectedSpacing.small))
                }
            }

            describe("#standart") {
                it("returns a expect value") {
                    expect(systemUnderTest.standart).to(equal(expectedSpacing.standart))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(expectedSpacing.semi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(expectedSpacing.semiX))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(expectedSpacing.medium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(expectedSpacing.mediumX))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedSpacing.large))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(expectedSpacing.largeX))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(expectedSpacing.largeXX))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(expectedSpacing.largeXXX))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(expectedSpacing.huge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(expectedSpacing.hugeX))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(expectedSpacing.hugeXX))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(expectedSpacing.hugeXXX))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(expectedSpacing.veryHuge))
                }
            }
        } // context - when using Avon as theme

        context("Natura") {
            let expectedSpacing = NaturaSize()

            beforeEach {
                DesignSystem().configure(with: .natura)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(expectedSpacing.micro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(expectedSpacing.tiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(expectedSpacing.small))
                }
            }

            describe("#standart") {
                it("returns a expect value") {
                    expect(systemUnderTest.standart).to(equal(expectedSpacing.standart))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(expectedSpacing.semi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(expectedSpacing.semiX))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(expectedSpacing.medium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(expectedSpacing.mediumX))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedSpacing.large))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(expectedSpacing.largeX))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(expectedSpacing.largeXX))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(expectedSpacing.largeXXX))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(expectedSpacing.huge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(expectedSpacing.hugeX))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(expectedSpacing.hugeXX))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(expectedSpacing.hugeXXX))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(expectedSpacing.veryHuge))
                }
            }
        } // context - when using Natura as theme

        context("when using The Body Shop as theme") {
            let expectedSpacing = TheBodyShopSize()

            beforeEach {
                DesignSystem().configure(with: .theBodyShop)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(expectedSpacing.micro))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(expectedSpacing.tiny))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(expectedSpacing.small))
                }
            }

            describe("#standart") {
                it("returns a expect value") {
                    expect(systemUnderTest.standart).to(equal(expectedSpacing.standart))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(expectedSpacing.semi))
                }
            }

            describe("#semiX") {
                it("returns a expect value") {
                    expect(systemUnderTest.semiX).to(equal(expectedSpacing.semiX))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(expectedSpacing.medium))
                }
            }

            describe("#mediumX") {
                it("returns a expect value") {
                    expect(systemUnderTest.mediumX).to(equal(expectedSpacing.mediumX))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedSpacing.large))
                }
            }

            describe("#largeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeX).to(equal(expectedSpacing.largeX))
                }
            }

            describe("#largeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXX).to(equal(expectedSpacing.largeXX))
                }
            }

            describe("#largeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.largeXXX).to(equal(expectedSpacing.largeXXX))
                }
            }

            describe("#huge") {
                it("returns a expect value") {
                    expect(systemUnderTest.huge).to(equal(expectedSpacing.huge))
                }
            }

            describe("#hugeX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeX).to(equal(expectedSpacing.hugeX))
                }
            }

            describe("#hugeXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXX).to(equal(expectedSpacing.hugeXX))
                }
            }

            describe("#hugeXXX") {
                it("returns a expect value") {
                    expect(systemUnderTest.hugeXXX).to(equal(expectedSpacing.hugeXXX))
                }
            }

            describe("#veryHuge") {
                it("returns a expect value") {
                    expect(systemUnderTest.veryHuge).to(equal(expectedSpacing.veryHuge))
                }
            }
        } // context - when using The Body Shop as theme
    }
}
