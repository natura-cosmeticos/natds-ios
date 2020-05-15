import Quick
import Nimble

@testable import NatDS

final class NatOpacitiesSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = NatOpacities.self

        context("Avon") {
            let expectedOpacities = AvonOpacities()

            beforeEach {
                DesignSystem().configure(with: .avon)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(expectedOpacities.transparent))
                }
            }

            describe("#opacity01") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity01).to(equal(expectedOpacities.opacity01))
                }
            }

            describe("#opacity02") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity03).to(equal(expectedOpacities.opacity03))
                }
            }

            describe("#opacity04") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity04).to(equal(expectedOpacities.opacity04))
                }
            }

            describe("#opacity05") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity05).to(equal(expectedOpacities.opacity05))
                }
            }

            describe("#opacity06") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity06).to(equal(expectedOpacities.opacity06))
                }
            }

            describe("#opacity07") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity07).to(equal(expectedOpacities.opacity07))
                }
            }

            describe("#opacity08") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity08).to(equal(expectedOpacities.opacity08))
                }
            }

            describe("#opacity09") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity09).to(equal(expectedOpacities.opacity09))
                }
            }

            describe("#opacity10") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity10).to(equal(expectedOpacities.opacity10))
                }
            }

            describe("#full") {
                it("returns a expect value") {
                    expect(systemUnderTest.full).to(equal(expectedOpacities.full))
                }
            }
        } // context - when using Avon as theme

        context("Natura") {
            let expectedOpacities = NaturaOpacities()

            beforeEach {
                DesignSystem().configure(with: .natura)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(expectedOpacities.transparent))
                }
            }

            describe("#opacity01") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity01).to(equal(expectedOpacities.opacity01))
                }
            }

            describe("#opacity02") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity03).to(equal(expectedOpacities.opacity03))
                }
            }

            describe("#opacity04") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity04).to(equal(expectedOpacities.opacity04))
                }
            }

            describe("#opacity05") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity05).to(equal(expectedOpacities.opacity05))
                }
            }

            describe("#opacity06") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity06).to(equal(expectedOpacities.opacity06))
                }
            }

            describe("#opacity07") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity07).to(equal(expectedOpacities.opacity07))
                }
            }

            describe("#opacity08") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity08).to(equal(expectedOpacities.opacity08))
                }
            }

            describe("#opacity09") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity09).to(equal(expectedOpacities.opacity09))
                }
            }

            describe("#opacity10") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity10).to(equal(expectedOpacities.opacity10))
                }
            }

            describe("#full") {
                it("returns a expect value") {
                    expect(systemUnderTest.full).to(equal(expectedOpacities.full))
                }
            }
        } // context - when using Natura as theme

        context("when using The Body Shop as theme") {
            let expectedOpacities = TheBodyShopOpacities()

            beforeEach {
                DesignSystem().configure(with: .theBodyShop)
            }

            describe("#transparent") {
                it("returns a expect value") {
                    expect(systemUnderTest.transparent).to(equal(expectedOpacities.transparent))
                }
            }

            describe("#opacity01") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity01).to(equal(expectedOpacities.opacity01))
                }
            }

            describe("#opacity02") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity03).to(equal(expectedOpacities.opacity03))
                }
            }

            describe("#opacity04") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity04).to(equal(expectedOpacities.opacity04))
                }
            }

            describe("#opacity05") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity05).to(equal(expectedOpacities.opacity05))
                }
            }

            describe("#opacity06") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity06).to(equal(expectedOpacities.opacity06))
                }
            }

            describe("#opacity07") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity07).to(equal(expectedOpacities.opacity07))
                }
            }

            describe("#opacity08") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity08).to(equal(expectedOpacities.opacity08))
                }
            }

            describe("#opacity09") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity09).to(equal(expectedOpacities.opacity09))
                }
            }

            describe("#opacity10") {
                it("returns a expect value") {
                    expect(systemUnderTest.opacity10).to(equal(expectedOpacities.opacity10))
                }
            }

            describe("#full") {
                it("returns a expect value") {
                    expect(systemUnderTest.full).to(equal(expectedOpacities.full))
                }
            }
        } // context - when using The Body Shop as theme
    }
}
