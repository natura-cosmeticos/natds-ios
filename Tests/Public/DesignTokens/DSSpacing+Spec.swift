import Quick
import Nimble

@testable import NatDS

// swiftlint:disable function_body_length

final class DSSpacingSpec: QuickSpec {
    override func spec() {
        let systemUnderTest = DSSpacing.self

        context("Avon") {
            beforeEach {
                DesignSystem().configure(with: .avon)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(4))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(8))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(16))
                }
            }

            describe("#standart") {
                it("returns a expect value") {
                    expect(systemUnderTest.standart).to(equal(24))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(32))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(48))
                }
            }

            describe("#xLarge") {
                it("returns a expect value") {
                    expect(systemUnderTest.xLarge).to(equal(64))
                }
            }
        } // context - when using Avon as theme

        context("Natura") {
            beforeEach {
                DesignSystem().configure(with: .natura)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(4))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(8))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(16))
                }
            }

            describe("#standart") {
                it("returns a expect value") {
                    expect(systemUnderTest.standart).to(equal(24))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(32))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(48))
                }
            }

            describe("#xLarge") {
                it("returns a expect value") {
                    expect(systemUnderTest.xLarge).to(equal(64))
                }
            }
        } // context - when using Natura as theme

        context("when using The Body Shop as theme") {
            beforeEach {
                DesignSystem().configure(with: .theBodyShop)
            }

            describe("#micro") {
                it("returns a expect value") {
                    expect(systemUnderTest.micro).to(equal(4))
                }
            }

            describe("#tiny") {
                it("returns a expect value") {
                    expect(systemUnderTest.tiny).to(equal(8))
                }
            }

            describe("#small") {
                it("returns a expect value") {
                    expect(systemUnderTest.small).to(equal(16))
                }
            }

            describe("#standart") {
                it("returns a expect value") {
                    expect(systemUnderTest.standart).to(equal(24))
                }
            }

            describe("#semi") {
                it("returns a expect value") {
                    expect(systemUnderTest.semi).to(equal(32))
                }
            }

            describe("#large") {
                it("returns a expect value") {
                    expect(systemUnderTest.large).to(equal(48))
                }
            }

            describe("#xLarge") {
                it("returns a expect value") {
                    expect(systemUnderTest.xLarge).to(equal(64))
                }
            }
        } // context - when using The Body Shop as theme
    }
}
