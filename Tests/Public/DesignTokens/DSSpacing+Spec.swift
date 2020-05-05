import Quick
import Nimble

@testable import NatDS

// swiftlint:disable function_body_length

final class DSSpacingSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = DSSpacing.self

        context("Avon") {
            let expectedSpacing = AvonSpacing()

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

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedSpacing.large))
                }
            }

            describe("#xLarge") {
                it("returns a expect value") {
                    expect(systemUnderTest.xLarge).to(equal(expectedSpacing.xLarge))
                }
            }
        } // context - when using Avon as theme

        context("Natura") {
            let expectedSpacing = NaturaSpacing()

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

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedSpacing.large))
                }
            }

            describe("#xLarge") {
                it("returns a expect value") {
                    expect(systemUnderTest.xLarge).to(equal(expectedSpacing.xLarge))
                }
            }
        } // context - when using Natura as theme

        context("when using The Body Shop as theme") {
            let expectedSpacing = TheBodyShopSpacing()

            beforeEach {
                DesignSystem().configure(with: .theBodyShop)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(4))
                }
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

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedSpacing.large))
                }
            }

            describe("#xLarge") {
                it("returns a expect value") {
                    expect(systemUnderTest.xLarge).to(equal(expectedSpacing.xLarge))
                }
            }
        } // context - when using The Body Shop as theme
    }
}
