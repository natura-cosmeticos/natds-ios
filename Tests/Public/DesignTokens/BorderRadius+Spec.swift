import Quick
import Nimble

@testable import NatDS

// swiftlint:disable function_body_length

final class DSBorderRadiusSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = DSBorderRadius.self

        context("Avon") {
            let expectedBorderRadius = AvonBorderRadius()

            beforeEach {
                DesignSystem().configure(with: .avon)
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(expectedBorderRadius.small))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(expectedBorderRadius.medium))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedBorderRadius.large))
                }
            }

            describe("#circle") {
                it("returns a expect value") {
                    expect(systemUnderTest.circle(viewHeight: 2))
                        .to(equal(expectedBorderRadius.circle(viewHeight: 2)))
                }

                it("returns a expect value") {
                    expect(systemUnderTest.circle(viewHeight: 1))
                        .to(equal(expectedBorderRadius.circle(viewHeight: 1)))
                }
            }
        } // context - when using Avon as theme

        context("Natura") {
            let expectedBorderRadius = NaturaBorderRadius()

            beforeEach {
                DesignSystem().configure(with: .natura)
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(expectedBorderRadius.small))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(expectedBorderRadius.medium))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedBorderRadius.large))
                }
            }

            describe("#circle") {
                it("returns a expect value") {
                    expect(systemUnderTest.circle(viewHeight: 2))
                        .to(equal(expectedBorderRadius.circle(viewHeight: 2)))
                }

                it("returns a expect value") {
                    expect(systemUnderTest.circle(viewHeight: 1))
                        .to(equal(expectedBorderRadius.circle(viewHeight: 1)))
                }
            }
        } // context - when using Natura as theme

        context("when using The Body Shop as theme") {
            let expectedBorderRadius = TheBodyShopBorderRadius()

            beforeEach {
                DesignSystem().configure(with: .theBodyShop)
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(expectedBorderRadius.small))
                }
            }

            describe("#medium") {
                it("returns a expect value") {
                    expect(systemUnderTest.medium).to(equal(expectedBorderRadius.medium))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(expectedBorderRadius.large))
                }
            }

            describe("#circle") {
                it("returns a expect value") {
                    expect(systemUnderTest.circle(viewHeight: 2))
                        .to(equal(expectedBorderRadius.circle(viewHeight: 2)))
                }

                it("returns a expect value") {
                    expect(systemUnderTest.circle(viewHeight: 1))
                        .to(equal(expectedBorderRadius.circle(viewHeight: 1)))
                }
            }
        } // context - when using The Body Shop as theme
    }
}
